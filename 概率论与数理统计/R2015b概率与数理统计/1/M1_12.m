 clear all;    %�������ռ�
%��������x��y
x=[143 145 146 148 149 150 153 154 157 158 159 160 162 164]';
y=[11 13 14 15 16 18 20 21 22 25 26 28 29 31]';
x=[ones(length(x),1),x];
%���Իع�
 [b,bint,r,rint,stats]=regress(y,x);
 %r2Խ�ӽ�1��FԽ��pԽС��<0.05�����ع�Ч��Խ����
 r2=stats(1)
 F=stats(2)
 p=stats(3)
 %����ԭʼ���ݺ���ϵ�ֱ��
 z=b(1)+b(2)*x;
 subplot(2,1,1);
 plot(x,y,'o',x,z,'-');
 %���Ʋв�ͼ
 subplot(2,1,2);
 rcoplot(r,rint);
