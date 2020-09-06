% 无交互作用的极差分析wjhzejc.m的源代码如下：
function y=wjhzejc (A)
[m,n]=size(A);
B=A(:,1:end-1);
mm=max(B(:));
K=zeros(mm,n-1);
for kh=1:m
    for k1=1:(n-1)
        kt=A(kh,k1);
        K(kt,k1)=K(kt,k1)+A(kh,end);
    end
end
K(K==0)=NaN;
y.K=K;
M=max(B);
MM=m./M;
Km=K./MM(ones(mm,1),:);
y.m=Km;
[tem,you]=max(Km);
y.you=you;
R=max(Km)-min(Km);
y.R=R;
[temp,Cx]=sort(R);
y.cixu=fliplr(Cx);
