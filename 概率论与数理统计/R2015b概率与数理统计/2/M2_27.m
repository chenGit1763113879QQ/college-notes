clear all;
load lawdata
rng default  % �����ظ���
[bootstat,bootsam] = bootstrp(1000,@corr,lsat,gpa);
bootstat(1:5,:)
 bootsam(:,1:5)
figure
histogram(bootstat)    %Ч����ͼ2-22��ʾ��
