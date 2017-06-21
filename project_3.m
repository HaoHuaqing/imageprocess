function varargout = project_3(varargin)
% PROJECT_3 MATLAB code for project_3.fig
%      PROJECT_3, by itself, creates a new PROJECT_3 or raises the existing
%      singleton*.
%
%      H = PROJECT_3 returns the handle to a new PROJECT_3 or the handle to
%      the existing singleton*.
%
%      PROJECT_3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROJECT_3.M with the given input arguments.
%
%      PROJECT_3('Property','Value',...) creates a new PROJECT_3 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before project_3_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to project_3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help project_3

% Last Modified by GUIDE v2.5 13-Jun-2017 18:43:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @project_3_OpeningFcn, ...
                   'gui_OutputFcn',  @project_3_OutputFcn, ...
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


% --- Executes just before project_3 is made visible.
function project_3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to project_3 (see VARARGIN)

% Choose default command line output for project_3
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes project_3 wait for user response (see UIRESUME)
% uiwait(handles.project_3);
setappdata(handles.project_3,'img_src',0);
global se1;
se1='line';



% --- Outputs from this function are returned to the command line.
function varargout = project_3_OutputFcn(hObject, eventdata, handles) 
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
setappdata(handles.project_3,'img_src',img_src);


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
img_src=getappdata(handles.project_3,'img_src');%取得打开图片的数据
imwrite(img_src,fpath);%保存图片


% --------------------------------------------------------------------
function m_file_exit_Callback(hObject, eventdata, handles)
% hObject    handle to m_file_exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(handles.project_3);


% --------------------------------------------------------------------
function operate_Callback(hObject, eventdata, handles)
% hObject    handle to operate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function project_Callback(hObject, eventdata, handles)
% hObject    handle to project (see GCBO)
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
function project_2_Callback(hObject, eventdata, handles)
% hObject    handle to project_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
h=gcf;
project_2;
close(h);

% --------------------------------------------------------------------
function project_4_Callback(hObject, eventdata, handles)
% hObject    handle to project_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
h=gcf;
project_4;
close(h);


% --- Executes on selection change in se1.
function se1_Callback(hObject, eventdata, handles)
% hObject    handle to se1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns se1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from se1
contents = cellstr(get(hObject,'String'));
choice = contents{get(hObject,'Value')};
global se1;
switch choice
    case 'line'
        se1='line';
    case 'ball'
        se1='ball';
end



% --- Executes during object creation, after setting all properties.
function se1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to se1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function se_Callback(hObject, eventdata, handles)
% hObject    handle to se (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of se as text
%        str2double(get(hObject,'String')) returns contents of se as a double


% --- Executes during object creation, after setting all properties.
function se_CreateFcn(hObject, eventdata, handles)
% hObject    handle to se (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function dilation_Callback(hObject, eventdata, handles)
% hObject    handle to dilation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes_dil);
img_src=getappdata(handles.project_3,'img_src');
SE1=str2num(get(handles.se,'string'));
SE=strel('square',SE1);
result=imdilate(img_src,SE);
imshow(result);
title('Dilation') 

% --------------------------------------------------------------------
function erosion_Callback(hObject, eventdata, handles)
% hObject    handle to erosion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes_ero);
img_src=getappdata(handles.project_3,'img_src');
SE1=str2num(get(handles.se,'string'));
SE=strel('square',SE1);
result=imerode(img_src,SE);
imshow(result);
title('Erosion') 

% --------------------------------------------------------------------
function opening_Callback(hObject, eventdata, handles)
% hObject    handle to opening (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes_ope);
img_src=getappdata(handles.project_3,'img_src');
SE1=str2num(get(handles.se,'string'));
SE=strel('square',SE1);
result=imopen(img_src,SE);
imshow(result);
title('Opening') 

% --------------------------------------------------------------------
function closing_Callback(hObject, eventdata, handles)
% hObject    handle to closing (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes_clo);
img_src=getappdata(handles.project_3,'img_src');
SE1=str2num(get(handles.se,'string'));
SE=strel('square',SE1);
result=imclose(img_src,SE);
imshow(result);
title('Closing') 

function se3_Callback(hObject, eventdata, handles)
% hObject    handle to se3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of se3 as text
%        str2double(get(hObject,'String')) returns contents of se3 as a double


% --- Executes during object creation, after setting all properties.
function se3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to se3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function edge_Callback(hObject, eventdata, handles)
% hObject    handle to edge (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes_edge);
img_src=getappdata(handles.project_3,'img_src');
SE = strel('square',3); 
BW1=imdilate(img_src,SE);
BW2=imerode(img_src,SE);
result=BW1-BW2;
imshow(result)
title('Morphological edge detection') 

% --------------------------------------------------------------------
function Reconstruction_Callback(hObject, eventdata, handles)
% hObject    handle to Reconstruction (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes_res);
img_src=getappdata(handles.project_3,'img_src');
SE = strel('square',3); 
x=rgb2gray(img_src);
M = imopen(x,SE);
T=M;
while(T~=M)
    T=M;
    M=imdilate(M,SE);
    M=M&x;
end
imshow(M)
title('Binary Image Reconstruction') 

% --------------------------------------------------------------------
function Gradient_Callback(hObject, eventdata, handles)
% hObject    handle to Gradient (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes_gra);
img_src=getappdata(handles.project_3,'img_src');
SE = strel('square',3); 
im1=imdilate(img_src,SE);
im2 = imerode(img_src,SE);
im3=0.5*(im1-im2);
imshow(im3)
title('Morphological gradient') 

% --------------------------------------------------------------------
function gray_res_Callback(hObject, eventdata, handles)
% hObject    handle to gray_res (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes_gray_res);
img_src=getappdata(handles.project_3,'img_src');
marker = imsubtract(img_src,70);
recon = imreconstruct(marker, img_src);
imshow(recon)
title('Grayscale Reconstruction') 


% --- Executes during object creation, after setting all properties.
function axes_gray_res_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes_gray_res (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes_gray_res
