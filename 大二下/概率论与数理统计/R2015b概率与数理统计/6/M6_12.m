clear all;
%载入MATLAB自带acetylene.mat数据，包括预测变量x1，x2，x3及和响应变量y
load acetylene
%绘制预测变量
subplot(1,3,1);plot(x1,x2,'.');
xlabel('x1'); ylabel('x2'); 
grid on; axis square;
subplot(1,3,2);plot(x1,x3,'.');
xlabel('x1'); ylabel('x3'); 
grid on; axis square;
subplot(1,3,3);plot(x2,x3,'.');
xlabel('x2'); ylabel('x3'); 
grid on; axis square;
%使用x2fx函数实现矩阵设置，使用ridge函数实现岭回归参数估计
X = [x1 x2 x3];
D = x2fx(X,'interaction');
D(:,1) = [];         % 没有常数项
k = 0:1e-5:5e-3;
b = ridge(y,D,k);
figure;
%绘制岭轨迹图
plot(k,b,'LineWidth',2);
ylim([-100 100]);
grid on 
xlabel('岭参数');ylabel('标准化系数');title('岭跟踪');
legend('x1','x2','x3','x1x2','x1x3','x2x3');
