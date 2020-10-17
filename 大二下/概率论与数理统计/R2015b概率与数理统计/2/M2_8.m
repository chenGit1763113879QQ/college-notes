 clear all;
x=[-5:0.02:5]';
y1=[];y2=[];
k1=[1 2 5 10];
for i=1:length(k1)
    y1=[y1,tpdf(x,k1(i))];
    y2=[y2,tcdf(x,k1(i))];
end
figure;plot(x,y1);
gtext('k=1');gtext('k=2');
gtext('k=5');gtext('k=10');
figure;plot(x,y2);
gtext('k=1');gtext('k=2');
gtext('k=5');gtext('k=10');
