function m=Spatial_rotation(a,x)
%������ת����
x=x*pi/180;             %�ѽǶȻ�Ϊ����
m=zeros(3,3);          
switch a
    case 1            %��x����ת
        m(1,1)=1;
        m(2,2)=cos(x);
        m(2,3)=sin(x);
        m(3,2)=-sin(x);
        m(3,3)=cos(x);
    case 2          %��y����ת
        m(1,1)=cos(x);
        m(1,2)=-sin(x);
        m(2,2)=1;
        m(3,1)=sin(x);
        m(3,3)=cos(x);
    case 3         %��z����ת
        m(1,1)=cos(x);
        m(1,2)=sin(x);
        m(2,1)=-sin(x);
        m(2,2)=cos(x);
        m(3,3)=1;
end
