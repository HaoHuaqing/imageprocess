function varargout = project_2(varargin)
% PROJECT_2 MATLAB code for project_2.fig
%      PROJECT_2, by itself, creates a new PROJECT_2 or raises the existing
%      singleton*.
%
%      H = PROJECT_2 returns the handle to a new PROJECT_2 or the handle to
%      the existing singleton*.
%
%      PROJECT_2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROJECT_2.M with the given input arguments.
%
%      PROJECT_2('Property','Value',...) creates a new PROJECT_2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before project_2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to project_2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help project_2

% Last Modified by GUIDE v2.5 13-Jun-2017 18:54:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @project_2_OpeningFcn, ...
                   'gui_OutputFcn',  @project_2_OutputFcn, ...
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


% --- Executes just before project_2 is made visible.
function project_2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to project_2 (see VARARGIN)

% Choose default command line output for project_2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes project_2 wait for user response (see UIRESUME)
% uiwait(handles.project_2);
setappdata(handles.project_2,'img_src',0);


% --- Outputs from this function are returned to the command line.
function varargout = project_2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function m_file_Callback(hObject, eventdata, handles)
% hObject    handle to m_file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function m_file_open_Callback(hObject, eventdata, handles)
% hObject    handle to m_file_open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile({'*.bmp;*.jpg;*.png;*.jpeg', 'Image Files (*.bmp, *.jpg, *.png,*.jpeg)'; '*.*', 'All Files (*.*)'}, 'Pick an image');
if isequal(filename,0) || isequal(pathname,0),
    return;
end
axes(handles.axes_src);
fpath=[pathname filename];
img_src=imread(fpath);
imshow(img_src);
title('原始图像') 
setappdata(handles.project_2,'img_src',img_src);


% --------------------------------------------------------------------
function m_file_save_Callback(hObject, eventdata, handles)
% hObject    handle to m_file_save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uiputfile({'*.bmp','BMP files';'*.jpg;','JPGfiles'}, 'Pick an Image');
if isequal(filename,0) || isequal(pathname,0)
    return;%如果点了“取消”
else
    fpath=fullfile(pathname, filename);%获得全路径的另一种方法
end
img_src=getappdata(handles.project_2,'img_src');%取得打开图片的数据
imwrite(img_src,fpath);%保存图片


% --------------------------------------------------------------------
function m_file_exit_Callback(hObject, eventdata, handles)
% hObject    handle to m_file_exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(handles.project_2);


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_4_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function project_1_Callback(hObject, eventdata, handles)
% hObject    handle to project_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
h=gcf;
imageprocess;
close(h);

% --------------------------------------------------------------------
function project_3_Callback(hObject, eventdata, handles)
% hObject    handle to project_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
h=gcf;
project_3;
close(h);

% --------------------------------------------------------------------
function project_4_Callback(hObject, eventdata, handles)
% hObject    handle to project_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
h=gcf;
project_4;
close(h);

% --------------------------------------------------------------------
function Roberts_Callback(hObject, eventdata, handles)
% hObject    handle to Roberts (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes_edge);
img_src=getappdata(handles.project_2,'img_src');
im=rgb2gray(img_src);
result = edge(im,'Roberts');
imshow(result)
title('edge detection') 


% --------------------------------------------------------------------
function Prewitt_Callback(hObject, eventdata, handles)
% hObject    handle to Prewitt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes_edge);
img_src=getappdata(handles.project_2,'img_src');
im=rgb2gray(img_src);
result = edge(im,'Prewitt');
imshow(result)
title('edge detection') 

% --------------------------------------------------------------------
function Sobel_Callback(hObject, eventdata, handles)
% hObject    handle to Sobel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes_edge);
img_src=getappdata(handles.project_2,'img_src');
im=rgb2gray(img_src);
result = edge(im,'Sobel');
imshow(result)
title('edge detection') 



function kernel_Callback(hObject, eventdata, handles)
% hObject    handle to kernel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of kernel as text
%        str2double(get(hObject,'String')) returns contents of kernel as a double


% --- Executes during object creation, after setting all properties.
function kernel_CreateFcn(hObject, eventdata, handles)
% hObject    handle to kernel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in conv.
function conv_Callback(hObject, eventdata, handles)
% hObject    handle to conv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img_src=getappdata(handles.project_2,'img_src');
im=rgb2gray(img_src);
im=double(im);
kernel=str2num(get(handles.kernel,'string'));
result = imfilter(im,kernel);
axes(handles.axes_conv);
imshow(result);
title('convolution') 

% --- Executes on button press in GaussianFilter.
function GaussianFilter_Callback(hObject, eventdata, handles)
% hObject    handle to GaussianFilter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img_src=getappdata(handles.project_2,'img_src');
im=rgb2gray(img_src);
sigma=str2num(get(handles.sigma,'string'));
result = imgaussfilt(im,sigma);
axes(handles.axes_noise);
imshow(result);
title('noise reduction') 


function sigma_Callback(hObject, eventdata, handles)
% hObject    handle to sigma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sigma as text
%        str2double(get(hObject,'String')) returns contents of sigma as a double


% --- Executes during object creation, after setting all properties.
function sigma_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sigma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function mn_Callback(hObject, eventdata, handles)
% hObject    handle to mn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of mn as text
%        str2double(get(hObject,'String')) returns contents of mn as a double


% --- Executes during object creation, after setting all properties.
function mn_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img_src=getappdata(handles.project_2,'img_src');
im=rgb2gray(img_src);
mn=str2num(get(handles.mn,'string'));
result = medfilt2(im, mn);
axes(handles.axes_noise);
imshow(result);
title('noise reduction') 
