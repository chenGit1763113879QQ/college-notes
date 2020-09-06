 clear all;
X = randn(100,10);
%利用默认法对给定数据的前3列数据进行旋转
LPC = princomp(X);
[L1,T] = rotatefactors(LPC(:,1:3))
 %利用Equamax法对给定数据的前3列数据进行旋转
[L2,T] = rotatefactors(LPC(:,1:3), 'method','equamax')
%利用Promax法对给定数据的前3列数据进行旋转
LFA = factoran(X,3,'Rotate','none');
[L3,T] = rotatefactors(LFA(:,1:3), 'method','promax', 'power',2)
 %利用Pattern法对给定数据的前3列数据进行旋转
Tgt = [1 1 1 1 1 0 1 0 1 1; 0 0 0 1 1 1 0 0 0 0;1 0 0 1 0 1 1 1 1 0]';   %目标数据
[L4,T] = rotatefactors(LFA(:,1:3), 'method','pattern', 'target',Tgt)
disp('相关矩阵的旋转因子为：')
inv(T'*T) 
