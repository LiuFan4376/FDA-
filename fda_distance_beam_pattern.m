%% FDA����ά��������ͼ�о�


%%
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
theta=(-90:1:90)*pi/180; %�����Ƕ�����
R=linspace(0,3e5,1000); %������������
f=f0+(0:M-1)*delta_f; %��Ԫ��Ƶ�����������������ӣ�
R0 = 1e5;
theta0 = 30/180*pi;  %%����ָ��Ŀ��ĽǶȺ;���

%% ��ͬ��СƵƫ��FDA����ά��������ͼ�Ա�

%% -----FDA����ά��������ͼ delta_f1=2000HZ
delta_f1=2000;
% Ru=c/delta_f1;
P1 = zeros(length(R)); %��������ͼ
    for m = 1 : length(R)
         a1=exp(-j*2*pi/c*(delta_f1*R(m)-f0*d*sin(theta0))*(0:M-1)'); %����ʸ��
         w=exp(-j*2*pi/c*(delta_f1*R0-f0*d*sin(theta0))*(0:M-1)');
        P1(m) =w'*a1;
    end
    
%% -----FDA����ά��������ͼ \deltaf_2=3000HZ
delta_f2=3000;
% Ru=c/delta_f2;
P2 = zeros(length(R)); %��������ͼ
    for m = 1 : length(R)
         a2=exp(-j*2*pi/c*(delta_f2*R(m)-f0*d*sin(theta0))*(0:M-1)'); %����ʸ��
         w=exp(-j*2*pi/c*(delta_f2*R0-f0*d*sin(theta0))*(0:M-1)');
        P2(m) =w'*a2;
    end
 %% -----FDA����ά��������ͼ delta_f3=5000HZ
delta_f3=5000;
% Ru=c/delta_f2;
P3 = zeros(length(R)); %��������ͼ
    for m = 1 : length(R)
         a3=exp(-j*2*pi/c*(delta_f3*R(m)-f0*d*sin(theta0))*(0:M-1)'); %����ʸ��
         w=exp(-j*2*pi/c*(delta_f3*R0-f0*d*sin(theta0))*(0:M-1)');
        P3(m) =w'*a3;
    end   
    
 %% ��ͼ   
 figure(1);
 plot(R,abs(P1)/max(abs(P1)),'x-',R,abs(P2)/max(abs(P2)),'s-',R,abs(P3)/max(abs(P3)),'d-','LineWidth',1);
xlabel('����/m'); ylabel('��һ������'); 
title('');
axis([0.5e5,1.5e5,0,1]);
 legend('\Deltaf_1=2000Hz','\Deltaf_2=3000Hz','\Deltaf_3=5000Hz');
 
 figure(2)
 plot(R,abs(P1)/max(abs(P1)),'x-',R,abs(P2)/max(abs(P2)),'s-',R,abs(P3)/max(abs(P3)),'d-','LineWidth',1);
xlabel('����/m'); ylabel('��һ������'); 
title('');
axis([1e5,3e5,0,1]);
 legend('\Deltaf_1=2000Hz','\Deltaf_2=3000Hz','\Deltaf_3=5000Hz');
 
 
 
 
 
 
 
 
 
 
 
 
 
 