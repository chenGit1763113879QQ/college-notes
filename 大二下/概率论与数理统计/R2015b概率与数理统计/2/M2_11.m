 clear all;
x=[0:15]'; 
y1=[]; 
y2=[]; 
lam1=[1,3,6,10];
for i=1:length(lam1)
    y1=[y1,poisspdf(x,lam1(i))]; 
    y2=[y2,poisscdf(x,lam1(i))];
end
figure;plot(x,y1)
xlabel('x');ylabel('y1');
gtext('��=1');gtext('��=3');
gtext('��=6');gtext('��=10'); 
figure;plot(x,y2)
xlabel('x');ylabel('y2');
gtext('��=1');gtext('��=3');
gtext('��=6');gtext('��=10'); 
