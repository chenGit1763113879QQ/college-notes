 clear all;
s = 7;
H = zeros(s);
for c = 1:s
    for r = 1:s
        H(r,c) = 1/(r+c-1);
    end
end
disp('��ʾ��������Hilbert����')
H
