function y=ration(x)       %������󷽲���ת����
[r,c]=size(x);
for k=1:c-1        %����ת��
    for j=k+1:c
        aa=0;bb=0;
        cc=0;dd=0;
        for i=1:r
            uu=x(i,k)^2-x(i,j)^2;
            vv=x(i,k)*x(i,j)*2;
            aa=aa+uu;bb=bb+vv;
            cc=cc+uu^2-vv^2;
            dd=dd+uu*vv*2;
        end
        dd=r*dd-2*aa*bb;
        cc=r*cc-aa^2+bb^2;
        if abs(cc)<1e-10         %ȷ����ת�ǵķ�Χ
            b=pi/2;
        else
            b=abs(atan(dd/cc));
        end
        if cc<0,
            b=pi-b;
            if dd>0,
                b=0.25*b;
            else
                b=-b*0.25;
            end
        elseif dd>0
            b=0.25*b;
        else 
            b=-0.25*b;
        end
        si=sin(b);
        co=cos(b);
        for i=1:r,
            qq=x(i,k)*co+x(i,j)*si;
            x(i,j)=-x(i,k)*si+co*x(i,j);
            x(i,k)=qq;
        end
    end
end
y=x;
end
