 clear all;
X = 0:pi/10:pi;
Y = sin(X);
E = std(Y)*ones(size(X));
errorbar(X,Y,E) 
xlabel('Êı¾İ');ylabel('Îó²îÌõÍ¼');
