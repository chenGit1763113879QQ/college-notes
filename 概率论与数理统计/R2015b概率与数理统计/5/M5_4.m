%MATLAB���ݴ���2��
clear all;
alpha=0.05;
m1=7;m2=8;m3=9;  %���������������
n=m1+m2+m3;
r=3;
t=tinv(1-alpha/2,n-r);
SSE=2.3404e+003;  %����MATLAB���ݴ���(1)�н��
LSD12=t*sqrt(SSE/(n-r))*sqrt(1/m1+1/m2);
LSD13=t*sqrt(SSE/(n-r))*sqrt(1/m1+1/m3);
LSD23=t*sqrt(SSE/(n-r))*sqrt(1/m2+1/m3);
MU1=70.8571;  %����MATLAB���ݴ���(2)�н��,��ͬ
MU2=86;
MU3=55.1111;
if abs(MU1-MU2)>LSD12
    h(1)=1;
else
    h(1)=0;
end
if abs(MU1-MU3)>=LSD13
    h(2)=1;
else
    h(2)=0;
end
if abs(MU2-MU3)>=LSD23
    h(3)=1;
else
    h(3)=0;
end
h  %���,������ʾ��1��2,1��3,2��3�ַ�����ѧ��ƽ���ɼ������������
