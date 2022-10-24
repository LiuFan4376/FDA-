%% FDA����ʱ�������о�
clc;clear ;close;


%% ------��������FDA�״��������
j=sqrt(-1);
M=12; %������Ԫ��Ŀ
f0=2e9; %�ز�����Ƶ��
delta_f=2000; %������ԪƵ��ƫ��
c=3e8;        %����
lamda=c/f0;  %����
d=lamda/2;    %��Ԫ���
Ru=c/delta_f;  %�����ģ������
theta=(0:1:90)*pi/180; %�����Ƕ�����
R=linspace(0,2*Ru,1000); %������������
f=f0+(0:M-1)*delta_f; %��Ԫ��Ƶ�����������������ӣ�
R0 = 1e5;
theta0 = 0;  %����ָ��Ŀ��ĽǶȺ;���
T=Ru/c; %����άʱ�������
t=linspace(0,2*T,10/(2*T));

%% -----FDA��ͬʱ���·�ֵ�㴦�������С�仯ͼ
 P1 = zeros(length(t));
 for n = 1 : length(t)
     a2=exp(-j*2*pi/c*(delta_f*(R0-t(n)*c)-f0*d*sin(theta0))*(0:M-1)'); %����ʸ��
     w=exp(-j*2*pi/c*(delta_f*R0-f0*d*sin(theta0))*(0:M-1)');
     P1(n) =w'*a2;
 end

figure(1);
plot(t*1000,abs(P1)/max(abs(P1)),'LineWidth',1);
xlabel('ʱ��/ms'); ylabel('�����С'); 
title('');




