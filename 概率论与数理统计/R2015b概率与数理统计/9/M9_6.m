 clear all;
load stockreturns        %��������
%���Ӹ���
m=3;
%���ӷ���
[Loadings,specificVar,T,stats]=factoran(stocks,m,'rotate','none');
disp('δ����ת�Ĺ������Ӹ��ؾ���')
Loadings
disp('δ����ת���������Ӿ���')
specificVar
[LoadingsPM,specificVarPM]=factoran(stocks,m,'rotate','promax');
disp('��ת��Ĺ������Ӹ��ɾ���')
LoadingsPM
subplot(121);
plot(LoadingsPM(:,1),LoadingsPM(:,2),'r.');
text(LoadingsPM(:,1),LoadingsPM(:,2),num2str((1:10)'));
line([-1 1 NaN 0 0 NaN 0 0],[0 0 NaN -1 1 NaN 0 0],'Color','black');
xlabel('����1');
ylabel('����2');
axis square;
subplot(122);
plot(LoadingsPM(:,1),LoadingsPM(:,3),'r.');
text(LoadingsPM(:,1),LoadingsPM(:,3),num2str((1:10)'));
line([-1 1 NaN 0 0 NaN 0 0],[0 0 NaN -1 1 NaN 0 0],'Color','black');
xlabel('����1');
ylabel('����3');
axis square;
