 clear all;
x=[1,2,6,11]';
y=pdist(x,'cityblock');         %������Ʒ�����ֵ����
%����Ԫ������method����Ԫ���ֱ��Ӧ��ͬϵͳ���෨
method={'average','centroid','complete','median','single','ward','weighted'};
%ͨ��ѭ������7��ϵͳ���෨��Ӧ��Cophenetic���ϵ��
for i=1:7
    Z=linkage(y,method{i});            %���õ�i��ϵͳ���෨����������
    c(i)=cophenet(Z,y);    %�����i��ϵͳ��������Ӧ��Cophenetic���ϵ��
end
disp('Cophenetic���ϵ��')
c
Z=linkage(y,'average');                 %������ƽ��������������
[c1,d]=cophenet(Z,y)          %����Cophenetic���ϵ��c��Cophenetic��������d
RH0=corr(y',d')                         %����y��d���������ϵ��
