clear al;
strength =[82 86 79 83 84 85 86 87 74 82 78 75 76 77 79 79 77 78 82 79];
alloy = {'st','st','st','st','st','st','st','st',...
         'al1','al1','al1','al1','al1','al1',...
         'al2','al2','al2','al2','al2','al2'};
[p,table ,s] = anova1(strength,alloy);             %·½²î·ÖÎö
table
[c,m,h,nms] = multcompare(s);
[nms num2cell(c)]
