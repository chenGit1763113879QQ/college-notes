 clear all;
alpha=0.05;
f=[40 138 620 1043;20 72 442 625];
[s,t]=size(f);  %提取列联表的行、列数
df=(s-1)*(t-1);
f_i=sum(f');  %行边际频数
f_j=sum(f);  %列边际频数
n=sum(sum(f));
nfi_f_j=zeros(s,t);
for i=1:2
    for j=1:4
        nf_i_f_j(i,j)=f_i(i)*f_j(j)/n;  %联合分布律
    end
end
chi2=sum(sum((f-nfi_f_j).^2./nf_i_f_j));  %检验统计量的值
refcr=chi2inv(1-alpha,df);  %拒绝域临界值
p=1-chi2cdf(chi2,df);  %检验的p值
if chi2>refcr
    h=1;
else
    h=0;
end
alpha,h,p,chi2,refcr
