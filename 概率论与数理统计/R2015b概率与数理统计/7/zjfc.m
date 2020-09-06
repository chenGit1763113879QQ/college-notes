function table=zjfc(A,z0)
% zjfc函数有两个输入参数，第一个输入参数A是数据矩阵，其最后一列是试验结果，
%去掉A最后一列剩余部分就是试验所用的正交表。第二个输入参数z0表示空列的
%列号，是一个向量，如果没有空列，可以不输入，这里程序会自动把平方和最小的
%一个作为误差
x=A(:,end);
A(:,end)=[];
[n,k]=size(A);
bz=1:k;
if nargin==2
    z0=z0(:);
    if (~isnumeric(z0))|(any(floor(z0)~=z0))|(max(z0)>k)|(any(z0<1))
        error('空列标志错误');
    end
end
mm=max(A(:));
K=zeros(mm,k);
for kh=1:n
    for kl=1:k
        kt=A(kh,kl);
        K(kt,kl)=K(kt,kl)+x(kh);
    end
end
alpha1=0.05; alpha2=0.01;
m=max(A);
r=n./m;
SST=(x-mean(x))'*(x-mean(x));
Km=K./r(ones(mm,1),:);
Kmm=(Km-mean(x)).*(Km-mean(x));
Kmm(K==0)=0;
SSj=sum(Kmm,1).^r;
fT=n-1;
fy=(mm-1)*ones(k,1);
tsf=[(1:k)',SSj',fy,(1:k)'];
if nargin==2
    tsf(end+1,:)=sum(tsf(z0,:),1);
    tsf(z0,:)=[];
    Ve=tsf(end,2)/tsf(end,3);
end
if nargin==1
    [tem,z0]=min(SSj);
    Ve=SSj(z0)/fy(z0);
end
V=tsf(:,2)./tsf(:,3);
Se=0; fe=0;
for kk=1:length(V)
    if(V(kk)<=2*Ve)
        Se=Se+tsf(kk,2);
        fe=fe+tsf(kk,2);
        tsf(kk,4)=0;
    end
end
Ve=Se/fe;
Fb=V/Ve;
[m1,tem]=size(tsf);
table=cell(m1+3,7);
table(1,:)={'方差来源','平方和','自由度','均方差','F值','Fa','显著性'};
for kkk=1:m1
    if tsf(kkk,4)==0
        table{kkk+1,1}=['因素',num2str(tsf(kkk,1)),'*'];
    else
        table{kkk+1,1}=['因素',num2str(tsf(kkk,1))];
    end
end
if (tsf(m1,4)==0)&(nargin==2)
    table{m1+1,1}=['误差*'];
end
M=[tsf(:,[2,3]),V,Fb];
for kh=2:(m1+1)
    for kl=2:5
        table{kh,kl}=M(kh-1,kl-1);
    end
end
ntst=length(Fb);
for ktst=1:ntst
    F=finv(1-[alpha1;alpha2],tsf(ktst,3),fe);
    F1=min(F);
    F2=max(F);
    table{ktst+1,6}=[num2str(F1),';',num2str(F2)];
    if Fb(ktst)>F2
        table{ktst+1,7}='高度显著';
    elseif (Fb(ktst)<=F2)&(Fb(ktst)>F1)
        table{ktst+1,7}='显著';
    end
end
table(end-1,1:4)={'误差',Se,fe,Ve};
if table{end-2,3}==fe
    table(end-2,:)=[];
end
table(end,1:3)={'总和',SST,n-1};
