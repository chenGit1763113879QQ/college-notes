clear all;
load hald;   %原始数据矩阵
ingredients         %原始矩阵

%主成分分析
[pc,score,latent,tsquare] = princomp(ingredients)

 cumsum(latent)./sum(latent)
 
 %绘制主成分散点图
 biplot(pc(:,1:2),'Scores',score(:,1:2),'VarLabels',{'X1' 'X2' 'X3' 'X4'})  
