clear all;
ingredients=[26 6	60	78.5;1	29	15	52;11	56	8	20;11	31	8	48;...
            7	52	6	33;11	55	9	22;3	54	17	6;1	70	22	48;...
            2	32	18	24;21 52	4 26;1 48	24	34;11 40	9 12;10	66	8	12];
 heat=[78.5 74.3 104.3 87.5 95.6 109.6 102.7 72.5 93.1 115.9 83.9 113.3 109.4]';
[b,se,pval,inmodel,stats,nextstep,history]=stepwisefit(ingredients,heat,...
            'penter',0.05,'premove',0.10);
 inmodel,b0=stats.intercept,b           %自变更的筛选和模型参数估计信息
 Allp=stats.pval,rmse=stats.rmse        %回归方程显著性整体检验信息
 P=stats.PVAL                           %回归方程显著性分别检验信息
