function varargout = Project2(varargin)
% PROJECT2 MATLAB code for Project2.fig
%      PROJECT2, by itself, creates a new PROJECT2 or raises the existing
%      singleton*.
%
%      H = PROJECT2 returns the handle to a new PROJECT2 or the handle to
%      the existing singleton*.
%
%      PROJECT2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROJECT2.M with the given input arguments.
%
%      PROJECT2('Property','Value',...) creates a new PROJECT2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Project2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Project2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Project2

% Last Modified by GUIDE v2.5 26-Dec-2019 20:22:42

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Project2_OpeningFcn, ...
                   'gui_OutputFcn',  @Project2_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Project2 is made visible.
function Project2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Project2 (see VARARGIN)

% Choose default command line output for Project2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Project2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Project2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in button_start.
function button_start_Callback(hObject, eventdata, handles)
% hObject    handle to button_start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global temp_i;
temp_i = 0;
global temp_q;
temp_q = 0;
handles = StaticAO(handles);


% --- Executes on button press in button_continue.
function button_continue_Callback(hObject, eventdata, handles)
% hObject    handle to button_continue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

axes(handles.axes1);
handles = StaticAO(handles);


% --- Executes on button press in Stop.
function Stop_Callback(hObject, eventdata, handles)
% hObject    handle to Stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global t_AO;
global i;
global q;
global temp_i;
global temp_q;
temp_i = i ;
temp_q= q;
stop(t_AO);
delete(t_AO);

function Get_PPP_Callback(hObject, eventdata, handles)
% hObject    handle to Get_PPP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Points_Per_Period = str2double(get(handles.Get_PPP,'string'));
handles.Points_Per_Period = Points_Per_Period;
guidata(hObject,handles);
% Hints: get(hObject,'String') returns contents of Get_PPP as text
%        str2double(get(hObject,'String')) returns contents of Get_PPP as a double

% --- Executes during object creation, after setting all properties.
function Get_PPP_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Get_PPP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Get_Hz_Callback(hObject, eventdata, handles)
% hObject    handle to Get_Hz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
f = str2double(get(handles.Get_Hz,'string'));
handles.f = f ;
guidata(hObject,handles);
% Hints: get(hObject,'String') returns contents of Get_Hz as text
%        str2double(get(hObject,'String')) returns contents of Get_Hz as a double


% --- Executes during object creation, after setting all properties.
function Get_Hz_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Get_Hz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Get_Period_Callback(hObject, eventdata, handles)
% hObject    handle to Get_Period (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Designed_period = str2double(get(handles.Get_Period,'string'));
handles.Designed_period = Designed_period ;
guidata(hObject,handles);
% Hints: get(hObject,'String') returns contents of Get_Period as text
%        str2double(get(hObject,'String')) returns contents of Get_Period as a double


% --- Executes during object creation, after setting all properties.
function Get_Period_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Get_Period (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function uibuttongroup2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uibuttongroup2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes when selected object is changed in uibuttongroup2.
function uibuttongroup2_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uibuttongroup2 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str=get(hObject,'tag');
switch str
    case 'sine'
        %进行相应的操作
        wavestyle = 0;
        handles.wavestyle =  wavestyle ;
        
        
    case 'sawtooth'
        %进行相应的操作
        wavestyle = 1;
        handles. wavestyle =  wavestyle ;
       
        
        
    case 'square'
        %进行相应的操作
        wavestyle = 2;
        handles. wavestyle =  wavestyle ;
        
        
end
guidata(hObject,handles);
    


% --- Executes on button press in button_end.
function button_end_Callback(hObject, eventdata, handles)
% hObject    handle to button_end (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global t;
delete(t);


% --- Executes on button press in pushbutton_back.
function pushbutton_back_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_back (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(gcf) ; 
run('Project4') ;
