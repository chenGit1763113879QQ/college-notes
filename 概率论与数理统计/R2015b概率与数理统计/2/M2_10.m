clear all;
x=[-eps:-0.02:-0.05,0:0.02:5];
x=sort(x');
p1=[1 2 3 4];q1=[1 1 1 2 1];
y1=[];y2=[];
for i=1:length(p1)
    y1=[y1,fpdf(x,p1(i),q1(i))];
    y2=[y2,fcdf(x,p1(i),q1(i))];
end
figure;plot(x,y1);
gtext('(1,1)');gtext('(2,1)');
gtext('(3,1)');gtext('(4,1)');gtext('(3,2)');
figure;plot(x,y2);
gtext('(1,1)');gtext('(2,1)');
gtext('(3,1)');gtext('(4,1)');gtext('(3,2)');
