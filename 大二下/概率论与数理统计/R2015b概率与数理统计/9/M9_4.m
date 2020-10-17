 clear all;
X = randn(100,10);
%����Ĭ�Ϸ��Ը������ݵ�ǰ3�����ݽ�����ת
LPC = princomp(X);
[L1,T] = rotatefactors(LPC(:,1:3))
 %����Equamax���Ը������ݵ�ǰ3�����ݽ�����ת
[L2,T] = rotatefactors(LPC(:,1:3), 'method','equamax')
%����Promax���Ը������ݵ�ǰ3�����ݽ�����ת
LFA = factoran(X,3,'Rotate','none');
[L3,T] = rotatefactors(LFA(:,1:3), 'method','promax', 'power',2)
 %����Pattern���Ը������ݵ�ǰ3�����ݽ�����ת
Tgt = [1 1 1 1 1 0 1 0 1 1; 0 0 0 1 1 1 0 0 0 0;1 0 0 1 0 1 1 1 1 0]';   %Ŀ������
[L4,T] = rotatefactors(LFA(:,1:3), 'method','pattern', 'target',Tgt)
disp('��ؾ������ת����Ϊ��')
inv(T'*T) 
