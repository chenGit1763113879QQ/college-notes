 clear all;
S = load('reaction');
X = S.reactants;
y = S.rate;
beta0 = S.beta;
%����nlinfit�������������С�����������
beta = nlinfit(X,y,@hougen,beta0)
