clear all;
%����������
codelines = [200 120 555 608 1024 101 57 687];
%��������
coders ={'Fred','Ginger','Norman','Max','Julia','Wally','Heidi','Pat'};
pareto(codelines, coders)        %����������ͼ
title('��������������ͼ')
xlabel('����');ylabel('Ч��ͼ');
