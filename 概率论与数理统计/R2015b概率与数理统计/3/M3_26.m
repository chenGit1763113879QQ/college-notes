clear all;
%装载数据
load carsmall
%比较不同类型汽车的重量和里程数
gscatter(Weight,MPG,Model_Year,'','xos');
xlabel('重量');
ylabel('里程数');
