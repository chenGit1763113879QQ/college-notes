function m=Spatial_rotation(a,x)
%计算旋转矩阵
x=x*pi/180;             %把角度化为弧度
m=zeros(3,3);          
switch a
    case 1            %绕x轴旋转
        m(1,1)=1;
        m(2,2)=cos(x);
        m(2,3)=sin(x);
        m(3,2)=-sin(x);
        m(3,3)=cos(x);
    case 2          %绕y轴旋转
        m(1,1)=cos(x);
        m(1,2)=-sin(x);
        m(2,2)=1;
        m(3,1)=sin(x);
        m(3,3)=cos(x);
    case 3         %绕z轴旋转
        m(1,1)=cos(x);
        m(1,2)=sin(x);
        m(2,1)=-sin(x);
        m(2,2)=cos(x);
        m(3,3)=1;
end
