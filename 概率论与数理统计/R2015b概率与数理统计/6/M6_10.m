 clear all;
x = (1:10)';
y = 10 - 2*x + randn(10,1);
y(10) = 0;
bls = regress(y,[ones(10,1) x])     %һԪ���Իع����
[b,stats] = robustfit(x,y)            %�ȼ��ع����
scatter(x,y,'filled');          %ɢ��ͼ
grid on; hold on
plot(x,bls(1)+bls(2)*x,'r','LineWidth',2);
plot(x,b(1)+b(2)*x,'g','LineWidth',2)
legend('����','���Իع�','�Ƚ��ع�')
