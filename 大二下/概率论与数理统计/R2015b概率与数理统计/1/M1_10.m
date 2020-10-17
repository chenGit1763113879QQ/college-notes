 clear all;
s = 7;
H = zeros(s);
for c = 1:s
    for r = 1:s
        H(r,c) = 1/(r+c-1);
    end
end
disp('显示所创建的Hilbert矩阵：')
H
