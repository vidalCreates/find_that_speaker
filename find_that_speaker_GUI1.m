function varargout = find_that_speaker_GUI1(varargin)
% FIND_THAT_SPEAKER_GUI1 MATLAB code for find_that_speaker_GUI1.fig
%      FIND_THAT_SPEAKER_GUI1, by itself, creates a new FIND_THAT_SPEAKER_GUI1 or raises the existing
%      singleton*.
%
%      H = FIND_THAT_SPEAKER_GUI1 returns the handle to a new FIND_THAT_SPEAKER_GUI1 or the handle to
%      the existing singleton*.
%
%      FIND_THAT_SPEAKER_GUI1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FIND_THAT_SPEAKER_GUI1.M with the given input arguments.
%
%      FIND_THAT_SPEAKER_GUI1('Property','Value',...) creates a new FIND_THAT_SPEAKER_GUI1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before find_that_speaker_GUI1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to find_that_speaker_GUI1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help find_that_speaker_GUI1

% Last Modified by GUIDE v2.5 17-May-2017 03:30:48

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @find_that_speaker_GUI1_OpeningFcn, ...
                   'gui_OutputFcn',  @find_that_speaker_GUI1_OutputFcn, ...
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


% --- Executes just before find_that_speaker_GUI1 is made visible.
function find_that_speaker_GUI1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to find_that_speaker_GUI1 (see VARARGIN)

% Choose default command line output for find_that_speaker_GUI1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes find_that_speaker_GUI1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = find_that_speaker_GUI1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function filename_Callback(hObject, eventdata, handles)
% hObject    handle to filename (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of filename as text
%        str2double(get(hObject,'String')) returns contents of filename as a double


% --- Executes during object creation, after setting all properties.
function filename_CreateFcn(hObject, eventdata, handles)
% hObject    handle to filename (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton.
function pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%retrieve filename from edit text in GUI
speechfile = get(handles.filename,'String');
disp(strcat('filename - ',speechfile));

%call main code to identify speaker
x = main(speechfile);

%set result in GUI
set(handles.match_result,'String','Speaker : --' + x + '--');
