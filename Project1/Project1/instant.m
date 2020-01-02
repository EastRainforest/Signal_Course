% InstantAI.m
%
% Example Category:
%    AI
% Matlab(2010 or 2010 above)
%
% Description:
%    This example demonstrates how to use Instant AI function.
%
% Instructions for Running:
%    1. Set the 'deviceDescription' for opening the device.
%    2. Set the 'startChannel' as the first channel for scan analog samples
%    3. Set the 'channelCount' to decide how many sequential channels to
%       scan analog samples.
%
% I/O Connections Overview:
%    Please refer to your hardware reference manual.

function handles = InstantAI(handles)
global numpoints;
global k;
k=0;
global temp_x;

numpoints = temp_x;
disp(numpoints);

global array9;
global array;
global temp_y;

%array =[numpoints-1,numpoints];
%array9=zeros(8,2);
array=zeros(8,2);
array9=temp_y;
%array9(:,2)=array(:,2);
%global FileNumber;
%FileNumber= 1;
%global arrayT;
%arrayT = zeros(50,channelCount+1);
% Make Automation.BDaq assembly visible to MATLAB.
BDaq = NET.addAssembly('Automation.BDaq4');

f = handles.f;
per = double(1/f);
Ports = handles.Ports ;

% Configure the following three parameters before running the demo.
% The default device of project is demo device, users can choose other
% devices according to their needs.
deviceDescription = 'USB-4704,BID#0';
startChannel = int32(0);
channelCount = int32(Ports);

% Step 1: Create a 'InstantAiCtrl' for Instant AI function.
instantAiCtrl = Automation.BDaq.InstantAiCtrl();

try
    % Step 2: Select a device by device number or device description and
    % specify the access mode. In this example we use
    % AccessWriteWithReset(default) mode so that we can fully control the
    % device, including configuring, sampling, etc.
    instantAiCtrl.SelectedDevice = Automation.BDaq.DeviceInformation(...
        deviceDescription);
    data = NET.createArray('System.Double', channelCount);
    
    % Step 3: Read samples and do post-process, we show data here.
    errorCode = Automation.BDaq.ErrorCode();
    global t_AI;
    t_AI = timer('TimerFcn', {@TimerCallback, instantAiCtrl, startChannel, ...
        channelCount, data, handles}, 'period', per, 'executionmode', 'fixedrate', ...
        'StartDelay', 1);
    start(t_AI);
    input('InstantAI is in progress...Press Enter key to quit!');
    stop(t_AI);
    delete(t_AI);
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

% Step 4: Close device and release any allocated resource.
instantAiCtrl.Dispose();

end

function result = BioFailed(errorCode)

result =  errorCode < Automation.BDaq.ErrorCode.Success && ...
    errorCode >= Automation.BDaq.ErrorCode.ErrorHandleNotValid;

end

function TimerCallback(obj, event, instantAiCtrl, startChannel, ...
    channelCount, data, handles)

global r;
global r_x;
global numpoints;
global array;
global array9;
errorCode = instantAiCtrl.Read(startChannel, channelCount, data);
if BioFailed(errorCode)
    throw Exception();
end
fprintf('\n');
for j=0:(channelCount - 1)
    
    temp = data.Get(j);
    fprintf('channel %d : %10f ', j, temp);
    array(j+1,1)=(numpoints-1);
    array(j+1,2)=numpoints;
    array9(j+1,1)=array9(j+1,2);
    array9(j+1,2)=temp;
    x=array(j+1,:);
    y=array9(j+1,:);

    ylim([-10*r,10*r]);
    
    switch j
        case 0
            axes(handles.axes1);
            if (x(1)>0)
                plot(x,y);
                hold on;
            end
            
        case 1
            axes(handles.axes2);
            if (x(1)>0)
                plot(x,y);
                hold on;
            end
        case 2
            axes(handles.axes3);
            if (x(1)>0)
                plot(x,y);
                hold on;
            end
        case 3
            axes(handles.axes4);
            if (x(1)>0)
                plot(x,y);
                hold on;
            end
        case 4
            axes(handles.axes5);
            if (x(1)>0)
                plot(x,y);
                hold on;
            end
        case 5
            axes(handles.axes6);
            plot(x,y);
            hold on;
        case 6
            axes(handles.axes7);
            if (x(1)>0)
                plot(x,y);
                hold on;
            end
        case 7
            axes(handles.axes8);
            if (x(1)>0)
                plot(x,y);
                hold on;
            end
            
    end
    
    %if (i == 50)
    
    filename = [num2str(j),'.txt'];
    fid=fopen(filename,'a');
    
    
    fprintf(fid,'%f\t',array9(j+1,1));
    
    fclose(fid);
    
end

numpoints=numpoints+1;

end

