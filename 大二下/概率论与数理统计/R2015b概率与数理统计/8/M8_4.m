clear all;
load hald;   %ԭʼ���ݾ���
ingredients         %ԭʼ����

%���ɷַ���
[pc,score,latent,tsquare] = princomp(ingredients)

 cumsum(latent)./sum(latent)
 
 %�������ɷ�ɢ��ͼ
 biplot(pc(:,1:2),'Scores',score(:,1:2),'VarLabels',{'X1' 'X2' 'X3' 'X4'})  
