function varargout = imageprocess(varargin)
% IMAGEPROCESS MATLAB code for imageprocess.fig
%      IMAGEPROCESS, by itself, creates a new IMAGEPROCESS or raises the existing
%      singleton*.
%
%      H = IMAGEPROCESS returns the handle to a new IMAGEPROCESS or the handle to
%      the existing singleton*.
%
%      IMAGEPROCESS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IMAGEPROCESS.M with the given input arguments.
%
%      IMAGEPROCESS('Property','Value',...) creates a new IMAGEPROCESS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before imageprocess_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to imageprocess_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help imageprocess

% Last Modified by GUIDE v2.5 08-Jun-2017 21:31:22

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @imageprocess_OpeningFcn, ...
                   'gui_OutputFcn',  @imageprocess_OutputFcn, ...
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


% --- Executes just before imageprocess is made visible.
function imageprocess_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to imageprocess (see VARARGIN)

% Choose default command line output for imageprocess
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes imageprocess wait for user response (see UIRESUME)
% uiwait(handles.imageprocess);
setappdata(handles.imageprocess,'img_src',0);


% --- Outputs from this function are returned to the command line.
function varargout = imageprocess_OutputFcn(hObject, eventdata, handles) 
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
setappdata(handles.imageprocess,'img_src',img_src);

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
img_src=getappdata(handles.imageprocess,'img_src');%取得打开图片的数据
imwrite(img_src,fpath);%保存图片


% --------------------------------------------------------------------
function m_file_exit_Callback(hObject, eventdata, handles)
% hObject    handle to m_file_exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(handles.imageprocess);


% --------------------------------------------------------------------
function otsu_Callback(hObject, eventdata, handles)
% hObject    handle to otsu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes_tag);
img_src=getappdata(handles.imageprocess,'img_src');
x=otsu(img_src);
title('目标图像') 



% --- Executes on slider movement.
function slider_val_Callback(hObject, eventdata, handles)
% hObject    handle to slider_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
val=get(hObject,'Value');
set(handles.txt_display,'String',num2str(round(val*255)));
axes(handles.axes_dst);
img_src=getappdata(handles.imageprocess,'img_src');
bw=im2bw(img_src,val);
imshow(bw);
title('二值图像') 



% --- Executes during object creation, after setting all properties.
function slider_val_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes during object creation, after setting all properties.
function axes_src_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes_src (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes_src
title('原始图像') 
axis off 


% --- Executes during object creation, after setting all properties.
function axes_dst_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes_dst (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes_dst
axis off 
title('二值图像') 


% --- Executes during object creation, after setting all properties.
function axes_tag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes_tag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes_tag
axis off 
title('目标图像') 


% --------------------------------------------------------------------
function operate_Callback(hObject, eventdata, handles)
% hObject    handle to operate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function hist_Callback(hObject, eventdata, handles)
% hObject    handle to hist (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes_hist);
img_src=getappdata(handles.imageprocess,'img_src');
G=rgb2gray(img_src);  
imhist(G)
title('灰度直方图') 


% --------------------------------------------------------------------
function entropy_Callback(hObject, eventdata, handles)
% hObject    handle to entropy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes_tag);
img_src=getappdata(handles.imageprocess,'img_src');
x=entropy(img_src);
title('目标图像') 


% --------------------------------------------------------------------
function project_2_Callback(hObject, eventdata, handles)
% hObject    handle to project_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
h=gcf;
project_2;
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
function project_Callback(hObject, eventdata, handles)
% hObject    handle to project (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
