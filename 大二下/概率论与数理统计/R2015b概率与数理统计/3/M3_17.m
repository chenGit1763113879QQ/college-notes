clear all;
S = load('reaction');
X = S.reactants;
y = S.rate;
beta0 = S.beta;
[beta,R,J] = nlinfit(X,y,@hougen,beta0);
[ypred,delta] = nlpredci(@hougen,mean(X),beta,R,'Jacobian',J)
