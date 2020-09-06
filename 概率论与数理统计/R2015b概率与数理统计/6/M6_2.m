 clear all;
x=[3 4 5 6 7 8]*100;
Y=[41	52	56	62	68	71];
p=polyfit(x,Y,1)
plot(x,Y,'mo');
lsline;
xlabel('ÍË»ğÎÂ¶È');ylabel('»ÆÍ­ÑÓĞÔ');
