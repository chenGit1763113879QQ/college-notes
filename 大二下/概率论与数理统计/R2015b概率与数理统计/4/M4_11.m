clear all;
%����ͳ�����Ĺ۲�ֵ
T=1;
%������ˮƽ
alpha=0.05;
%Ϊȷ���ܾ����ٽ�ֵ���� �ĸ���
p=1-binocdf(0:15,15,0.01);
%��ܾ����ٽ�ֵ
for byk=1:16
if p(byk)>alpha&p(byk+1)<=alpha
c=byk;
end
end
%������ߣ�h=1(0)�ܾ������ܣ�ԭ����
if T>=c
h=1
else
h=0
end
