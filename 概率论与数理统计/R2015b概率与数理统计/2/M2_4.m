 clear all;
x=randn(6)    %创建6×6的正态随机数矩阵，其元素服从标准正态分布
y=x(:);          %将x按列拉长生成一个列向量
hist(y);         %绘制频数直方图
title('标准正态分布');
xlabel('x');ylabel('频数');
