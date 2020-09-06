clear all;
%给定生产力
codelines = [200 120 555 608 1024 101 57 687];
%生产工名
coders ={'Fred','Ginger','Norman','Max','Julia','Wally','Heidi','Pat'};
pareto(codelines, coders)        %绘制帕累托图
title('生产力制帕累托图')
xlabel('数据');ylabel('效果图');
