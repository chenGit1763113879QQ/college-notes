 clear all;
load carbig         %��������
%�����������
X = [Acceleration Displacement Horsepower MPG Weight];
X = X(all(~isnan(X),2),:);
%���Ƹ��ɾ���
[Lambda,Psi,T,stats,F] = factoran(X,2,'scores','regression');
disp('���ɾ���')
Lambda
disp('F����ؾ���')
inv(T'*T)
disp('X����ؾ���')
Lambda*Lambda' + diag(Psi); 
disp('δ����ת�ĸ��ɾ���')
Lambda*inv(T)            
disp('δ����ת�����ع����ʣ�')
F*T'                      
%����δ����ת�ĸ��ɵ����תб����
biplot(Lambda,'LineWidth',2,'MarkerSize',20)
