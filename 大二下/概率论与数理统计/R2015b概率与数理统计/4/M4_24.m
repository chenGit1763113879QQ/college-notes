clear all;
A=[7.0 3.6 9.5 8.1 6.3 5.0 10.3 4.2 2.7 10.6];
B=[5.6 3.3 4.0 11.0 9.6 7.0 3.5 4.6 5.8 8.2 10.0 5.6 12.2];
[p,h,stats]=ranksum(A,B,0.05)
