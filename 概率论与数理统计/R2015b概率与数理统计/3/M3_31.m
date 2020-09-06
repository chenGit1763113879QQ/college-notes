 clear all;
y = exprnd(10,50,1); % ������ϴ���
d = exprnd(20,50,1); % �����ʧ����
t = min(y,d);        % ��ʹ���
censored = (y>d);    % �۲��Ƿ���ʧ��
% ���㾭��ֲ�������Ƶ��ֱ��ͼ
[f,x] = ecdf(t,'censoring',censored);
ecdfhist(f,x)
set(get(gca,'Children'),'FaceColor',[.8 .8 1])
hold on
% Superimpose a plot of the known population pdf
xx = 0:.1:max(t);
yy = exp(-xx/10)/10;
plot(xx,yy,'r-','LineWidth',2)
hold off
