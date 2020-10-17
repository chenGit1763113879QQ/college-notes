clear all;
x=0:0.1:30;        %给出x的取值
y1=chi2pdf(x,3);   %计算出对应于x的自由度1的概率密度函数数值
plot(x,y1,'r:');
hold on;
y2=chi2pdf(x,5); 
plot(x,y2,'kp');
y3=chi2pdf(x,15);
plot(x,y3,'b-.');
gtext('自由度为3');
gtext('自由度为5');
gtext('自由度为15');
axis([0 30 0 0.25])     %指定显示的图形区域
[m,v]=chi2stat(15)
