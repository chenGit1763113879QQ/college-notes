 clear;
Wlower=binoinv(0.95,100,0.5)  %求拒绝域的临界值50+δ

clear;
p1=1-binocdf(50,100,0.5);
p2=1-binocdf(55,100,0.5);
p3=1-binocdf(60,100,0.5);
p4=1-binocdf(65,100,0.5);
p=[p1,p2,p3,p4]
