clear all;
load lawdata
rng default  % 设置重复性
[bootstat,bootsam] = bootstrp(1000,@corr,lsat,gpa);
bootstat(1:5,:)
 bootsam(:,1:5)
figure
histogram(bootstat)    %效果如图2-22所示。
