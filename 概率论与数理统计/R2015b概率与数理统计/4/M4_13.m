clear all;
%���������ֵ
theta0=3000;
%������ˮƽ
alpha=0.1;
%��������
n=20;
%����������������Ʒƽ��ʧЧʱ��
EoLife=237;
%����ͳ�����Ĺ۲�ֵ
x2stat=2*n*(10*EoLife) /theta0
%��ܾ����ٽ�ֵ
c=chi2inv(alpha,2*n)
%������ߣ�h=1(0)�ܾ������ܣ�ԭ����
if x2stat<=c
h=1
else
h=0
end
