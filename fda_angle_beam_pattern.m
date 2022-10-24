%% FDA�״�Ƕ�ά��������ͼ�о�

clc;clear ;close;


%% ------��������FDA�״��������(ʱ��t=0)
j=sqrt(-1);
M=12; %������Ԫ��Ŀ
f0=2e9; %�ز�����Ƶ��
delta_f=3000; %������ԪƵ��ƫ��
c=3e8;        %����
lamda=c/f0;  %����
d=lamda/2;    %��Ԫ���
Ru=c/delta_f;  %�����ģ������
theta=(-90:0.1:90)*pi/180; %�����Ƕ�����
R=linspace(0,2*Ru,1000); %������������
f=f0+(0:M-1)*delta_f; %��Ԫ��Ƶ�����������������ӣ�
R0 = 1e5;
theta0 = 30/180*pi;  %%����ָ��Ŀ��ĽǶȺ;���

%% -----FDA�Ƕ�ά��������ͼ (d1=0.2*lamda)
d1=0.2*lamda; %������Ԫ���
P1 = zeros(length(theta)); %��������ͼ
    for m = 1 : length(theta)
         a1=exp(-j*2*pi/c*(delta_f*R0-f0*d1*sin(theta(m)))*(0:M-1)'); %����ʸ��
         w=exp(-j*2*pi/c*(delta_f*R0-f0*d1*sin(0))*(0:M-1)'); %��Ȩʸ��
        P1(m) =w'*a1;
    end
    
%% -----FDA�Ƕ�ά��������ͼ (d2=0.5*lamda)
d2=0.5*lamda;%
P2 = zeros(length(theta)); %��������ͼ
    for m = 1 : length(theta)
         a2=exp(-j*2*pi/c*(delta_f*R0-f0*d2*sin(theta(m)))*(0:M-1)'); %����ʸ��
         w=exp(-j*2*pi/c*(delta_f*R0-f0*d2*sin(0))*(0:M-1)'); %��Ȩʸ��
        P2(m) =w'*a2;
    end
    
%% -----FDA�Ƕ�ά��������ͼ (d3=0.8*lamda)
d3=0.9*lamda;%
P3 = zeros(length(theta)); %��������ͼ
    for m = 1 : length(theta)
         a3=exp(-j*2*pi/c*(delta_f*R0-f0*d3*sin(theta(m)))*(0:M-1)'); %����ʸ��
         w=exp(-j*2*pi/c*(delta_f*R0-f0*d3*sin(0))*(0:M-1)'); %��Ȩʸ��
        P3(m) =w'*a3;
    end   
%% -----FDA�Ƕ�ά��������ͼ (d4=0.8*lamda)
d4=lamda;%
P4= zeros(length(theta)); %��������ͼ
    for m = 1 : length(theta)
         a4=exp(-j*2*pi/c*(delta_f*R0-f0*d4*sin(theta(m)))*(0:M-1)'); %����ʸ��
         w=exp(-j*2*pi/c*(delta_f*R0-f0*d4*sin(0))*(0:M-1)'); %��Ȩʸ��
        P4(m) =w'*a4;
    end   
%% ��ͼ   
 figure(1);
plot((-90:0.1:90),abs(P1)/max(abs(P1)),'.-',...
(-90:0.1:90),abs(P2)/max(abs(P2)),'x-',...
(-90:0.1:90),abs(P3)/max(abs(P3)),'s-',...
(-90:0.1:90),abs(P4)/max(abs(P4)),'d-','LineWidth', 1);
xlabel('�Ƕ�/^o'); ylabel('��һ������'); 
axis([-90,90,0,1]);
legend('d_1=0.2\lambda','d_2=0.5\lambda','d_3=0.8\lambda','d_4=\lambda');

