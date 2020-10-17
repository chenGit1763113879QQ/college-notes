% ��д������ͼ���ƺ���Ϊqsplot.m����Դ�������£�
function qsplot(K)
[m,n]=size(K);
nk=ceil(sqrt(n));
mk=ceil(n/nk);
figure;
for kk=1:n
    subplot(mk,nk,kk)
    plot(K(:,kk),'.r-');
    SS=['����',num2str(kk)];
    title(SS);
end
