clear all;
%�ú��������ʾģ��
modelfun = @(b,x)(b(1)+b(2)*exp(-b(3)*x));
rng('default') % ���ظ���
b = [1;3;2];
x = exprnd(2,100,1);
y = modelfun(b,x) + normrnd(0,0.5,100,1);
%�ʺϷ�����ģ�ͣ���������ѡ��
opts = statset('nlinfit');
opts.RobustWgtFun = 'bisquare';
beta0 = [2;2;2];
[beta,R,J,CovB,MSE] = nlinfit(x,y,modelfun,beta0,opts);
%������95%�������������ϻع�ģ��
xrange = min(x):.01:max(x);
[ypred,delta] = nlpredci(modelfun,xrange,beta,R,'Covar',CovB,...
                         'MSE',MSE,'SimOpt','on');
lower = ypred - delta;   %�½�
upper = ypred + delta;   %�Ͻ�
plot(x,y,'ko') %�۲�����
hold on
plot(xrange,ypred,'k','LineWidth',2);
plot(xrange,[lower;upper],'r--','LineWidth',1.5);
legend('ԭʼ����','��ϻع�ģ������','��95%�������������ϻع�ģ��');
