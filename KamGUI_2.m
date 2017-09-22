

function varargout = KamGUI_2(varargin)
% KAMGUI_2 MATLAB code for KamGUI_2.fig
%      KAMGUI_2, by itself, creates a new KAMGUI_2 or raises the existing
%      singleton*.
%
%      H = KAMGUI_2 returns the handle to a new KAMGUI_2 or the handle to
%      the existing singleton*.
%
%      KAMGUI_2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in KAMGUI_2.M with the given input arguments.
%
%      KAMGUI_2('Property','Value',...) creates a new KAMGUI_2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before KamGUI_2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to KamGUI_2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help KamGUI_2

% Last Modified by GUIDE v2.5 22-Sep-2017 14:55:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @KamGUI_2_OpeningFcn, ...
                   'gui_OutputFcn',  @KamGUI_2_OutputFcn, ...
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


% --- Executes just before KamGUI_2 is made visible.
function KamGUI_2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to KamGUI_2 (see VARARGIN)

% Choose default command line output for KamGUI_2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes KamGUI_2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);
global T1_2;
global Wei_2;
global X0_2;
global P0_2;
global Allneed2;   
X0_2=[6100,-410,0,8100,2,0]';
P0_2=diag([100^2 10^2 0 100^2 10^2 0]);         
T1_2=2;
Wei_2=2;                                                                   %������KamGUI_1_1�Ĳ�ͬ���Ľ�����ʼ����ֵ��ͬ
Allneed2.Flag_init=62;
Allneed2.Wei_Z=2;

X0_2=[0 200 -25 0 0 25 0 0 60]';
P0_2=diag([100 10 1 100 10 1 100 10 1]);                                  %��Ҫ��������ʾ�Ķ���
T1_2=0.01;
Wei_2=3;
Allneed2.Flag_init=93;
Allneed2.Wei_Z=3;

%�˲����ĳ�ʼ�� �Ƿ��ڴ˽��У���Ҫ������֤���������ڲ���ʼ���Ļ�����Ҳ��ʶ���ˡ�
global A_2;
global G_2;
global Q_2;
global H_2;
global R_2;
CA_I=[1 T1_2 0.5*T1_2^2;0 1 T1_2; 0 0 1];       
A_2=[CA_I,zeros(3,6);zeros(3),CA_I,zeros(3);zeros(3,6),CA_I];
G_2=[0.5*T1_2^2,0,0;T1_2,0,0;1,0,0;  0,0.5*T1_2^2,0;0,T1_2,0;0,1,0;0 0 0.5*T1_2^2;0,0,T1_2;0 0 1];
Q_I=0.1;
Q_2=diag([Q_I,Q_I,Q_I]);

syms x y z;                                                                      %�����Ƕ�ά�״� ������Ҫ��д��ά�״������
f1=sqrt(x^2+y^2);f2=atan(y/x);
h11=x/(x^2 + y^2)^(1/2);h12=y/(x^2 + y^2)^(1/2);h21=-y/(x^2 + y^2);h22=x/(x^2 + y^2);
Allneed2.Fx={f1;f2};
H={h11,h12;h21 h22};                                      %H��������ֵ Ӧ�ø���Allneed.Flag_init�� Allneed.Wei_Z��ȷ����
H_2=[H{1,1},0,0,H{1,2},0,0;H{2,1},0,0,H{2,2},0,0];
R_2=diag([10000,0.0001]);

f1=sqrt(x^2+y^2+z^2);f2=atan(y/x);f3=atan(z/sqrt(x^2+y^2));     %Ϊ�˽��atan2�������ڷ��ű��� ���Բ����Խ����к�������Ϊ�ַ�����ʽ����ͨ������eval����ɸ�ֵ��
    R1=sqrt(x^2+y^2+z^2);  r1=sqrt(x^2+y^2);
h11=x/R1;h12=y/R1; h13=z/R1;
h21=-y/(x^2+y^2); h22=-x/(x^2+y^2);  h23=0;
h31=-x*z/(R1^2*r1); h32=-y*z/(R1^2*r1); h33=r1/R1^2;
H={h11,h12,h13;h21 h22 h23; h31 h32 h33};%H��������ֵ Ӧ�ø���Allneed.Flag_init�� Allneed.Wei_Z��ȷ����
H_2=[H{1,1},0,0,H{1,2},0,0,H{1,3},0,0;
     H{2,1},0,0,H{2,2},0,0,H{2,3},0,0;
    H{3,1},0,0,H{3,2},0,0,H{3,3},0,0;];
Allneed2.Fx={f1;f2;f3};
R_2=diag([10000,0.0001,0.0001]);




% --- Outputs from this function are returned to the command line.
function varargout = KamGUI_2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function KF_Callback(hObject, eventdata, handles)
% hObject    handle to KF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(gcf);
%run('KamGUI_2');
 %KamGUI_1_1
 set(0,'currentfigure', KamGUI_1_1);


