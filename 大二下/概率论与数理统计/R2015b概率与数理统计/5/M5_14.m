 clear all;
%װ������
load carbig
whos
%��������
factornames={'Origin','4Cyl','MfgDate'};
%�����ط������
[p,tbl,stats,termvec]=anovan(MPG,{org cyl4 when},2,3,factornames);
p,termvec
