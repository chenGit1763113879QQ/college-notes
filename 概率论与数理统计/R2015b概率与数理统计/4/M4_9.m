clear all;
x=[78.1,72.4,76.2,74.3,77.4,78.4,76.0,75.5,76.7,77.3];
y=[79.1,81.0,77.3,79.1,80.0,79.1,79.1,77.3,80.2,82.1];
F=var(x)/var(y);
p=1-fcdf(F,9,9)
