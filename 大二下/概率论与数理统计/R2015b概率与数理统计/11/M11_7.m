clear all;
rng('default') % ����������
X = rand(10,3);   %�������
%����һ��ϵͳ������
tree = linkage(X,'average');
figure()
%���ƾ�����
dendrogram(tree)
