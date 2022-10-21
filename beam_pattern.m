%% �������ԣ�ula��Ƶ����FDA����������ͼ
clc;clear ;close;


%% ------��������FDA�״��������
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
t=Ru/c; %����άʱ�������
T=linspace(0,2*t,500);
Delta_f=(0:M-1)*delta_f;
D=d*(0:M-1);

% -----FDA��������ͼ
P1 = zeros(length(theta),length(R)); %��������ͼ

 for n = 1 : length(theta)
    for m = 1 : length(R)
         a1=exp(-j*2*pi/c*(delta_f*R(m)-f0*d*sin(theta(n)))*(0:M-1)'); %����ʸ��
         w=exp(-j*2*pi/c*(delta_f*R0-f0*d*sin(theta0))*(0:M-1)');
        P1(n,m) =w'*a1;
    end
 end
 
P1=P1';
figure(1); 
imagesc(theta*180/pi,R,abs(P1)/max(max(abs(P1)))); 
xlabel('\theta^o'); ylabel('R/m'); 
axis tight; axis xy;
title('');
colorbar;


%% -----FDAʱ��Ƕ�ά��������ͼ

% T=linspace(0,2e-3,1000);
P2 = zeros(length(theta),length(T)); %��������ͼ
 for n = 1 : length(theta)
    for m = 1 : length(T)
         a2=exp(-j*2*pi/c*(-Delta_f'*T(m)*c-D'*f0*sin(theta(n)))); %����ʸ��
         w2=exp(-j*2*pi/c*(-Delta_f'*T(1)*c-D'*f0*sin(theta0))); 
        P2(n,m) =w2'*a2;
    end
 end
%% ��ͼ��ʱ��Ƕ�ά
P2=P2';
figure(2); 
imagesc(T,theta*180/pi,abs(P2)/max(max(abs(P2)))); 
ylabel('\theta^o'); xlabel('ʱ��/s'); 
axis tight; axis xy;
title('');
colorbar;


% --------------FDAʱ�����ά��������ͼ     
P3 = zeros(length(R),length(T)); %��������ͼ
 for n = 1 : length(R)
    for m = 1 : length(T)
         a3=exp(-j*2*pi/c*(-Delta_f'*T(m)*c+Delta_f'*R(n))); %����ʸ��
         w3=exp(-j*2*pi/c*(-Delta_f'*T(100)*c+Delta_f'*R0)); 
        P3(n,m) =w3'*a3;
    end
 end
%% ��ͼ��ʱ�����ά��������ͼ
 P3=P3';
figure(3); 
imagesc(T,R,abs(P3)/max(max(abs(P3)))); 
ylabel('R/m'); xlabel('ʱ��/s'); 
axis tight; axis xy;
title('');
colorbar;


% %% ---�����������ͼ
% % w=exp(j*2*pi*d/lamda*(0:M-1)'*sin(theta0));
% P0 = zeros(1,length(theta));
% for n = 1 : length(theta)
%     a = exp(j*2*pi*d/lamda*(0:M-1)'*sin(theta(n)));
%     w=exp(j*2*pi*d/lamda*(0:M-1)'*sin(theta0));
%     P0(n) =w'*a;
% end
% figure(2); 
% imagesc(theta*180/pi,R,abs(P0)/max(max(abs(P0)))); 
% xlabel('\theta^o'); ylabel('R/m'); 
% axis tight; axis xy;
% axis([-90 90 0 2*Ru]);
% title('');
% colorbar;




















