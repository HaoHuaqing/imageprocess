function varargout = project_4(varargin)
% PROJECT_4 MATLAB code for project_4.fig
%      PROJECT_4, by itself, creates a new PROJECT_4 or raises the existing
%      singleton*.
%
%      H = PROJECT_4 returns the handle to a new PROJECT_4 or the handle to
%      the existing singleton*.
%
%      PROJECT_4('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROJECT_4.M with the given input arguments.
%
%      PROJECT_4('Property','Value',...) creates a new PROJECT_4 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before project_4_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to project_4_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help project_4

% Last Modified by GUIDE v2.5 11-Jun-2017 10:58:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @project_4_OpeningFcn, ...
                   'gui_OutputFcn',  @project_4_OutputFcn, ...
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


% --- Executes just before project_4 is made visible.
function project_4_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to project_4 (see VARARGIN)

% Choose default command line output for project_4
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes project_4 wait for user response (see UIRESUME)
% uiwait(handles.project_4);
% setappdata(handles.project_4,'img_src',0);
global cho;
cho='Chessboard';


% --- Outputs from this function are returned to the command line.
function varargout = project_4_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
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
setappdata(handles.project_4,'img_src',img_src);


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
img_src=getappdata(handles.project_4,'img_src');%取得打开图片的数据
imwrite(img_src,fpath);%保存图片


% --------------------------------------------------------------------
function m_file_exit_Callback(hObject, eventdata, handles)
% hObject    handle to m_file_exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(handles.project_4);


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
function project_3_Callback(hObject, eventdata, handles)
% hObject    handle to project_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
h=gcf;
project_3;
close(h);


% --------------------------------------------------------------------
function transform_Callback(hObject, eventdata, handles)
% hObject    handle to transform (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img_src=getappdata(handles.project_4,'img_src');
global cho;
result=mdt(img_src,cho);
axes(handles.axes_tran);
imshow(result);
set(handles.axes_tran,'UserData',result);
title('distance transform') 

% --------------------------------------------------------------------
function skeleton_Callback(hObject, eventdata, handles)
% hObject    handle to skeleton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img_src=get(handles.axes_tran,'UserData');
global cho;
result=mske(img_src,cho);
axes(handles.axes_ske);
imshow(result);
set(handles.axes_ske,'UserData',result);
title('skeleton') 

% --------------------------------------------------------------------
function restoration_Callback(hObject, eventdata, handles)
% hObject    handle to restoration (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img_src=get(handles.axes_ske,'UserData');
global cho;
result=mrecon(img_src,cho);
axes(handles.axes_res);
imshow(result);
title('skeleton restoration') 



% --- Executes on selection change in choice.
function choice_Callback(hObject, eventdata, handles)
% hObject    handle to choice (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns choice contents as cell array
%        contents{get(hObject,'Value')} returns selected item from choice
contents = cellstr(get(hObject,'String'));
choice = contents{get(hObject,'Value')};
global cho;
switch choice
    case 'chessboard'
        cho='Chessboard';
    case 'cityblock'
        cho='City Block';
    case 'euclidean'
        cho='Euclidean';
end


% --- Executes during object creation, after setting all properties.
function choice_CreateFcn(hObject, eventdata, handles)
% hObject    handle to choice (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
