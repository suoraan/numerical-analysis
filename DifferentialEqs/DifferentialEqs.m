clear
h=0.5
%原函数
ax=[0:h:1]
af=-ax-1+2*exp(ax)
plot(ax,af);hold on;
%初值
x(1)=0;
y(1)=1;
ty=y(1);
for i =1:4
    x(i+1)=x(i)+h
    
    %Euler方法
    y(i+1)=y(i)+h*f(x(i),y(i))
    
    %梯形公式，隐式
    while(abs(ty-y(i+1))<0.001)
        y(i+1)=y(i)+h*f(x(i+1),ty)
        ty=y(i+1)
    end
    
    %改进Euler方法
    y(i+1)=y(i)+0.5*h*(f(x(i),y(i))+f(x(i+1),y(i)+h*f(x(i),y(i))))
    
    %四阶Rung－kutta 算法
    K1=f(x(i),y(i))
    K2=f(x(i)+0.5*h,y(i)+0.5*h*K1)
    K3=f(x(i)+0.5*h,y(i)+0.5*h*K2)
    K4=f(x(i)+h,y(i)+h*K3)
    y(i+1)=y(i)+h/6*(K1+2*K2+2*K3+K4)
end
plot(x,y);%hold on;
%误差
e=af-y
plot(ax,e)
legend("解析原函数","数值解","误差")