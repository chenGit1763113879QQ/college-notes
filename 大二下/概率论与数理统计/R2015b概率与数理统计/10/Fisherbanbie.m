function kiX = Fisherbanbie(XA,XB,SaX)
% XA为第一类的样本矩阵;
% XB为第二类的样本矩阵;
% SaX需要分类的样本
% kiX为样本的类别
format long;
sz1 = size(XA);
sz2 = size(XB);
M = sz1(1);         %样本个数
N = sz2(1);
n = sz1(2);
meanXA = mean(XA);
meanXB = mean(XB);
sx = zeros(n,n);
Y = zeros(N,n);
for i=1:n
    for j=1:n
        sx(i,j) = dot(XA(:,i)-meanXA(i)*zeros(M,1),XA(:,j)-meanXA(j)*zeros(M,1))+ ...
              dot(XB(:,i)-meanXB(i)*zeros(N,1),XB(:,j)-meanXB(j)*zeros(N,1));
    end
end
d = transpose(meanXA - meanXB);
c = sx\d;
YA = dot(c,meanXA);
YB = dot(c,meanXB);
Yc =(M*YA + N*YB)/(M+N);
Y0 = dot(c,SaX);
if YA > YB
    if Y0 > Yc
        kiX = 1;
        disp('样品属于第一类');
    else
        if Y0 == Yc
            kiX = 0 ;
            disp('没法判断');
        else
            kiX = 2;
            disp('样品属于第二类');
        end
    end
else
    if YA < YB
        if Y0 > Yc
            kiX = 2;
            disp('样品属于第二类');
        else
            if Y0 == Yc
                kiX = 0 ;
                 disp('没法判断');
            else
                kiX = 1;
                disp('样品属于第一类');
            end
        end
    else
         disp('没法判断');
    end
end
