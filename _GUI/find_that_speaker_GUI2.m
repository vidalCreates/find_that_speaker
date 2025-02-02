function varargout = find_that_speaker_GUI2(varargin)
% FIND_THAT_SPEAKER_GUI2 MATLAB code for find_that_speaker_GUI2.fig
%      FIND_THAT_SPEAKER_GUI2, by itself, creates a new FIND_THAT_SPEAKER_GUI2 or raises the existing
%      singleton*.
%
%      H = FIND_THAT_SPEAKER_GUI2 returns the handle to a new FIND_THAT_SPEAKER_GUI2 or the handle to
%      the existing singleton*.
%
%      FIND_THAT_SPEAKER_GUI2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FIND_THAT_SPEAKER_GUI2.M with the given input arguments.
%
%      FIND_THAT_SPEAKER_GUI2('Property','Value',...) creates a new FIND_THAT_SPEAKER_GUI2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before find_that_speaker_GUI2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to find_that_speaker_GUI2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help find_that_speaker_GUI2

% Last Modified by GUIDE v2.5 17-May-2017 04:39:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @find_that_speaker_GUI2_OpeningFcn, ...
                   'gui_OutputFcn',  @find_that_speaker_GUI2_OutputFcn, ...
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


% --- Executes just before find_that_speaker_GUI2 is made visible.
function find_that_speaker_GUI2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to find_that_speaker_GUI2 (see VARARGIN)

% Choose default command line output for find_that_speaker_GUI2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes find_that_speaker_GUI2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = find_that_speaker_GUI2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in startRecording.
function startRecording_Callback(hObject, eventdata, handles)
% hObject    handle to startRecording (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%create audio recorder object
recObj = audiorecorder;

%set log text 
set(handles.log_text,'String','- Recording -');

%record for 10 seconds
recordblocking(recObj, 10);
y = getaudiodata(recObj);

%save file in working directory
audiowrite('test.wav',y,8000);

%set log text to show filename
set(handles.log_text,'String','Saved as --test.wav--');
