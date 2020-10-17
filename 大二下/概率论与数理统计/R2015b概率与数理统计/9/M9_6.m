 clear all;
load stockreturns        %载入数据
%因子个数
m=3;
%因子分析
[Loadings,specificVar,T,stats]=factoran(stocks,m,'rotate','none');
disp('未经旋转的公共因子负载矩阵：')
Loadings
disp('未经旋转的特殊因子矩阵：')
specificVar
[LoadingsPM,specificVarPM]=factoran(stocks,m,'rotate','promax');
disp('旋转后的公共因子负荷矩阵：')
LoadingsPM
subplot(121);
plot(LoadingsPM(:,1),LoadingsPM(:,2),'r.');
text(LoadingsPM(:,1),LoadingsPM(:,2),num2str((1:10)'));
line([-1 1 NaN 0 0 NaN 0 0],[0 0 NaN -1 1 NaN 0 0],'Color','black');
xlabel('因素1');
ylabel('因素2');
axis square;
subplot(122);
plot(LoadingsPM(:,1),LoadingsPM(:,3),'r.');
text(LoadingsPM(:,1),LoadingsPM(:,3),num2str((1:10)'));
line([-1 1 NaN 0 0 NaN 0 0],[0 0 NaN -1 1 NaN 0 0],'Color','black');
xlabel('因素1');
ylabel('因素3');
axis square;
