 clear all;
%生成正态分布数据
M=100;N=1;
x=normrnd(0,1,M,N);
%生成均匀分布
y=rand(M,N);
z=[x,y];
%绘制QQ图
subplot(221);
h1=qqplot(z);
xlabel('标准正态样本');ylabel('输入样本');title('QQ图');
legend('正态分布数据','均匀分布数据');
grid on;
%生成两个正态分布样本
x=normrnd(0,1,100,1);
y=normrnd(0.5,2,50,1);
subplot(222)
h2=qqplot(x,y);
xlabel('输入样本x');ylabel('输入样本y ');title('QQ图');
grid on;
%生成两个不同分布的样本
x=normrnd(5,1,100,1);
y=weibrnd(2,0.5,100,1);
subplot(223)
h3=qqplot(x,y);
xlabel('输入样本x');ylabel('输入样本y');title('QQ图');
grid on;
subplot(224)

%生成一个正态分布的样本
x=normrnd(10,1,100,1);
subplot(224)
qqplot(x);
xlabel('输入样本x');ylabel('输入样本x');title('QQ图');
grid on;

