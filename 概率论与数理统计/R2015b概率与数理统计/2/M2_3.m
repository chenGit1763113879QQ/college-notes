 clear all;
x=[-5:0.02:5]';
y1=[];y2=[];
mu1=[-1,0,0,0,1];
sig1=[1 0.1 1 10 1];
sig1=sqrt(sig1);
for i=1:length(mu1)
    y1=[y1,normpdf(x,mu1(i),sig1(i))];
    y2=[y2,normcdf(x,mu1(i),sig1(i))];
end
figure;plot(x,y1);
gtext('米=-1,考^2=1');
gtext('米=0,考^2=0.1');
gtext('米=0,考^2=1');
gtext('米=1,考^2=1');
gtext('米=0,考^2=10');
figure;plot(x,y2);
gtext('米=-1,考^2=1');
gtext('米=0,考^2=0.1');
gtext('米=0,考^2=10');
gtext('米=1,考^2=1');
gtext('米=1,考^2=1');
