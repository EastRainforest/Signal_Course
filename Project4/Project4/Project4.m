function varargout = Project4(varargin)
% PROJECT4 M-file for Project4.fig
%      PROJECT4, by itself, creates a new PROJECT4 or raises the existing
%      singleton*.
%
%      H = PROJECT4 returns the handle to a new PROJECT4 or the handle to
%      the existing singleton*.
%
%      PROJECT4('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROJECT4.M with the given input arguments.
%
%      PROJECT4('Property','Value',...) creates a new PROJECT4 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Project4_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Project4_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Project4

% Last Modified by GUIDE v2.5 26-Dec-2019 20:16:08

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Project4_OpeningFcn, ...
                   'gui_OutputFcn',  @Project4_OutputFcn, ...
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


% --- Executes just before Project4 is made visible.
function Project4_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Project4 (see VARARGIN)

% Choose default command line output for Project4
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Project4 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Project4_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton_AI.
function pushbutton_AI_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_AI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(gcf);  %关闭4
run('Project1'); %打开1

% --- Executes on button press in pushbutton_AO.
function pushbutton_AO_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_AO (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(gcf);  %关闭4
run('Project2'); %打开2

% --- Executes on button press in pushbutton_D.
function pushbutton_D_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(gcf);  %关闭4
run('Project3'); %打开3
