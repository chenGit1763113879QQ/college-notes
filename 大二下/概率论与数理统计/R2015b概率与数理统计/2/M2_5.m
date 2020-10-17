 clear all;
x=[-5:0.02:5]';
y1=[];y2=[];
a1=[1 1 2 1 3];
lam1=[1 0.5 1 2 1];
for i=1:length(a1)
    y1=[y1,gampdf(x,a1(i),lam1(i))];
    y2=[y2,gamcdf(x,a1(i),lam1(i))];
end
figure;plot(x,y1);
gtext('a=1,¦Ë=1');
gtext('a=1, ¦Ë=1');
gtext('a=1, ¦Ë=2');
gtext('a=2, ¦Ë=1');
gtext('a=3, ¦Ë=1');
figure;plot(x,y2);
gtext('a=1, ¦Ë=0.5');
gtext('a=1, ¦Ë=1');
gtext('a=1, ¦Ë=2');
gtext('a=2, ¦Ë=1');
gtext('a=3, ¦Ë=1');
