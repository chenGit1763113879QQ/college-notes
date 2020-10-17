clear all;
x=[1050,1100,1120,1250,1280];
N=length(x);
muEST=mean(x)
muLOWER=muEST-tinv(0.95,N-1)*sqrt(var(x)/N)
