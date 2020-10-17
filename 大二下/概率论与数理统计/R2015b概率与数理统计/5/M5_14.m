 clear all;
%装载数据
load carbig
whos
%三个因素
factornames={'Origin','4Cyl','MfgDate'};
%多因素方差分析
[p,tbl,stats,termvec]=anovan(MPG,{org cyl4 when},2,3,factornames);
p,termvec
