function varargout = RoboticsVision(varargin)
% ROBOTICSVISION MATLAB code for RoboticsVision.fig
%      ROBOTICSVISION, by itself, creates a new ROBOTICSVISION or raises the existing
%      singleton*.
%
%      H = ROBOTICSVISION returns the handle to a new ROBOTICSVISION or the handle to
%      the existing singleton*.
%
%      ROBOTICSVISION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ROBOTICSVISION.M with the given input arguments.
%
%      ROBOTICSVISION('Property','Value',...) creates a new ROBOTICSVISION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before RoboticsVision_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to RoboticsVision_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help RoboticsVision

% Last Modified by GUIDE v2.5 03-Dec-2022 19:22:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @RoboticsVision_OpeningFcn, ...
                   'gui_OutputFcn',  @RoboticsVision_OutputFcn, ...
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


% --- Executes just before RoboticsVision is made visible.
function RoboticsVision_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to RoboticsVision (see VARARGIN)

% Choose default command line output for RoboticsVision
handles.output = hObject;
startup_rvc;
fileName = "images\FiratLogo.jpg";
firatLogo = imread(fileName);
axes(handles.axes1)
imshow(firatLogo)

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes RoboticsVision wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = RoboticsVision_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in reset.
function reset_Callback(hObject, eventdata, handles)
% hObject    handle to reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image;
global p;
p = nan;
image = nan;
fileName = "images\FiratLogo.jpg";
firatLogo = imread(fileName);
axes(handles.axes1)
imshow(firatLogo)

% --- Executes on button press in loadImage.
function loadImage_Callback(hObject, eventdata, handles)
% hObject    handle to loadImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image
[fileName,pathName] = uigetfile('*.*');
selectedFile = fullfile(pathName,fileName);
image = iread(selectedFile,'double');
axes(handles.axes1)
imshow(image)


% --- Executes on button press in gethomography.
function gethomography_Callback(hObject, eventdata, handles)
% hObject    handle to gethomography (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in getcoordinates.
function getcoordinates_Callback(hObject, eventdata, handles)
% hObject    handle to getcoordinates (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global p;
[x,y] = coordinateDetector(p);
set(handles.edit1,'String',x)
set(handles.edit2,'String',y)


% --- Executes on button press in red.
function red_Callback(hObject, eventdata, handles)
% hObject    handle to red (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image
global newImage
newImage = colorDetector(image,1);
axes(handles.axes1)
imshow(newImage)

% --- Executes on button press in green.
function green_Callback(hObject, eventdata, handles)
% hObject    handle to green (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image
global newImage
newImage = colorDetector(image,2);
axes(handles.axes1)
imshow(newImage)



% --- Executes on button press in blue.
function blue_Callback(hObject, eventdata, handles)
% hObject    handle to blue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image
global newImage
newImage = colorDetector(image,3);
axes(handles.axes1)
imshow(newImage)



% --- Executes on button press in square.
function square_Callback(hObject, eventdata, handles)
% hObject    handle to square (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global newImage
global shapeNewImage
[shapeNewImage] = shapeDetector(newImage,1);
axes(handles.axes1)
imshow(shapeNewImage)



% --- Executes on button press in triagnle.
function triagnle_Callback(hObject, eventdata, handles)
% hObject    handle to triagnle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global newImage
global shapeNewImage
shapeNewImage = shapeDetector(newImage,2);
axes(handles.axes1)
imshow(shapeNewImage)

% --- Executes on button press in circle.
function circle_Callback(hObject, eventdata, handles)
% hObject    handle to circle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global newImage
global shapeNewImage
shapeNewImage = shapeDetector(newImage,3);
axes(handles.axes1)
imshow(shapeNewImage)


% --- Executes on button press in large.
function large_Callback(hObject, eventdata, handles)
% hObject    handle to large (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global shapeNewImage
global p
p = sizeDetector(shapeNewImage,1);
plot_circle(p,20,'fillcolor','g');

% --- Executes on button press in small.
function small_Callback(hObject, eventdata, handles)
% hObject    handle to small (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global shapeNewImage
global p
p = sizeDetector(shapeNewImage,2);
plot_circle(p,20,'fillcolor','g');



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
