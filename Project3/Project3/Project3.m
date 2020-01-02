function varargout = Project3(varargin)
% PROJECT3 MATLAB code for Project3.fig
%      PROJECT3, by itself, creates a new PROJECT3 or raises the existing
%      singleton*.
%
%      H = PROJECT3 returns the handle to a new PROJECT3 or the handle to
%      the existing singleton*.
%
%      PROJECT3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROJECT3.M with the given input arguments.
%
%      PROJECT3('Property','Value',...) creates a new PROJECT3 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Project3_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Project3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Project3

% Last Modified by GUIDE v2.5 26-Dec-2019 20:26:05

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Project3_OpeningFcn, ...
                   'gui_OutputFcn',  @Project3_OutputFcn, ...
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


% --- Executes just before Project3 is made visible.
function Project3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Project3 (see VARARGIN)

% Choose default command line output for Project3
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Project3 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Project3_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function Get_f_Callback(hObject, eventdata, handles)
% hObject    handle to Get_f (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
f = str2double(get(handles.Get_f,'string'));
handles.f = f ;
guidata(hObject,handles);
% Hints: get(hObject,'String') returns contents of Get_f as text
%        str2double(get(hObject,'String')) returns contents of Get_f as a double


% --- Executes during object creation, after setting all properties.
function Get_f_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Get_f (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Get_Vpp_Callback(hObject, eventdata, handles)
% hObject    handle to Get_Vpp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Get_Vpp as text
%        str2double(get(hObject,'String')) returns contents of Get_Vpp as a double


% --- Executes during object creation, after setting all properties.
function Get_Vpp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Get_Vpp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in button_start.
function button_start_Callback(hObject, eventdata, handles)
% hObject    handle to button_start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global i;
i = 0 ;
handles = StaticDO(handles);



% --- Executes on button press in button_comtinue.
function button_comtinue_Callback(hObject, eventdata, handles)
% hObject    handle to button_comtinue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in button_stop.
function button_stop_Callback(hObject, eventdata, handles)
% hObject    handle to button_stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global t_DO;

stop(t_DO);
delete(t_DO);

% --- Executes on slider movement.
function Get_square_f_Callback(hObject, eventdata, handles)
% hObject    handle to Get_square_f (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider



% --- Executes during object creation, after setting all properties.
function Get_square_f_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Get_square_f (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function Get_T_Callback(hObject, eventdata, handles)
% hObject    handle to Get_T (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Designed_T = str2double(get(handles.Get_T,'string'));
handles.Designed_T = Designed_T  ;
guidata(hObject,handles);
% Hints: get(hObject,'String') returns contents of Get_T as text
%        str2double(get(hObject,'String')) returns contents of Get_T as a double


% --- Executes during object creation, after setting all properties.
function Get_T_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Get_T (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Show_Hz_Callback(hObject, eventdata, handles)
% hObject    handle to Show_Hz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% Hints: get(hObject,'String') returns contents of Show_Hz as text
%        str2double(get(hObject,'String')) returns contents of Show_Hz as a double


% --- Executes during object creation, after setting all properties.
function Show_Hz_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Show_Hz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in button_Start_DI.
function button_Start_DI_Callback(hObject, eventdata, handles)
% hObject    handle to button_Start_DI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles = StaticDI(handles);
axes(handles.axes2);


% --- Executes on button press in button_Stop_DI.
function button_Stop_DI_Callback(hObject, eventdata, handles)
% hObject    handle to button_Stop_DI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global t_DI;

stop(t_DI);
delete(t_DI);


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over Get_Vpp.
function Get_Vpp_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to Get_Vpp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global freq1;
set(handles.Show_Hz,'String', num2str(freq1));


% --- Executes on button press in pushbutton_back.
function pushbutton_back_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_back (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(gcf) ; 
run('Project4') ;
