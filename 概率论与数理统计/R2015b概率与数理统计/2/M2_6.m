clear all;
x=0:0.1:30;        %����x��ȡֵ
y1=chi2pdf(x,3);   %�������Ӧ��x�����ɶ�1�ĸ����ܶȺ�����ֵ
plot(x,y1,'r:');
hold on;
y2=chi2pdf(x,5); 
plot(x,y2,'kp');
y3=chi2pdf(x,15);
plot(x,y3,'b-.');
gtext('���ɶ�Ϊ3');
gtext('���ɶ�Ϊ5');
gtext('���ɶ�Ϊ15');
axis([0 30 0 0.25])     %ָ����ʾ��ͼ������
[m,v]=chi2stat(15)
