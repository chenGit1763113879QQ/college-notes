clear all;
A=[23  25 26 13 21 25 20 21 16  18	21  24  24  29 1914  11  19  20  24];
B=[28  22 25  19  26	30  26  26 20  28	17  27 19 23  13	17  21 18 26  23];
C=[18 10  12  22  13	15  21  22  14 12	16  19 25  25  2218  12 23  22 19];
X=[A',B',C'];
reps=5;
[p,tbl,stats] = anova2(X,reps,'off')
