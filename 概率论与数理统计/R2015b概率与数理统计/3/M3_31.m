 clear all;
y = exprnd(10,50,1); % 随机故障次数
d = exprnd(20,50,1); % 随机丢失次数
t = min(y,d);        % 最低次数
censored = (y>d);    % 观察是否受失败
% 计算经验分布并绘制频率直方图
[f,x] = ecdf(t,'censoring',censored);
ecdfhist(f,x)
set(get(gca,'Children'),'FaceColor',[.8 .8 1])
hold on
% Superimpose a plot of the known population pdf
xx = 0:.1:max(t);
yy = exp(-xx/10)/10;
plot(xx,yy,'r-','LineWidth',2)
hold off
