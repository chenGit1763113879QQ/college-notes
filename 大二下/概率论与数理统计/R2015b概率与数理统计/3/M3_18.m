 clear all;
data1=[6.683 6.681 6.676 6.678 6.679 6.672];
alpha=0.1;
[muhat1,sigmahat1,muci1,sigmaci1]=normfit(data1,alpha)
[phat1,pci1]=mle(data1,'distribution','normal','alpha',alpha)
data2=[6.661 6.661 6.667 6.667 6.664];
[muhat2,sigmahat2,muci2,sigmaci2]=normfit(data2,alpha)
[phat2,pci2]=mle(data1,'distribution','normal','alpha',alpha)
