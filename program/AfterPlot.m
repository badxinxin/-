%��simulink�����ȡ����
x_data = x.Data;
y_data = y.Data;
v_data = v.Data;
theta_data = tehta.Data*180/pi;
alpha_data = alpha.Data*180/pi;
deltaz_data = delta_z.Data*180/pi;
time = x.Time;

%��ͼ
figure(1)
plot(x_data,y_data,'LineWidth',1.5,'Color','blue')
xlabel('X [m]');ylabel('Y [m]');
title('��������')

figure(2)
plot(time,v_data,'LineWidth',1.5,'Color','red')
xlabel('t [s]');ylabel('v [m/s]');
title('�ٶ���ʱ��仯����')

figure(3)
plot(time,theta_data,'LineWidth',1.5,'Color','red')
xlabel('t [s]');ylabel('������� [��]');
title('���������ʱ��仯����')

figure(4)
plot(time,alpha_data,'LineWidth',1.5,'Color','red')
xlabel('t [s]');ylabel('���� [��]');
title('������ʱ��仯����')

figure(5)
plot(time,deltaz_data,'LineWidth',1.5,'Color','red')
xlabel('t [s]');ylabel('��ƫ�� [��]');
title('��ƫ����ʱ��仯����')