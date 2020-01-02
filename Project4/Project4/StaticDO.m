% StaticDO.m
%
% Example Category:
%    DIO
% Matlab(2010 or 2010 above)
%
% Description:
%    This example demonstrates how to use Static DO function.
%
% Instructions for Running:
%    1. Set the 'deviceDescription' for opening the device.
%    2. Set the 'startPort' as the first port for Do.
%    3. Set the 'portCount' to decide how many sequential ports to
%       operate Do.
%
% I/O Connections Overview:
%    Please refer to your hardware reference manual.

function handles = StaticDO(handles)

% Make Automation.BDaq assembly visible to MATLAB.
BDaq = NET.addAssembly('Automation.BDaq4');

% Configure the following three parameters before running the demo.
% The default device of project is demo device, users can choose other
% devices according to their needs.
deviceDescription = 'USB-4704,BID#0';
startPort = int32(0);
portCount = int32(1);

global Designed_T;
Designed_T = handles.Designed_T ;

f = handles.f;
f=2*f;
per = double(1/f);
%T为方波周期
T = 2*per;

errorCode = Automation.BDaq.ErrorCode.Success;

% Step 1: Create a 'InstantDoCtrl' for DO function.
instantDoCtrl = Automation.BDaq.InstantDoCtrl();

try
    % Step 2: Select a device by device number or device description and
    % specify the access mode. In this example we use
    % AccessWriteWithReset(default) mode so that we can fully control the
    % device, including configuring, sampling, etc.
    instantDoCtrl.SelectedDevice = Automation.BDaq.DeviceInformation(...
        deviceDescription);
    
    % Step 3: Write DO ports
    bufferForWriting = NET.createArray('System.Byte', int32(64));
    
    %     stop(t);
    %     delete(t);
    
    %     for i = 0:(portCount - 1)
    % fprintf('Input a hexadecimal number for DO port %d to output', ...
    %    startPort + i);
    % strData = input('(for example, 0x11)\n', 's');
    % strData = System.String(strData);
    % if strData.Substring(0, 2) == '0x'
    %   strData = strData.Remove(0, 2);
    % end
    % strData = hex2dec(char(strData));
    % strdata2=dec2bin(strData);
    
    
    %  disp(strdata2);
    %         bufferForWriting.Set(i, strData);
    %     end
    errorCode = instantDoCtrl.Write(startPort, portCount, ...
        bufferForWriting);
    disp(errorCode);
    if BioFailed(errorCode)
        throw  Exception();
    end
    %     disp('DO output completed!');
    % Read back the DO status.
    % Note:
    % For relay output, the read back must be deferred until
    % the relay is stable.
    % The delay time is decided by the HW SPEC.
    bufferForReading = NET.createArray('System.Byte', int32(64));
    instantDoCtrl.Read(startPort, portCount, bufferForReading);
    if BioFailed(errorCode)
        throw  Exception();
    end
    
    global t_DO;
    t_DO = timer('TimerFcn',{@TimerCallback, instantDoCtrl, ...
        startPort, portCount,bufferForWriting,bufferForReading},'period',per, 'executionmode', 'fixedrate', ...
        'StartDelay', 1);
    start(t_DO);
    
    % Show DO ports' status
    
    %    for i = startPort:(portCount + startPort - 1)
    %        fprintf('Now, DO port %d status is:  0x%X\n', i, ...
    %             bufferForReading.Get(i - startPort));
    %
    %     end
    %  p=bufferForReading.Get(i - startPort);
    % disp(p);
catch e
    % Something is wrong.
    if BioFailed(errorCode)
        errStr = 'Some error occurred. And the last error code is ' ...
            + errorCode.ToString();
    else
        errStr = e.message;
    end
    disp(errStr);
end

%stop(t);
%delete(t);
% Step 4: Close device and release any allocated resource.
%instantDoCtrl.Dispose();

end

function result = BioFailed(errorCode)

result =  errorCode < Automation.BDaq.ErrorCode.Success && ...
    errorCode >= Automation.BDaq.ErrorCode.ErrorHandleNotValid;

end

function TimerCallback(obj, event, instantDoCtrl,startPort, portCount,bufferForWriting,bufferForReading)
global Designed_T;

%i用来计算当前周期数
global i;
global t_DO;
if isempty(i)
    i = 0;
end

persistent DOout;
if isempty(DOout)
    DOout = 0;
end

DOout = 1 - DOout;
%bufferForWriting.Set(0, int32(1));
%strData = System.String('0x1');
%if strData.Substring(0, 2) == '0x'
%  strData = strData.Remove(0, 2);
%end
%strData = hex2dec(char(strData));
bufferForWriting.Set(0, DOout);
errorCode = instantDoCtrl.Write(startPort, portCount, bufferForWriting);
disp(errorCode);
instantDoCtrl.Read(startPort, portCount, bufferForReading);

fprintf('Now, DO port 0 status is:  0x%X\n', ...
    bufferForReading.Get(0));
fprintf('Now, DO port 0 status is:  0x%X\n', ...
    bufferForWriting.Get(0));

%固定周期输出
if (Designed_T>0)
%else  
if(((i+1)/2) ==  Designed_T)
    %clear functions;
    %stop(obj);
   % delete(obj);
   stop(t_DO);
   delete(t_DO);
end
end
disp(i);
i = i+1 ;
end

















