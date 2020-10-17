 clear all;    %清理工作空间
%输入数据x和y
x=[143 145 146 148 149 150 153 154 157 158 159 160 162 164]';
y=[11 13 14 15 16 18 20 21 22 25 26 28 29 31]';
x=[ones(length(x),1),x];
%线性回归
 [b,bint,r,rint,stats]=regress(y,x);
 %r2越接近1，F越大，p越小（<0.05），回归效果越显著
 r2=stats(1)
 F=stats(2)
 p=stats(3)
 %绘制原始数据和拟合的直线
 z=b(1)+b(2)*x;
 subplot(2,1,1);
 plot(x,y,'o',x,z,'-');
 %绘制残差图
 subplot(2,1,2);
 rcoplot(r,rint);
