clear al;
load gas
fsurfht('gauslike',[112 118],[3 5],price1)    %����Ȼ����ͼ��
mumax = mean(price1)               %��price1�ľ�ֵ
sigmamax = std(price1)*sqrt(19/20) %��price1�ı�׼��
