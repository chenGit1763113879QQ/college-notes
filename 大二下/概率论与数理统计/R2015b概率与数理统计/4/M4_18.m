 clear all;
alpha=0.05;
f=[40 138 620 1043;20 72 442 625];
[s,t]=size(f);  %��ȡ��������С�����
df=(s-1)*(t-1);
f_i=sum(f');  %�б߼�Ƶ��
f_j=sum(f);  %�б߼�Ƶ��
n=sum(sum(f));
nfi_f_j=zeros(s,t);
for i=1:2
    for j=1:4
        nf_i_f_j(i,j)=f_i(i)*f_j(j)/n;  %���Ϸֲ���
    end
end
chi2=sum(sum((f-nfi_f_j).^2./nf_i_f_j));  %����ͳ������ֵ
refcr=chi2inv(1-alpha,df);  %�ܾ����ٽ�ֵ
p=1-chi2cdf(chi2,df);  %�����pֵ
if chi2>refcr
    h=1;
else
    h=0;
end
alpha,h,p,chi2,refcr