% --- Executes during object creation, after setting all properties.
function pushbutton1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in Original_State.
function Original_State_Callback(hObject, eventdata, handles)
% hObject    handle to Original_State (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global X0_2;
global P0_2;
global Wei_2;
global T1_2;
global Allneed2;                                                            %�Ľ�����һЩȫ�ֱ������ڽṹ��Allneed���ʱ��ʵ��handles��ʹ�÷�����
%disp(X0);
X0=X0_2;                                                                    %ͨ�����ַ�ʽ���Ը���KamGUI_1_1�ĳ��򷽱㣻����Ҫע�����ÿ�������β��ʱ����Ҫ��ֵ����
P0=P0_2;
Wei=Wei_2;
T1=T1_2;
Wei_Z=Allneed2.Wei_Z;

%===================��ʼ״̬�ĳ�ʼ��======================================
for r=1:1
prompt={'X0:(n��1)           PS��The "X0" format is given!','P0:(n��n)','Sampling Period','Spatial Dimension','Measurement Space'};
title='Original State Parameters';
row=[8,8,1,1,1]';col=[50,50,50,50,50]';
lines=[row,col];
def={num2str(X0),num2str(P0),num2str(T1),num2str(Wei),num2str(Wei_Z)};
  options.Resize='on';options.WindowStyle='normal';options.Interpreter='none';
answer=inputdlg(prompt,title,lines,def,options);

    if isempty(answer)
      msgbox('�˲���ʼ״̬������ԭֵ����ȷ��','��ʾ','warn')                         %�˴��Ծɵ���ȷ�ϴ��ڣ���Ϊ�о�����ĳ�ʼ���Ƚ���Ҫ����Ҫ���ݵ��Խ����һ�´˴��Ƿ�Ҫ����
      return;                                                               %�Ľ��� �����ȡ����ʱ�����Ӧ��ֱ������ �Ա㱣���ϴε�ֵ
    else        
        if ~isempty(answer{1})
           % cc=answer{1}
           X0=str2num(answer{1});
           [n1,m1]=size(X0);
           if m1~=1
              msgbox('X0������������','ȷ�ϳ�ʼ��','warn') 
              return;
           end                          
        end
        if ~isempty(answer{2})
           P0=str2num(answer{2});
           [n2,m2]=size(P0);
           if m2~=n2
              msgbox('P0�����Ƿ���','ȷ�ϳ�ʼ��','warn') 
              return;
           elseif n2~=n1
               msgbox('P0��X0ά��������','ȷ�ϳ�ʼ��','warn') 
              return;
           end

        end
        if ~isempty(answer{3})
            %disp(answer{3})
           T1=str2num(answer{3});
          % disp(T1)
           n3=length(T1);
           if n3~=1
              msgbox('T1�����Ǳ���','ȷ�ϳ�ʼ��','warn') 
              return;
           end  
        end
        if ~isempty(answer{4})
           Wei=str2num(answer{4}); 
           n4=length(Wei);
           if n4~=1
              msgbox('ά�������Ǳ���','ȷ�ϳ�ʼ��','warn') 
              return;
           end  
        end
        if ~isempty(answer{5})
           Wei_Z=str2num(answer{5});
           n5=length(Wei_Z);
           if n5~=1
              msgbox('�����ռ�ά�������Ǳ���','ȷ�ϳ�ʼ��','warn') 
              return;
           end  
        end
    end
    % =========���˲���ֵά���������ڱ仯��ʱ�� �����˵� Ӧ������ 
    [n6,m6]=size(X0_2);       %��ʱX0_2 T1_2���������һ��ʱ�̵�ֵ
    if n1~=n6||T1~=T1_2
        set(handles.Motion_Popup,'visible','off');
        set(handles.CompletelyManual,'visible','off');
        set(handles.Classical,'visible','on','value',0);
    end
end
X0_2 =X0;          %ͨ�����ַ�ʽ���Ը���KamGUI_1_1�ĳ��򷽱㣬�Ժ���ԸĴ�Ҳ���㣻����Ҫע�����ÿ�������β��ʱ������������ж�ȫ�ֱ����ĸ�ֵ��Ҫ��ֵ����
P0_2=P0;
Wei_2=Wei;
T1_2=T1;  
Allneed2.Wei_Z =Wei_Z;  %��������ֻ�õ������һ�� �ڴ���Ϊ��IMM��������� ��ͬʱ���༸�������Ѿ���Ϊȫ�ֱ��� �ٸĿ��鷳

%================����X0��Wei��Ӧ�Ĺ�ϵ������һ����־========================
 %Flag����-1��ʾ��ʼ����ʱ�� X0��ά����Weiû�ж�Ӧ��ֵ  Flag=-2�������X0���Ǳ�׼�Ļ����˶�����;
%����һ��������ǵ�X0,Wei�����벻�Ǳ�׼ֵ��ʱ�򣬼�Flagȡֵ-1 -2ʱ���Ƿ�ʹ��return���������Ƿ��Allneed.Flag_init���¸�ֵ  ����������ǲ�ʹ��return       

Flag=Allneed2.Flag_init;
for r=1:1
    n=length(X0_2);
    switch n
        case 2
            if Wei==1
                Flag=21;%     ǰ������ֱ�ʾ����X0��ά������������ֱ�ʾ���ǿռ�ά��
            elseif Wei==2
                Flag=22;
            else
                % msgbox('��ʼ��û�ж�Ӧ��Ĭ��ģ�ͣ���ȷ����������ֶ�����','��ȷ��','warn');return;
                Flag=-1;
            end
        case 3
            if Wei==1
                Flag=31;
            else
                Flag=-1;
            end
        case 4
            if Wei==2
                Flag=42;
            else
                Flag=-1;
            end
        case 6
            if Wei==2
                Flag=62;
            elseif Wei==3
                Flag=62;
            else
                Flag=-1;
            end
        case 9
            if Wei==3
                Flag=93;
            else
                Flag=-1;
            end
        otherwise
            Flag=-2;
            msgbox('��ʼ״̬X0��ά������Ĭ��������������ܽ��У������п��ܲ��ܹ���ͼ����ȷ��','��ȷ��','warn');
            %return;%���ʹ��return����ʵ����Allneed.Flag_init�Ͳ�����ȡֵ-2������������Ժ���ģ���Ϊ��������ǲ��ܺܺô����Ǳ�׼����µĳ���
            %����Ҳ���Կ��ǳ�����Լ������� ֻ�������ܻ�ͼչʾ����Ŀ������������ܽ��У���
    end
    if Flag==-1
        msgbox('��ʼ��ʱX0��Weiû��Ĭ�ϵĶ�Ӧ״�����������ܽ��У������п��ܲ��ܹ���ͼ����ȷ��','��ȷ��','warn');
        %return;
    end
end
Allneed2.Flag_init=Flag;
%disp(Allneed2)

%===================ǿ�������˲��� ��ֹ��ʱ=================================%ʵ�����д���֤


% --- Executes on button press in Motion_Model.
function Motion_Model_Callback(hObject, eventdata, handles)
% hObject    handle to Motion_Model (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global X0_2;
global T1_2;
global A_2;
global G_2;
global Q_2;
%=================���� X0_2,T1_2��״̬�Զ�ȷ��Ĭ�ϵ��˶�ģ�Ͳ���
%������ʵ�漰������������X0_2��ά���Ƿ�仯��T1_2��ȡֵ�Ƿ�仯������ĳ����Ѿ������һ���� �����������������һ�����⻹û���
%���ǵ�X0��ά������ �����ڱ仯��ʱ���ܻ����³�ʼ��A_2�ȣ������ڱ���A_2����ʽǰ���� ֻ�ı�����T1_2��ֵ�����˼· ������ű���
%�滻T1_1
%�����е�n5��ʵ�������ϴ�X0��ά��

[n1,m1]=size(X0_2);
[n5,m5]=size(A_2);
CV_I=[1 T1_2 0;0 1 0; 0 0 0];  %A=diag([CV_I,CV_I]);%���ֱ��ʽ��������ԽǾ���
CA_I=[1 T1_2 0.5*T1_2^2;0 1 T1_2; 0 0 1];     
try                                                                             %gaijin
   T1_pre= handles.T1_pre;
catch 
    T1_pre=1;
end
  if n5==n1&&T1_2==T1_pre                                        %����ĳ����������⣬���ݳ�ʼ״̬������Ӧ�仯 ���Ǳ���KamGUI_1_1�������һ������ ���Ҫ���Ӻܶࡣ
      %�ϴ�����֮��A��ά����X0��ͬ����ʾX0��ά��û�䣬��ʱA��ά��Ӧ�ñ��ֲ��䣬��Ҫ���³�ʼ��
      %%�����ǲ����������أ���ԭ������������ A_2ĳ�θ���֮�� �´λ����������伴��Ϊ��ģ�ͱ仯֮�������¸�ֵ��  ������Ȼ������ж��������񲻶԰� ľ�п��ǵ���ģ�Ͳ���
      %%���ڸ��ġ������  �����߸���Ҫ
 % elseif n5==n1&&T1_2~=T1_pre
      %������������ӡ���
  else
      switch n1
          case 9 
              A_2=[CA_I,zeros(3,6);zeros(3),CA_I,zeros(3);zeros(3,6),CA_I];
              G_2=[T1_2,0,0;1,0,0;1,0,0;0,T1_2,0;0,1,0;0,1,0;0 0 T1_2;0,0,1;0 0 1];
              Q_I=0.1;
              Q_2=diag([Q_I,Q_I,Q_I]);
          case 6
              A_2=[CV_I,zeros(3);zeros(3),CV_I];
              G_2=[T1_2,0; 1,0; 0,0; 0,T1_2; 0,1; 0,0];
              Q_I=0.1;
              Q_2=diag([Q_I,Q_I]);
          case 4
              A_2=[1,T1_2,0,0;0 1 0 0; 0 0 1 T1_2; 0 0 0 1];
              G_2=[0.5*T1_2^2 0; T1_2 0; 0 0.5*T1_2^2; 0 T1_2];
              Q_I=0.1;
              Q_2=diag([Q_I,Q_I]);
          otherwise
              A_2=[CV_I,zeros(3);zeros(3),CV_I];
              G_2=[T1_2,0;1,0;0,0;0,T1_2;0,1;0,0];
              Q_I=0.1;
              Q_2=diag([Q_I,Q_I]);
      end
  end
 handles.T1_pre=T1_2;
 guidata(hObject, handles);
    
%============��������������ȷ������ֵ�������ȡ����ʱ�򱣴��ϴ�����ֵ======
prompt={'��(k+1,k):(n��n)','Q(k):(p��p)','��(k+1,k):(n��p)'};
title='Motion Model Parameters';
row=[8,4,8]';col=[60,60,60]';
lines=[row,col];
def={num2str(A_2),num2str(Q_2),num2str(G_2)};
options.Resize='on';options.WindowStyle='normal';options.Interpreter='none';
answer=inputdlg(prompt,title,lines,def,options);
                                                                         
    if isempty(answer)
      msgbox('û��ȷ�ϣ�������ԭ״̬','ȷ�ϳ�ʼ��','warn')                         %�Ľ��������ȡ����ʱ�򲻵����˴��ڣ�
    else
        exist=0;
        if ~isempty(answer{1})
           A_2=str2num(answer{1});
              [n5,m5]=size(A_2);
           if m5~=n5
              msgbox('A�����Ƿ���','ȷ�ϳ�ʼ��','warn') 
              return;
           elseif n5~=n1
               msgbox('A��X0ά��������','ȷ�ϳ�ʼ��','warn') 
              return;
           end
        end
        if ~isempty(answer{2})
           Q_2=str2num(answer{2});
             [n6,m6]=size(Q_2);
           if m6~=n6
              msgbox('Q�����Ƿ���','ȷ�ϳ�ʼ��','warn') 
              return;
           end
        end
        if ~isempty(answer{3})
           G_2=str2num(answer{3});
            [n7,m7]=size(G_2);
           if m7~=n6
              msgbox('G��Qά��������','ȷ�ϳ�ʼ��','warn') 
              return;
           elseif n7~=n1
               msgbox('G��X0ά��������','ȷ�ϳ�ʼ��','warn') 
              return;
           end
        end
    end
 %===========�˶γ���ֱ�Ӷ�ȫ�ֱ������в���������ʮ�ֱ��գ����Ҫ��������===
   
    
    
% --- Executes on button press in Measure_Model.
function Measure_Model_Callback(hObject, eventdata, handles)
% hObject    handle to Measure_Model (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global H_2;
global R_2;
global Allneed2;
H= H_2;
R= R_2;
Wei_Z=Allneed2.Wei_Z;
Fx=Allneed2.Fx;
Flag=Allneed2.Flag_init;
try
Wei_Z_Pre=handles.Wei_Z;
catch
    Wei_Z_Pre=2;
end%��һ�����������
for r=1:1
%==================����۲����==========================
    syms x y z;
    switch Wei_Z
        case 2
            
            if Wei_Z_Pre==Wei_Z
                f1=Fx{1};
                f2=Fx{2};
            else
            %==Ĭ������µ�==                                                %�����������������˴� �Ա㱣����һ�ε�ֵ
            f1=sqrt(x^2+y^2);
            f2=atan(y/x);
            R=diag([6400,0.000025]);
            end
            
            %===���ݶԻ��������==
            prompt={['Z=F(X):', char(13), char(10),'f1(X)'],'f2(X)','R(k):(m��m)'};%�����Ļ��н�Ҳ��������Ҫ�� �س��� ����  �س���ԭ���ǻص�����
            title='Measure Model Parameters';
            row=[4,4,4]';col=[30,30,30]';
            lines=[row,col];
            def={char(f1),char(f2),num2str(R)};
            %options.Resize='on';options.WindowStyle='normal';options.Interpreter='tex';
            %answer=inputdlg(prompt,title,lines,def,options);%options.Interpreter����Ϊ'tex'ò��û�ð�
            answer=inputdlg(prompt,title,lines,def);
            if isempty(answer)
                msgbox('��ȷ���Ƿ���г�ʼ��','ȷ�ϳ�ʼ��','warn')
            else
                if ~isempty(answer{1})                    
                    A1=answer{1};
                    f1=sym(A1);
                    h11=diff(f1,x);
                    h12=diff(f1,y);
                    %disp(H);
                end
                if ~isempty(answer{2})
                    A2=answer{2};
                    f2=sym(A2);
                    h21=simple(diff(f2,x));
                    h22=simple(diff(f2,y));                    
                end
                if ~isempty(answer{3})
                    R=str2num(answer{3});
                end                
            end
            H={h11,h12;h21 h22};
            Fx={f1;f2};
        case 3
            %================����������Ա㱣���ϴε�����ֵ=================
             
                if Wei_Z_Pre==Wei_Z
                    f1=Fx{1};
                    f2=Fx{2};
                    f3=Fx{3};
                else
                    f1=sqrt(x^2+y^2+z^2);
                    %f2=atan2(y,x);
                    f2=atan(y/x);
                    f3=atan(z/sqrt(x^2+y^2));
                    R=diag([6400,0.000025,0.000025]);
                end
            %==========
            prompt={['Z=F(X):', char(13), char(10),'f1(X)'],'f2(X)','f3(X)','R(k):(m��m)'};%�����Ļ��н�Ҳ��������Ҫ�� �س��� ����  �س���ԭ���ǻص�����
            title='Measure Model Parameters';
            row=[4,4,4,4]';col=[30,30,30,30]';
            lines=[row,col];
            def={char(f1),char(f2),char(f3),num2str(R)};
            answer=inputdlg(prompt,title,lines,def);
            if isempty(answer)
                msgbox('��ȷ���Ƿ���г�ʼ��','ȷ�ϳ�ʼ��','warn')
            else
                if ~isempty(answer{1})                    
                    A1=answer{1};
                    f1=sym(A1);
                    h11=diff(f1,x);
                    h12=diff(f1,y);
                    h13=diff(f1,z);
                    %disp(H);
                end
                if ~isempty(answer{2})
                    A2=answer{2};
                    f2=sym(A2);
                    h21=simple(diff(f2,x));
                    h22=simple(diff(f2,y));       
                    h23=simple(diff(f3,z)); 
                end
                if ~isempty(answer{3})
                    A3=answer{3};
                    f3=sym(A3);
                    h31=simple(diff(f3,x));
                    h32=simple(diff(f3,y)); 
                    h33=simple(diff(f3,z));  
                end
                if ~isempty(answer{4})
                    R=str2num(answer{4});
                end                
            end
             H={h11,h12,h13;h21 h22 h23;h31 h32 h33};
             Fx={f1;f2;f3};
        case 1
            if Wei_Z_Pre==Wei_Z
                f1=Fx{1};
            else
                f1=atan(y/x);
                R=diag([0.000025]);
            end
            
            prompt={['Z=F(X):','  ','f1(X)'],'R(k):(m��m)'};
            title='Measure Model Parameters';
            row=[4,4]';col=[30,30]';
            lines=[row,col];
            def={char(f1),num2str(R)};
            answer=inputdlg(prompt,title,lines,def);
            if isempty(answer)
                msgbox('��ȷ���Ƿ���г�ʼ��','ȷ�ϳ�ʼ��','warn')
            else
                if ~isempty(answer{1})                    
                    A1=answer{1};
                    f1=sym(A1);
                    h11=diff(f1,x);
                    h12=diff(f1,y);                   
                end
                 if ~isempty(answer{2})
                    R=str2num(answer{2});
                end   
                
            end
             H={h11,h12}
             Fx={f1};
        otherwise
            msgbox('�۲�ռ䲻��ʵ�ʵ����(ά��>3)����ʱδ�ܴ���','ȷ�ϳ�ʼ��','warn');            
    end
    %===============����ȷ��H����ʽ==================
    switch Flag
        case 62
            switch Wei_Z            %ȫ��������һ������ʽ ����һ����˼· ��������������Ӧ�����з��̸����ֱ�Ϊ 1 2 3�����Σ���һ�����԰ѹ۲ⷽ�̸���Ϊ1 2����3 ���������� ������Ϊ0
                case 1
                    H=[H{1,1},0,0,H{1,2},0,0];                    %����Flag Wei_Z��������������Wei_Z=2;Flag=63 �ֱ������H��������������H{i,j}��λ��
                case 2
                    H=[H{1,1},0,0,H{1,2},0,0;
                        H{2,1},0,0,H{2,2},0,0];
                case 3
                    H=[H{1,1},0,0,H{1,2},0,0;
                        H{2,1},0,0,H{2,2},0,0;
                        H{3,1},0,0,H{3,2},0,0];
            end            
        case 63
            switch Wei_Z
                case 1
                    H=[H{1,1},0,H{1,2},0,H{1,3},0];                    
                case 2
                    H=[H{1,1},0,H{1,2},0,H{1,3},0;
                       H{2,1},0,H{2,2},0,H{2,3},0];
                      
                case 3
                    H=[H{1,1},0,H{1,2},0,H{1,3},0;
                       H{2,1},0,H{2,2},0,H{2,3},0;
                       H{3,1},0,H{3,2},0,H{3,3},0];
            end
        case 93
            switch Wei_Z
                case 1
                    H=[H{1,1},0,0,H{1,2},0,0,H{1,3},0,0];                    
                case 2
                    H=[H{1,1},0,0,H{1,2},0,0,H{1,3},0,0;
                       H{2,1},0,0,H{2,2},0,0,H{2,3},0,0];
                case 3
                    H=[H{1,1},0,0,H{1,2},0,0,H{1,3},0,0;
                        H{2,1},0,0,H{2,2},0,0,H{2,3},0,0;
                        H{3,1},0,0,H{3,2},0,0,H{3,3},0,0;];
            end
        case 42
            switch Wei_Z  
                case 1
                    H=[H{1,1},0,H{1,2},0];                    
                case 2
                    H=[H{1,1},0,H{1,2},0;
                        H{2,1},0,H{2,2},0];
                case 3
                    H=[H{1,1},0,H{1,2},0;
                        H{2,1},0,H{2,2},0;
                        H{3,1},0,H{3,2},0];
            end
        otherwise
            msgbox('��ʱδ��д��Ӧ����','ע��','warn');
    end
end
handles.Wei_Z=Wei_Z;
guidata(hObject, handles);
H_2= H;
disp(H(1,1));disp(H(1,4));disp(H(2,1));disp(H(2,4));
Allneed2.Fx=Fx;
R_2=R;


% --- Executes on selection change in Motion_Popup.
function Motion_Popup_Callback(hObject, eventdata, handles)
% hObject    handle to Motion_Popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Motion_Popup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Motion_Popup

global T1_2;
global A_2;
global G_2;
global Q_2;
global Allneed2;
A=A_2;
G=G_2;
Q=Q_2;
T1=T1_2;
Flag=Allneed2.Flag_init;

Which=get(handles.Motion_Popup,'value');
for r=1:1
CV_I=[1 T1 0;0 1 0; 0 0 0];
CA_I=[1 T1 0.5*T1^2;0 1 T1; 0 0 1];   

G_AI=[0.5*T1^2,T1,1]';
G_VI=[T1,1,0]';
Q_I=0.1;

switch Which
    case 1       %CAģ�� 
        switch Flag
            case 21
                msgbox('��ǰ��ʼ��������Ĭ�ϵĴ�ģ�ͣ�������ѡ��','Warning','warn');return;
            case 22
                msgbox('��ǰ��ʼ��������Ĭ�ϵĴ�ģ�ͣ�������ѡ��','Warning','warn');return;
            case 31
                A=CA_I;
                G=G_AI;
                Q=Q_I;
            case 42
                 msgbox('��ǰ��ʼ��������Ĭ�ϵĴ�ģ�ͣ�������ѡ��','Warning','warn');return;
            case 62
                  A=[CA_I,zeros(3);zeros(3),CA_I];
                  G=[G_AI,zeros(3,1);zeros(3,1),G_AI];
                  Q=diag([Q_I,Q_I]);
            case 63
                msgbox('��ǰ��ʼ��������Ĭ�ϵĴ�ģ�ͣ�������ѡ��','Warning','warn');return;
            case 93
                A=[CA_I,zeros(3,6);zeros(3),CA_I,zeros(3);zeros(3,6),CA_I];
                G=[0.5*T1^2,0,0;T1,0,0;1,0,0;  0,0.5*T1^2,0;0,T1,0;0,1,0;0 0 0.5*T1^2;0,0,T1;0 0 1];
                Q=diag([Q_I,Q_I,Q_I]);
            otherwise
                msgbox('��ǰ��ʼ��������Ĭ�ϵĴ�ģ�ͣ�������ѡ��','Warning','warn');return;   
        end
    case 2  %CVģ��
        switch Flag
            case 21
                A=[T1,1];
                G=1;
                Q=Q_I;
            case 22
                msgbox('��ǰ��ʼ��������Ĭ�ϵĴ�ģ�ͣ�������ѡ��','Warning','warn');return;
            case 31
                A=[1 T1 0;0 1 0; 0 0 0];
                G=[T1,1,0]';
                Q=Q_I;
            case 42
                 A=[1 T1 0 0;0 1  0 0; 0 0 1 T1; 0 0 0 1];
                 G=[T1 0; 1 0; 0 T1;0 1];
                 Q=diag([Q_I,Q_I]);
            case 62
                A=[CA_I,zeros(3);zeros(3),CA_I];
                G=[G_AI,zeros(3,1);zeros(3,1),G_AI];
                Q=diag([Q_I,Q_I]);
            case 63
                 A=[ 1 T1 0 0 0 0;
                     0 1  0 0 0 0;
                     0 0 1 T1 0 0; 
                     0 0 0 1 0 0 ;
                     0 0 0 0 1 T1
                     0 0 0 0 0 1 ];
                   
                 G=[T1 0 0; 1 0 0; 0 T1 0;0 1 0; 0 0 T1; 0 0 1];
                 Q=diag([Q_I,Q_I,Q_I]);
            case 93
                 A=[CV_I,zeros(3,6);zeros(3),CV_I,zeros(3);zeros(3,6),CV_I];
                G=[G_VI,zeros(3,2);zeros(3,1),G_VI,zeros(3,1);zeros(3,2),G_VI;];
                   Q=diag([Q_I,Q_I,Q_I]);
            otherwise
                msgbox('��ǰ��ʼ��������Ĭ�ϵĴ�ģ�ͣ�������ѡ��','Warning','warn');return;   
        end
    case 3
        
         w1=2*pi/100;     %%0.0628rad/s=3.6��/s     %֮������w1����w����Ϊ��T1��Ӧ   %��Ҫ��д������w1�ϴε�����ֵ
         
        prompt={'Angular velocity'};
        title='Angular velocity';
        row=[2]';col=[30]';
        lines=[row,col];
        def={num2str(w1)};
        options.Resize='on';options.WindowStyle='normal';options.Interpreter='none';
        answer=inputdlg(prompt,title,lines,def,options);
        if isempty(answer)
           msgbox('���ٶȱ���ԭֵ��������ԭ״̬','ȷ�ϳ�ʼ��','warn')                         %�Ľ��������ȡ����ʱ�򲻵����˴��ڣ�
        else
           w1=str2num(char(answer));
           %w1=answer;
        end
         
               switch Flag
                   case 42
                       A=[ 1  sin(w1*T1)/w1          0  (cos(w1*T1)-1)/w1   ;
                           0  cos(w1*T1)             0   -sin(w1*T1)        ;
                           0  (1-cos(w1*T1))/w1      1   sin(w1*T1)/w1      ;
                           0  sin(w1*T1)             0   cos(w1*T1)         ];
                       G=[1/2*T1^2,0; T1,0;   0,1/2*T1^2; 0,T1];
                       Q=diag([Q_I,Q_I]);
                   case 62
                       A=[ 1  sin(w1*T1)/w1        0   0  (cos(w1*T1)-1)/w1  0 ;
                           0  cos(w1*T1)           0   0   -sin(w1*T1)       0 ;
                           0   0                   0   0     0               0 ;
                           0  (1-cos(w1*T1))/w1    0   1   sin(w1*T1)/w1     0 ;
                           0  sin(w1*T1)           0   0   cos(w1*T1)        0 ;
                           0   0                   0   0     0              0 ];
                       G=[1/2*T1^2,0; T1,0;  0 0; 0,1/2*T1^2; 0,T1 ;0 0];
                       Q=diag([Q_I,Q_I]);
                   case 63
                       A=[ 1  sin(w1*T1)/w1          0  (cos(w1*T1)-1)/w1    0 0;
                           0  cos(w1*T1)             0   -sin(w1*T1)         0 0  ;
                           0  (1-cos(w1*T1))/w1      1   sin(w1*T1)/w1       0 0  ;
                           0  sin(w1*T1)             0   cos(w1*T1)          0 0  ;
                           0       0                 0        0              1 T1 ;
                           0       0                 0        0              0 1];
                       G=[T1,0 0; 1,0 0;  0  T1 0; 0,1 0; 0, 0 T1 ;0  0 1];
                       Q=diag([Q_I,Q_I,Q_I]);
                   case 93
                       chose=questdlg('Z���������','��ѡ����ά�ռ���CTģ��','X-Y:CT,Z:CV','��άCT','X-Y:CT,Z:CV') ; %��ʱZ����ɵ�����ģ
                       if strcmp(chose,'X-Y:CT,Z:CV')
                           A=[ 1  sin(w1*T1)/w1        0   0  (cos(w1*T1)-1)/w1  0  0  0  0;
                               0  cos(w1*T1)           0   0   -sin(w1*T1)       0  0  0  0 ;
                               0   0                   0   0     0               0  0  0  0;
                               0  (1-cos(w1*T1))/w1    0   1   sin(w1*T1)/w1     0  0  0  0 ;
                               0  sin(w1*T1)           0   0   cos(w1*T1)        0  0  0  0 ;
                               0   0                   0   0     0               0  0  0  0
                               0   0                   0   0     0               0  1 T1  0
                               0   0                   0   0     0               0  0  1  0
                               0   0                   0   0     0               0  0  0  0];
                           G=[T1,0 0; 1,0 0; 0 0 0; 0  T1 0; 0,1 0; 0 0 0; 0, 0 T1 ;0  0 1; 0 0 0;];
                           Q=diag([Q_I,Q_I,Q_I]);
                       else
                           F_w3_I=[ 1  sin(w1*T1)/w1   (1-cos(w1*T1))/w1^2   ;
                                    0   cos(w1*T1)       sin(w1*T1)/w1       ;
                                    0   -w1*sin(w1*T1)     cos(w1*T1)         ];
                           G_=[0.167*T1^3 0.5*T1^2 T1]';

                           %A=diag([F_w3_I F_w3_I F_w3_I]);%FUCK ����д�����У�����
                           A=[F_w3_I,zeros(3,6);zeros(3),F_w3_I,zeros(3);zeros(3,6),F_w3_I;];
                          % A=[CV_I,zeros(3,6);zeros(3),CV_I,zeros(3);zeros(3,6),CV_I];
                           G=[G_,zeros(3,2);zeros(3,1),G_,zeros(3,1);zeros(3,2),G_;];
                           Q=diag([Q_I,Q_I,Q_I]);
                       end
                   otherwise
                       msgbox('��ǰ��ʼ��������Ĭ�ϵ�CTģ�ͣ�������ѡ��','Warning','warn');return;
               end
           
          
    case 4
        msgbox('��δ��дSingerģ�ͣ�������ѡ��','Warning','warn');return;   
        return;
    case 5
        msgbox('��δ��дCSģ�ͣ�������ѡ��','Warning','warn');return;   
        return;
    otherwise
        msgbox('��δ��дģ�ͣ�������ѡ��','Warning','warn');return;   
        return;
end

end  
A_2=A;
G_2=G;
Q_2=Q;
%T1_2=T1;


% --- Executes during object creation, after setting all properties.
function Motion_Popup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Motion_Popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Classical.
function Classical_Callback(hObject, eventdata, handles)
% hObject    handle to Classical (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Classical
if get(handles.Classical,'value')==1
    set(handles.Motion_Popup,'visible','on');
    set(handles.CompletelyManual,'visible','on','value',0);
    set(handles.Classical,'visible','off');
end
Motion_Popup_Callback(hObject, eventdata, handles)


% --- Executes on button press in Prompt.
function Prompt_Callback(hObject, eventdata, handles)
% hObject    handle to Prompt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox({'The "X0" format is given!';'  ';'After clicking "Original State",the filter needs to be restarted'},'Prompt')


% --- Executes on button press in CompletelyManual.
function CompletelyManual_Callback(hObject, eventdata, handles)
% hObject    handle to CompletelyManual (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of CompletelyManual
if get(handles.CompletelyManual,'value')==1         %���ڷ����Լ��Ļص������� �����һ�����Ӧ�Ĵ���  ����������ж�ò��û����
    set(handles.Motion_Popup,'visible','off');
    set(handles.CompletelyManual,'visible','off');
    set(handles.Classical,'visible','on','value',0);
end


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


% --- Executes on button press in True.
function True_Callback(hObject, eventdata, handles)
% hObject    handle to True (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Wei_2;
global Xtrue_Data_2;
Wei=Wei_2;
Xtrue_Data=Xtrue_Data_2;

%=========��������=========
for r=1:1
[F_name,P_name]= uigetfile('*.mat');
Fullname=fullfile(P_name, F_name);
if isequal(F_name,0) || isequal(P_name,0)
      msgbox('User pressed cancel','ȷ����������','warn')
       return
end
try 
    F= load (Fullname);
catch
    msgbox('��������ʧ��','Warning','warn','modal');
    return
end
F_cell=struct2cell(F);%%��������Ҫһ���ж������ж� ��ά����
Xtrue_Data=F_cell{1};

%==========��ͼ=================



 [m,n]=size(F_cell{1});
     switch m
         case 2
             if Wei==1
                 axes(handles.axes1);          %��ά����Ӧ�����ά���ݷֱ��ڲ�ͬ����ϵ���Խ�� ����ϵ�����Զ�˳�����л�����
                 set(handles.axes1,'Visible','on');       %�������������ϵ��ص�axes1,�������´�û�������䣬axes1Ӧ�ÿ������İ��������ͣ�axes(handles.axes1); ������䲻��������ϵaxes1��Ϊ��ǰ����ϵ���ҿɼ�
                 cla(handles.axes_3wei);
                 legend off;
                 set(handles.axes_3wei,'Visible','off');
                 plot(F_cell{1}(1,:));
             elseif Wei==2
                 axes(handles.axes1);
                 set(handles.axes1,'Visible','on');
                 cla(handles.axes_3wei);
                 legend off;
                 set(handles.axes_3wei,'Visible','off');
                 plot(F_cell{1}(1,:),F_cell{1}(2,:));
             else
                 msgbox('�����������ռ�ά������','Warning','warn','modal');
             end
         case 3
             if Wei==1
                 axes(handles.axes1);
                 set(handles.axes1,'Visible','on');
                 cla(handles.axes_3wei);
                 legend off;
                 set(handles.axes_3wei,'Visible','off');
                 plot(F_cell{1}(1,:));
             else
                 msgbox('�����������ռ�ά������','Warning','warn','modal');
             end
         case 4
             if Wei==2
                 axes(handles.axes1);
                 set(handles.axes1,'Visible','on');
                 cla(handles.axes_3wei);
                 legend off;
                 set(handles.axes_3wei,'Visible','off');
                 plot(F_cell{1}(1,:),F_cell{1}(3,:));
             else
                 msgbox('�����������ռ�ά������','Warning','warn','modal');
             end
         case 6
             if Wei==2
                 axes(handles.axes1);
                 set(handles.axes1,'Visible','on');
                 cla(handles.axes_3wei);
                 legend off;
                 set(handles.axes_3wei,'Visible','off');
                 plot(F_cell{1}(1,:),F_cell{1}(4,:));
             elseif Wei==3
                 cla(handles.axes1);
                 legend off;
                 set(handles.axes1,'Visible','off');
                 set(handles.axes_3wei,'Visible','on');     %ÿ��������switch ֮ǰ��Ҫ�ر�axes2 Ȼ��������ٴ�
                 axes(handles.axes_3wei);
                 plot3(F_cell{1}(1,:),F_cell{1}(3,:),F_cell{1}(5,:))         %������ά����ϵ�ĵط�Ӧ�����һ������ϵ �ѽ������ϵ����˳���л������⡣
             else
                 msgbox('�����������ռ�ά������','Warning','warn','modal');
             end

         case 9
             if Wei==3
                 cla(handles.axes1);
                 legend off;
                 set(handles.axes1,'Visible','off');
                 set(handles.axes_3wei,'Visible','on');     %ÿ��������switch ֮ǰ��Ҫ�ر�axes2 Ȼ��������ٴ�
                 axes(handles.axes_3wei);
                 plot3(F_cell{1}(1,:),F_cell{1}(4,:),F_cell{1}(7,:))
             else
                 msgbox('�����������ռ�ά������','Warning','warn','modal');
             end
         otherwise
             msgbox('��������ݲ��Ǳ�׼����ʵ���ݣ��޷���ͼ','Warning','warn','modal'); %֮��ĳ����Ծ�ִ�У�retrunֱ���˳�����
             %return;
             cla(handles.axes1);
     end
end
Xtrue_Data_2=Xtrue_Data; 


% --- Executes on button press in Observed.
function Observed_Callback(hObject, eventdata, handles)
% hObject    handle to Observed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Obs_Data_2;
global Wei_2;
%global Allneed2;
Wei= Wei_2;
Obs_Data=Obs_Data_2;
%Wei_Z=Allneed2.Wei_Z; %Wei_Z����ֵ���Ը���Obs_Data_2��ȡ��

for r=1:1
%%===========��������===========
[F_name,P_name]= uigetfile('*.mat');
Fullname=fullfile(P_name, F_name);
if isequal(F_name,0) || isequal(P_name,0)
       msgbox('User pressed cancel','ȷ����������','warn')
       return
%else  disp(['User selected ', Fullname]) %���Գ���ʱ��
end
try 
     F= load (Fullname);
catch
    msgbox('��������ʧ��','Warning','warn','modal');
    return
end
F_cell=struct2cell(F);%%��������Ҫһ���ж������ж� ��ά����
Obs_Data=F_cell{1};
               

% =========������ʾ�۲�����=============
% %%%������������������������ʾ�۲����ݵĹ���Ӧ�����ѵõ��ĺ���������������ú�������ά�ռ�����ֵ �������õ�����֪���� ��Ϊͨ���������ǲ��е�
% ��λһ�������� �����Ի�ͼ ���ֻ�Ƚ���ʵֵ���˲�ֵ


  %Ӧ���ж�����ͼ��״̬��ʵ���� ������ĳ�����˱�׼���״������ⶼ���ܻ�ͼ       
                                  

% �۲����� ��Ҫ���� Wei��Wei_Z���Զ�ת��Ϊֱ������ϵ���ڻ�ͼ
 [m,n]=size(F_cell{1});                    
 switch Wei
     case 1
             if m==1
                 msgbox('��������ݲ��Ǳ�׼�ռ�Ĺ۲����ݣ�','Warning','warn','modal');return;
             else

                 Back=questdlg('��������ݲ��Ǳ�׼�Ĺ۲�����,�Ƿ����','��ѡ��','����','�˳�','�˳�');%���һ����Ĭ��ѡ��
                 if strcmp(Back,'����')
                     msgbox('���ܼ����˲����������ͼ','Warning');
                 else
                     return
                 end
             end
     case 2
             if m==2                 %������Ҫע�� 3ά�ռ���ֻ�������Ƕȵ��������ʱ���ܻ�ͼ ������Ӧ�����ܽ���
                 axes(handles.axes1);
                 set(handles.axes1,'Visible','on');
                 cla(handles.axes_3wei);
                 legend off;
                 set(handles.axes_3wei,'Visible','off');
                 
              %=====ʹ��������Ϣ��ͼ===   
                 hold on;
                 RLook=F_cell{1};
                 zx=RLook(1,:).*cos(RLook(2,:));
                 zy=RLook(1,:).*sin(RLook(2,:));
                 RLook_Zhi=[zx;zy];
                 plot(RLook_Zhi(1,:),RLook_Zhi(2,:),'k');
             %elseif m==1
             else
                 Back=questdlg('��������ݲ��Ǳ�׼�Ĺ۲�����00000000,�Ƿ����','��ѡ��','����','�˳�','�˳�');%���һ����Ĭ��ѡ��
                 if strcmp(Back,'����')
                     msgbox('���ܼ����˲����������ͼ','Warning');
                 else
                     return
                 end
             end
     case 3
             if m==3
                 cla(handles.axes1);
                 legend off;
                 set(handles.axes1,'Visible','off');
                 set(handles.axes_3wei,'Visible','on');     %ÿ��������switch ֮ǰ��Ҫ�ر�axes2 Ȼ��������ٴ�
                 axes(handles.axes_3wei);
                 
%=====ʹ��������Ϣ��ͼ===   
                 hold on;
                 RLook=F_cell{1};
                 Zx=RLook(1,:).*cos(RLook(2,:)).*cos(RLook(3,:));          %���ε����ǣ����롢��λ�ǡ������� ��ͬ��������ϵ
                 Zy=RLook(1,:).*sin(RLook(2,:)).*cos(RLook(3,:));
                 Zz=RLook(1,:).*sin(RLook(3,:));
                 RLook_Zhi=[Zx;Zy;Zz];
                 plot3(RLook_Zhi(1,:),RLook_Zhi(2,:),RLook_Zhi(3,:),'k');
                 %elseif m==2
             else
                 Back=questdlg('��������ݲ��Ǳ�׼�Ĺ۲�����,�Ƿ����','��ѡ��','����','�˳�','�˳�');%���һ����Ĭ��ѡ��
                 if strcmp(Back,'����')
                     msgbox('���ܼ����˲����������ͼ','Warning');
                 else
                     return
                 end
             end
     otherwise        
          Back=warndlg('��������ʵ�ռ�,�Ƿ����','ע��');%���һ����Ĭ��ѡ��
           return;
 end
end

Obs_Data_2=Obs_Data; 


% --- Executes on button press in Start.
function Start_Callback(hObject, eventdata, handles)
% hObject    handle to Start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global X0_2;%1
global P0_2;
global T1_2;
global Wei_2;

global A_2;%2
global G_2;
global Q_2;
global H_2;%3
global R_2;

global Xtrue_Data_2;%4
global Obs_Data_2;
global Result_EKF;
global Allneed2;
X0=X0_2;
P0=P0_2;
T1=T1_2;
Wei= Wei_2;
A= A_2;
G=G_2;
Q= Q_2;
H=H_2;
R=R_2;
Obs_Data=Obs_Data_2;
Xtrue_Data=Xtrue_Data_2;

Flag=Allneed2.Flag_init;
Fx=Allneed2.Fx;
Wei_Z=Allneed2.Wei_Z;

%========�˲�����==================================================

for r=1:1
 %=========׼������=============
     if isempty(Obs_Data)
         msgbox('û�й۲�����','ȷ�ϳ�ʼ��','warn')
         return;
     end
     n=length(X0);
     [m,Num]=size(Obs_Data);         %��������¹۲����ݵ�ά��m Ӧ�þ��ǿռ�ά��Wei,

     times=Num*T1;
     re_X=zeros(n,Num);    re_P=zeros(n,n,Num);  re_K=zeros(n,m,Num);

     try
         re_X(:,1)=X0;
         re_P(:,:,1)=P0;
     catch
         msgbox('�˲�ʧ��','Warning','warn','modal');
         return
     end
     [n_A,m_A]=size(A);
     if isempty(A)||(n_A~=n)
         msgbox('ע���˲�����Motion Model���Ƿ����£����г�ʼ��','ȷ�ϳ�ʼ��','warn')
     end
     [n_H,m_H]=size(H);   %H���д����˹۲ⷽ�̵ĸ�����Wei_Z ���������˿ռ�ά��Wei_2  %H�ľ�����ʽ�д�����
     if isempty(H)||(m_H~=n)                                                       %�Ľ�
         msgbox('ע���˲�����Measrue Model���Ƿ����£����г�ʼ��','ȷ�ϳ�ʼ��','warn')
     end

%==========��ʽ�˲�=========

    for k=2:Num
        Z=Obs_Data(:,k);  
        xyuce=A*re_X(:,k-1);
        syms x y z;
        
        %ͬ����Ҫ����Flag ��Wei_Z����ֵ��ͬʱ���ڷ��ű������������� ����ͬʱ������Zyuce
        switch Flag
            case 62
                H1=subs(H,{x,y},[xyuce(1),xyuce(4)]); 
               
                zyuce=subs(Fx,{x,y},[xyuce(1),xyuce(4)]);%���ڷ��ű�����atan2�����޷�ʹ�õ���zyuce�ĽǶ�ȡֵ��Χ��С ����˲������ԡ�
                                                                             %���ʽ�ӵ����Ծ�ʹ����������Ϣ��������������� ��λ�� ����������ء�
if xyuce(1)<0                                                                %����������xû��С��0��������Ҫ�����
    zyuce(2)= zyuce(2)+pi;
end

            case 63
                H1=subs(H,{x,y,z},[xyuce(1),xyuce(3),xyuce(5)]); 
                zyuce=subs(Fx,{x,y,z},[xyuce(1),xyuce(3),xyuce(5)]);
            case 93
                H1=subs(H,{x,y,z},[xyuce(1),xyuce(4),xyuce(7)]); 
                zyuce=subs(Fx,{x,y,z},[xyuce(1),xyuce(4),xyuce(7)]);
 if xyuce(1)<0                                                              %����������xû��С��0��������Ҫ�����                        
    zyuce(2)= zyuce(2)+pi;
end
            case 42
                H1=subs(H,{x,y},[xyuce(1),xyuce(3)]); 
                zyuce=subs(Fx,{x,y},[xyuce(1),xyuce(3)]);
            otherwise
                msgbox('��ʱδ��д��Ӧ����','ע��','warn');
        end
       

       [re_X(:,k),re_P(:,:,k),re_K(:,:,k)]=EKf_GUI(re_X(:,k-1),re_P(:,:,k-1),Z,A,G,Q,H1,R,zyuce); %����Flagò�Ʋ����� ������Ҫһ������������Ԥ��Ĺ۲�ֵZk
    end
%======������Result_EKF======
    Result_EKF.X=re_X;
    Result_EKF.P=re_P;
    Result_EKF.K=re_K;    %�ڴ���û�б�Ҫ���һ��re_K 
    Result_EKF.Flag=Flag;  %ͨ������һ����־λ��ȷ���Ǻ������������ĳ���ֻҪ���ݴ˱�־λ������Flag

    Gain.K=re_K;
    Result_EKF.Gain=0;  
    Result_EKF.Error=0;%��ʼ������ֹ�����г���û�������Ĵ���
end

% ============================��ͼ======================================
for r=1:1

    switch Flag
        case 21
            axes(handles.axes1);
            set(handles.axes1,'Visible','on');
            cla(handles.axes_3wei);
            legend off;
            set(handles.axes_3wei,'Visible','off');
            plot(re_X(1,:),'r');
        case 22
            axes(handles.axes1);
            set(handles.axes1,'Visible','on');
            cla(handles.axes_3wei);
            legend off;
            set(handles.axes_3wei,'Visible','off');
            plot(re_X(1,:),re_X(2,:),'r');
        case 31
            axes(handles.axes1);
            set(handles.axes1,'Visible','on');
            cla(handles.axes_3wei);
            legend off;
            set(handles.axes_3wei,'Visible','off');
            plot(re_X(1,:),'r');
        case 42
            axes(handles.axes1);
            set(handles.axes1,'Visible','on');
            cla(handles.axes_3wei);
            legend off;
            set(handles.axes_3wei,'Visible','off');
            plot(re_X(1,:),re_X(3,:),'r',re_X(1,1),re_X(3,1),'sr');
        case 62
            axes(handles.axes1);
            set(handles.axes1,'Visible','on');
            cla(handles.axes_3wei);
            legend off;
            set(handles.axes_3wei,'Visible','off');
            plot( re_X(1,:),re_X(4,:),'r',re_X(1,1),re_X(4,1),'sr');
            legend('��ʵֵ','�۲�ֵ','�˲�ֵ','�˲���ʼ��','Location','Best' );
            % set(handles.axes1,'XLim',[-90000,10000],'YLim',[7800,8200])
        case 63
            %��ά��ͼ��Ҫר������һ������ϵ
            cla(handles.axes1);
            legend off;
            set(handles.axes1,'Visible','off');
            set(handles.axes_3wei,'Visible','on');
            axes(handles.axes_3wei);
            plot3(re_X(1,:),re_X(3,:),re_X(5,:),'r',re_X(1,1),re_X(3,1),X0(5,1),'sr');
        case 93
            cla(handles.axes1);
            legend off;
            set(handles.axes1,'Visible','off');
            set(handles.axes_3wei,'Visible','on');
            axes(handles.axes_3wei);
            plot3(re_X(1,:),re_X(4,:),re_X(7,:),'r',re_X(1,1),re_X(4,1),re_X(7,1),'sr');
            Flag=93;
            % disp(re_X);
        otherwise
            msgbox('�˲���ɣ�����ͼ����','Warning','warn');
            %return;
            cla(handles.axes1);
            return;
    end
end
 set(handles.DataAnalysis,'Visible','on');    %--------�ɹ���ͼ֮���չʾShowResult�����˵�
 
% ============================���ݷ���==================================

for r=1:1
    switch Flag
        case 21
            msgbox('�˲���ɣ���ʱδ��д���ݴ���ĳ��������','Warning','warn');return;%�Ӳ���return �أ�
        case 22
            
            msgbox('�˲���ɣ���ʱδ��д���ݴ���ĳ��������','Warning','warn');
            
        case 31
            msgbox('�˲���ɣ���ʱδ��д���ݴ���ĳ��������','Warning','warn');
        case 42
            msgbox('�˲���ɣ���ʱδ��д���ݴ���ĳ��������','Warning','warn');
        case 62                        %�������Լ�Kֵ�仯����
            
            try
                [Error.x,Error.y,Error.xv,Error.yv,Error.xa,Error.ya,Error.X,Error.V,Error.A]=Err(re_X,Xtrue_Data);
                
                Result_EKF.Error=Error;
                
                %disp(Result)  %���Գ���ʱʹ��
                %disp(Result.Error.x)  %���ֵ��ø�ʽ����
                Kx=reshape(re_K(1,1,:),1,size(re_K(1,1,:),3));Kx(1)=Kx(2);
                Ky=reshape(re_K(4,2,:),1,size(re_K(4,2,:),3));Ky(1)=Ky(2);
                Kxv=reshape(re_K(2,1,:),1,size(re_K(2,1,:),3));Kxv(1)=Kxv(2);
                Kyv=reshape(re_K(5,2,:),1,size(re_K(5,2,:),3));Kyv(1)=Kyv(2);
                Kxa=reshape(re_K(3,1,:),1,size(re_K(3,1,:),3));Kxa(1)=Kxa(2);
                Kya=reshape(re_K(6,2,:),1,size(re_K(6,2,:),3));Kya(1)=Kya(2);
                
                Gain.Kx=Kx; Gain.Kxv=Kxv;   Gain.Kxa=Kxa;
                Gain.Ky=Ky; Gain.Kyv=Kyv;   Gain.Kya=Kya;
               Result_EKF.Gain=Gain;
                %disp(Result)
                %disp(Result.Gain.Kxv)
            catch
                msgbox('�˲���ɣ������ݷ�������','Warning','warn');
            end
        case 63
            msgbox('�˲���ɣ���ʱδ��д���ݴ���ĳ��������','Warning','warn');
        case 93
                % try
                     [Error.x,Error.y,Error.z,  Error.xv,Error.yv,Error.zv,  Error.xa,Error.ya,Error.za,  Error.X,Error.V,Error.A]=Err93(re_X,Xtrue_Data);
                     Result_EKF.Error=Error;

                     %disp(Result)  %���Գ���ʱʹ��
                     %disp(Result.Error.x)  %���ֵ��ø�ʽ����
                     Kx=reshape(re_K(1,1,:),1,size(re_K(1,1,:),3));Kx(1)=Kx(2);
                     Ky=reshape(re_K(4,2,:),1,size(re_K(4,2,:),3));Ky(1)=Ky(2);
                     Kz=reshape(re_K(7,3,:),1,size(re_K(7,3,:),3));Kz(1)=Kz(2);

                     Kxv=reshape(re_K(2,1,:),1,size(re_K(2,1,:),3));Kxv(1)=Kxv(2);
                     Kyv=reshape(re_K(5,2,:),1,size(re_K(5,2,:),3));Kyv(1)=Kyv(2);
                     Kzv=reshape(re_K(8,3,:),1,size(re_K(8,3,:),3));Kzv(1)=Kzv(2);

                     Kxa=reshape(re_K(3,1,:),1,size(re_K(3,1,:),3));Kxa(1)=Kxa(2);
                     Kya=reshape(re_K(6,2,:),1,size(re_K(6,2,:),3));Kya(1)=Kya(2);
                     Kza=reshape(re_K(9,3,:),1,size(re_K(9,3,:),3));Kza(1)=Kza(2);
                     Gain.Kx=Kx; Gain.Kxv=Kxv;   Gain.Kxa=Kxa;
                     Gain.Ky=Ky; Gain.Kyv=Kyv;   Gain.Kya=Kya;
                     Gain.Kz=Kz; Gain.Kzv=Kzv;   Gain.Kza=Kza;
                     Result_EKF.Gain=Gain;
                 %catch
                  %   msgbox('�˲���ɣ������ݷ�������','Warning','warn');
                % end
        otherwise
            msgbox('�˲���ɣ������ݷ�������','Warning','warn');
            cla(handles.axes1);
            return;
    end
end
 save Result_EKF Result_EKF  %ǰ����Ǳ��浽��ǰĿ¼�µ��ļ��� �������Ҫ����ı���  

% --- Executes on button press in ClearF.
function ClearF_Callback(hObject, eventdata, handles)
% hObject    handle to ClearF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Wei_2;
Wei=Wei_2;
    cla(handles.axes1);
    legend(handles.axes1,'off')
    cla(handles.axes2);
    legend(handles.axes2,'off')
    cla(handles.axes3);
    legend(handles.axes3,'off')
    cla(handles.axes_3wei);
    legend(handles.axes_3wei,'off')
%axes(handles.axes1);
 
 set(handles.axes2,'Visible','off');  
 set(handles.axes3,'Visible','off');  
 if Wei==3
     set(handles.axes_3wei,'Visible','on');  %������Ҫһ���ж���ǰ����ϵ ��3ά���� 2ά
     set(handles.axes1,'Visible','off');
 else
     set(handles.axes_3wei,'Visible','off');  %������Ҫһ���ж���ǰ����ϵ ��3ά���� 2ά
     set(handles.axes1,'Visible','on');
 end
  set(handles.DataAnalysis,'Visible','off'); 

% --- Executes on button press in Export.
function Export_Callback(hObject, eventdata, handles)
% hObject    handle to Export (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Popout.
function Popout_Callback(hObject, eventdata, handles)
% hObject    handle to Popout (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Popout
ShowResult_Callback(hObject, eventdata, handles);

% --- Executes on selection change in ShowResult.
function ShowResult_Callback(hObject, eventdata, handles)
% hObject    handle to ShowResult (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns ShowResult contents as cell array
%        contents{get(hObject,'Value')} returns selected item from ShowResult
global Xtrue_Data_2;
global Obs_Data_2;
global Result_EKF;
Xtrue_Data=Xtrue_Data_2;
Obs_Data=Obs_Data_2;
Result=Result_EKF;
if isempty(Obs_Data)
         msgbox('û�й۲�����','ȷ�ϳ�ʼ��','warn') 
      return;
end
re_X=Result.X;
re_P=Result.P;
re_K=Result.K;
Gain=Result.Gain;  
Error=Result.Error;
Flag=Result.Flag;

ShowWhich=get(handles.ShowResult,'value');
%disp(ShowWhich)

%�ж��Ƿ񵯳���ʾ
if get(handles.Popout,'value')==1
    figure;
else

axes(handles.axes1);             %--------�˴��������ǻ���ͬһ������ϵ �������ⵥ��������ϵ,�ڴ����õĻ�Ĭ�ϻ���ͬһ������ϵ������������
            
set(handles.axes1,'Visible','on');       %�������������ϵ��ص�axes1,�������´�û�������䣬axes1Ӧ�ÿ������İ��������ͣ�axes(handles.axes1); ������䲻��������ϵaxes1��Ϊ��ǰ����ϵ���ҿɼ�
cla(handles.axes2);
set(handles.axes2,'Visible','off');   
cla(handles.axes3);
set(handles.axes3,'Visible','off');
cla(handles.axes_3wei);
legend( handles.axes_3wei,'off');
set(handles.axes_3wei,'Visible','off');
%---------------------------------
end

hold off;
for r=1:1
switch ShowWhich
    case 1    
        switch Flag
            case 21
                plot(re_X(1,:),'r');
            case 22
                plot(re_X(1,:),re_X(2,:),'r');
            case 31
                plot(re_X(1,:),'r'); 
            case 42
                 plot(re_X(1,:),re_X(3,:),'r',re_X(1,1),re_X(3,1),'sr');    
            case 62
                   % hold on; ���ڴ˴����У����续��λ�����ٻ��켣ͼ��ʱ�� �����������ͷ��hold  off�����ˣ���˿����Ȼ�һ��ͼ
                 plot(Xtrue_Data(1,:),Xtrue_Data(4,:));
                 hold on; 
                 
                 RLook=Obs_Data;
                 zx=RLook(1,:).*cos(RLook(2,:));
                 zy=RLook(1,:).*sin(RLook(2,:));
                 RLook_Zhi=[zx;zy];
                plot(RLook_Zhi(1,:),RLook_Zhi(2,:),'k');
               % plot(Obs_Data(1,:),Obs_Data(2,:),'k');
                
                plot( re_X(1,:),re_X(4,:),'r',re_X(1,1),re_X(4,1),'sr'); 
                legend('��ʵֵ','�۲�ֵ','�˲�ֵ','�˲���ʼ��','Location','Best' );  
                hold off;
            case 63
                if get(handles.Popout,'value')==1
                    plot3(Xtrue_Data(1,:),Xtrue_Data(3,:),Xtrue_Data(3,:));
                    hold on;
                    %����ֱ�ӻ��۲�����
             %plot3(Obs_Data(1,:),Obs_Data(2,:),Obs_Data(3,:),'k');
                    plot3(re_X(1,:),re_X(3,:),re_X(5,:),'r',re_X(1,1),re_X(3,1),re_X(5,1),'sr');
                    legend('��ʵֵ','�۲�ֵ','�˲�ֵ','�˲���ʼ��','Location','Best' );
                else
                    cla(handles.axes1);
                    legend off;
                    set(handles.axes1,'Visible','off');
                    set(handles.axes_3wei,'Visible','on');
                    axes(handles.axes_3wei);
                    
                    plot3(Xtrue_Data(1,:),Xtrue_Data(3,:),Xtrue_Data(5,:));
                    hold on;
                    %����ֱ���������۲����� �۲����ݵ�ͼ����ʾ ��ʵ���鷳 ��Ϊ�������漰��������Ϣ��Ե���� ͨ����������
                    %Ҫ�ù۲����ݽ��������ٻ�
              % plot3(Obs_Data(1,:),Obs_Data(2,:),Obs_Data(3,:),'k');
                    plot3(re_X(1,:),re_X(3,:),re_X(5,:),'r',re_X(1,1),re_X(3,1),re_X(5,1),'sr');
                    legend('��ʵֵ','�۲�ֵ','�˲�ֵ','�˲���ʼ��','Location','Best' );
                    hold off;
                end
            case 93
                if get(handles.Popout,'value')==1
                    plot3(Xtrue_Data(1,:),Xtrue_Data(4,:),Xtrue_Data(7,:));
                    hold on;
                    
                    RLook=Obs_Data;
                    Zx=RLook(1,:).*cos(RLook(2,:)).*cos(RLook(3,:));          %���ε����ǣ����롢��λ�ǡ������� ��ͬ��������ϵ
                    Zy=RLook(1,:).*sin(RLook(2,:)).*cos(RLook(3,:));
                    Zz=RLook(1,:).*sin(RLook(3,:));
                    RLook_Zhi=[Zx;Zy;Zz];
                    plot3(RLook_Zhi(1,:),RLook_Zhi(2,:),RLook_Zhi(3,:),'k');
                    plot3(re_X(1,:),re_X(4,:),re_X(7,:),'r',re_X(1,1),re_X(4,1),re_X(7,1),'sr');
                    legend('��ʵֵ','�۲�ֵ','�˲�ֵ','�˲���ʼ��','Location','Best' );
                else
                    cla(handles.axes1);
                    legend off;
                    set(handles.axes1,'Visible','off');
                    set(handles.axes_3wei,'Visible','on');
                    axes(handles.axes_3wei);
                    
                    plot3(Xtrue_Data(1,:),Xtrue_Data(4,:),Xtrue_Data(7,:));
                    hold on;
                    RLook=Obs_Data;
                    Zx=RLook(1,:).*cos(RLook(2,:)).*cos(RLook(3,:));          %���ε����ǣ����롢��λ�ǡ������� ��ͬ��������ϵ
                    Zy=RLook(1,:).*sin(RLook(2,:)).*cos(RLook(3,:));
                    Zz=RLook(1,:).*sin(RLook(3,:));
                    RLook_Zhi=[Zx;Zy;Zz];
                    plot3(RLook_Zhi(1,:),RLook_Zhi(2,:),RLook_Zhi(3,:),'k');
                    
                    plot3(re_X(1,:),re_X(4,:),re_X(7,:),'r',re_X(1,1),re_X(4,1),re_X(7,1),'sr');
                    legend('��ʵֵ','�۲�ֵ','�˲�ֵ','�˲���ʼ��','Location','Best' );
                    hold off;
                end
                
            otherwise
                 msgbox('�˲���ɣ�����ͼ����','Warning','warn'); 
                 cla(handles.axes1);         
                 return;
        end
    case 2
         switch Flag
            case 21
                 msgbox('�˲���ɣ���ʱδ��д���ݴ���չʾ��ͼ����','Warning','warn');return;
            case 22
                msgbox('�˲���ɣ���ʱδ��д���ݴ���չʾ��ͼ����','Warning','warn');return;
            case 31
                msgbox('�˲���ɣ���ʱδ��д���ݴ���չʾ��ͼ����','Warning','warn');return;
            case 42
                msgbox('�˲���ɣ���ʱδ��д���ݴ���չʾ��ͼ����','Warning','warn');return;
            case 62
                %hold off;
                 plot(Error.X,'r');  %�����X��ʾ����x���򣬶��Ǻ�λ�ƣ�����V A��Ӧ����x,y,z�ֱ�����������
                %hold on;
                 title('�ܵ�λ�ƹ������');
            case 63
                msgbox('�˲���ɣ���ʱδ��д���ݴ���չʾ��ͼ����','Warning','warn');return;
            case 93
                 plot(Error.X,'r');
                title('�ܵ�λ�ƹ������');  
            otherwise
                 msgbox('�˲���ɣ�����ͼ����','Warning','warn'); 
                 cla(handles.axes1);                                               %%�Ľ� �Ƿ�Ҫ���
                 return;
        end
    case 3        %��ʱֻ��62�������̣���������µĳ����д�����   case 93��Ҫ���ȱ�д
        switch Flag
            case 62 
                 plot(Error.V,'r'); 
                 title('�ܵ��ٶȹ������');
            case 93
                plot(Error.V,'r');
                title('�ܵ��ٶȹ������');
            otherwise
                msgbox('�˲���ɣ���ʱδ��д���ݴ���չʾ��ͼ����','Warning','warn');
                   return;
        end
    case 4
         switch Flag
             case 62
                  plot(Error.A,'r'); 
                  title('�ܵļ��ٶȹ������');
             case 93
                    plot(Error.A,'r');
                    title('�ܵļ��ٶȹ������');
             otherwise  
                    msgbox('�˲���ɣ���ʱδ��д���ݴ���չʾ��ͼ����','Warning','warn');
                   return;
        end
    case 5
        switch Flag
             case 62
                
%                    %subplot(2,1,1);                 %subplot�ǰ�ͼ�ֱ��ڲ�ͬ�����굱�м���ͬ��axes�� �����������ʱ���������б�д��ʽ
%                                                     %��ֱ��д��һ��ͼ�ͨ��legend����
%                                                     %���������1��������ϵ��2����ʹ��subplot;3��Ѱ������ϵ�����������������4������
%                   plot(Error.x,'r');                %�ڴ� Ϊ�˳��Զ�����ϵ�ı��������case����һ�£������Դ����Ҳ���� 
%                   hold on;           
%                   % subplot(2,1,2); 
%                   plot(Error.y,'g'); 
%                   title('λ�ƹ������');
%                   legend('x����','y����');
%                   hold off;           %֮���Լ��������������������hold on;hold off;ֻ����С�����������ı仯������Ӱ����һ��switch�������䣬����һ��������
%                   
%----------------------���Զ�����ϵ��ͼ--------
                    if get(handles.Popout,'value')==1
                        subplot(2,1,1);
                        plot(Error.x,'r');
                        title('x����λ�ƹ������');
                        subplot(2,1,2);
                        plot(Error.y,'g');
                        title('y����λ�ƹ������');
                    else
                        cla(handles.axes1);
                        legend off;
                        set(handles.axes1,'Visible','off');
                        set(handles.axes2,'Visible','on');     %ÿ��������switch ֮ǰ��Ҫ�ر�axes2 Ȼ��������ٴ�
                        set(handles.axes3,'Visible','on');
                        axes(handles.axes2);
                        plot(Error.x,'r');
                        title('x����λ�ƹ������');
                        axes(handles.axes3);
                        plot(Error.y,'g');
                        title('y����λ�ƹ������');
                    end
                case 93                                 
                  plot(Error.x,'r');               
                  hold on;           
                  plot(Error.y,'g'); 
                  plot(Error.z,'b'); 
                  title('λ�ƹ������');
                  legend('x����','y����','z����');
                  hold off;    
                  
             otherwise  
                    msgbox('�˲���ɣ���ʱδ��д���ݴ���չʾ��ͼ����','Warning','warn');
                   return;
        end
    case 6
        switch Flag
             case 62
                  
                  plot(Error.xv,'r'); 
                  hold on;
                  plot(Error.yv,'g'); 
                  title('�ٶȹ������');
                  legend('x����','y����');
                  hold off;
              case 93                  
                  plot(Error.xv,'r'); 
                  hold on;
                  plot(Error.yv,'g'); 
                  plot(Error.zv,'b');
                  title('�ٶȹ������');
                  legend('x����','y����','z����');
                  hold off;
             otherwise  
                    msgbox('�˲���ɣ���ʱδ��д���ݴ���չʾ��ͼ����','Warning','warn');
                   return;
        end
    case 7
        switch Flag
             case 62
                  
                  plot(Error.xa,'r');    
                  hold on;
                  plot(Error.ya,'g'); 
                  title('���ٶȹ������');
                  legend('x����','y����');
                  hold off;
             case 93
                 plot(Error.xa,'r');    
                  hold on;
                  plot(Error.ya,'g'); 
                   plot(Error.za,'b');
                  title('���ٶȹ������');
                  legend('x����','y����','z����');
                  hold off;
             otherwise  
                    msgbox('�˲���ɣ���ʱδ��д���ݴ���չʾ��ͼ����','Warning','warn');
                   return;
        end
    case 8
        switch Flag
               case 62           
                  plot(Gain.Kx,'r');                  
                  title('x����λ��Kֵ�仯');   
                  legend('λ��'); 
               case 93           
                  plot(Gain.Kx,'r');                  
                  title('x����λ��Kֵ�仯');   
                  legend('λ��'); 
             otherwise  
                    msgbox('�˲���ɣ���ʱδ��д���ݴ���չʾ��ͼ����','Warning','warn');
                   return;
        end
    case 9
        switch Flag
             case 62                   
                  plot(Gain.Kx,'r'); 
                  hold on;                   
                  plot(Gain.Kxv,'g');
                  plot(Gain.Kxa,'b'); 
                  title('x����Kֵ�仯');   
                  legend('λ��','�ٶ�','���ٶ�');
                  hold off;
            case 93
                  plot(Gain.Kx,'r'); 
                  hold on;                  
                  plot(Gain.Kxv,'g');                   
                  plot(Gain.Kxa,'b'); 
                  title('x����Kֵ�仯');   
                  legend('λ��','�ٶ�','���ٶ�');
                  hold off;                  
             otherwise  
                    msgbox('�˲���ɣ���ʱδ��д���ݴ���չʾ��ͼ����','Warning','warn');
                   return;
        end
    case 10
         switch Flag
             case 62
                
                  plot(Gain.Ky,'r'); 
                  hold on;
                  plot(Gain.Kyv,'g');                    
                  plot(Gain.Kya,'b'); 
                  title('y����Kֵ�仯');  
                  legend('λ��','�ٶ�','���ٶ�');
                  hold off;
             case 93
                  plot(Gain.Ky,'r'); 
                  hold on;
                  plot(Gain.Kyv,'g');                    
                  plot(Gain.Kya,'b'); 
                  title('y����Kֵ�仯');  
                  legend('λ��','�ٶ�','���ٶ�');
                  hold off;                      
             otherwise  
                    msgbox('�˲���ɣ���ʱδ��д���ݴ���չʾ��ͼ����','Warning','warn');
                   return;
        end
    case 11
         switch Flag
             case 62
                  msgbox('ͼ�񲻴���Z��������','Warning','warn');   
             case 93
              
                  plot(Gain.Kz,'r'); 
                  hold on;                 
                  plot(Gain.Kzv,'g');              
                  plot(Gain.Kza,'b'); 
                  title('z����Kֵ�仯'); 
                  legend('λ��','�ٶ�','���ٶ�');
                   hold off;
             otherwise  
                    msgbox('�˲���ɣ���ʱδ��д���ݴ���չʾ��ͼ����','Warning','warn');
                   return;
         end
    otherwise  
         msgbox('�˲���ɣ������ݷ���չʾ��ͼ����','Warning','warn'); 
         cla(handles.axes1);         
         return;
end
        
end        
hold on;%��ͬһ������ϵ��ͼ��ʱ����뿼�ǵ�����

% --- Executes during object creation, after setting all properties.
function ShowResult_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ShowResult (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Reset.
function Reset_Callback(hObject, eventdata, handles)
% hObject    handle to Reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global T1_2;
global Wei_2;
global X0_2;
global P0_2;
global Allneed2;   
% X0_2=[6100,-410,0,8100,2,0]';
% P0_2=diag([100^2 10^2 0 100^2 10^2 0]);         
% T1_2=2;
% Wei_2=2;                                                                   %������KamGUI_1_1�Ĳ�ͬ���Ľ�����ʼ����ֵ��ͬ
% Allneed2.Flag_init=62;
% Allneed2.Wei_Z=2;

X0_2=[0 200 -25 0 0 25 0 0 60]';
P0_2=diag([100 10 1 100 10 1 100 10 1]);                                  %��Ҫ��������ʾ�Ķ���
T1_2=0.01;
Wei_2=3;
Allneed2.Flag_init=93;
Allneed2.Wei_Z=3;

%�˲����ĳ�ʼ�� �Ƿ��ڴ˽��У���Ҫ������֤���������ڲ���ʼ���Ļ�����Ҳ��ʶ���ˡ�
global A_2;
global G_2;
global Q_2;
global H_2;
global R_2;
CA_I=[1 T1_2 0.5*T1_2^2;0 1 T1_2; 0 0 1];       
A_2=[CA_I,zeros(3,6);zeros(3),CA_I,zeros(3);zeros(3,6),CA_I];
G_2=[0.5*T1_2^2,0,0;T1_2,0,0;1,0,0;  0,0.5*T1_2^2,0;0,T1_2,0;0,1,0;0 0 0.5*T1_2^2;0,0,T1_2;0 0 1];
Q_I=0.1;
Q_2=diag([Q_I,Q_I,Q_I]);

syms x y z;                                                                      %�����Ƕ�ά�״� ������Ҫ��д��ά�״������
% f1=sqrt(x^2+y^2);f2=atan(y/x);
% h11=x/(x^2 + y^2)^(1/2);h12=y/(x^2 + y^2)^(1/2);h21=-y/(x^2 + y^2);h22=x/(x^2 + y^2);
% Allneed2.Fx={f1;f2};
% H={h11,h12;h21 h22};                                      %H��������ֵ Ӧ�ø���Allneed.Flag_init�� Allneed.Wei_Z��ȷ����
%H_2=[H{1,1},0,0,H{1,2},0,0;H{2,1},0,0,H{2,2},0,0];
% R_2=diag([10000,0.0001]);

f1=sqrt(x^2+y^2+z^2);f2=atan(y/x);f3=atan(z/sqrt(x^2+y^2));
    R1=sqrt(x^2+y^2+z^2);  r1=sqrt(x^2+y^2);
h11=x/R1;h12=y/R1; h13=z/R1;
h21=-y/(x^2+y^2); h22=-x/(x^2+y^2);  h23=0;
h31=-x*z/(R1^2*r1); h32=-y*z/(R1^2*r1); h33=r1/R1^2;
H={h11,h12,h13;h21 h22 h23; h31 h32 h33};%H��������ֵ Ӧ�ø���Allneed.Flag_init�� Allneed.Wei_Z��ȷ����
H_2=[H{1,1},0,0,H{1,2},0,0,H{1,3},0,0;
     H{2,1},0,0,H{2,2},0,0,H{2,3},0,0;
    H{3,1},0,0,H{3,2},0,0,H{3,3},0,0;];
Allneed2.Fx={f1;f2;f3};
R_2=diag([10000,0.0001,0.0001]);
%========
ClearF_Callback(hObject, eventdata, handles)



% --- Executes on button press in PromptObserve.
function PromptObserve_Callback(hObject, eventdata, handles)
% hObject    handle to PromptObserve (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox({'Symbols are limited to be used as "x y z"';'  '},'Prompt')


function pushbutton23_Callback(hObject, eventdata, handles)


function Observed_KeyPressFcn(hObject, eventdata, handles)


function Observed_ButtonDownFcn(hObject, eventdata, handles)
