>> clear all;
x=[-eps:-0.02:-0.05,0:0.02:5];
x=sort(x');
b1=[0.5,1,3,5];
y1=[];y2=[];
for i=1:length(b1)
    y1=[y1,raylpdf(x,b1(i))];
    y2=[y2,raylcdf(x,b1(i))];
end
figure;plot(x,y1);
gtext('b=0.5');gtext('b=1');
gtext('b=3');gtext('b=5');
figure;plot(x,y2);
gtext('b=0.5');gtext('b=1');
gtext('b=3');gtext('b=5');

