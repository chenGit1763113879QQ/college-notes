 clear all;
load carbig         %载入数据
%定义变量矩阵
X = [Acceleration Displacement Horsepower MPG Weight];
X = X(all(~isnan(X),2),:);
%估计负荷矩阵
[Lambda,Psi,T,stats,F] = factoran(X,2,'scores','regression');
disp('负荷矩阵：')
Lambda
disp('F的相关矩阵：')
inv(T'*T)
disp('X的相关矩阵：')
Lambda*Lambda' + diag(Psi); 
disp('未经旋转的负荷矩阵：')
Lambda*inv(T)            
disp('未经旋转的因素贡献率：')
F*T'                      
%绘制未经旋转的负荷点和旋转斜坐标
biplot(Lambda,'LineWidth',2,'MarkerSize',20)
