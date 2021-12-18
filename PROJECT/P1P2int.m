%Problem 1
for i = [0,1,2,3,4,5,6,7,8,9,10]
   Ax(i+1)=-1+2./10.*i 
   Ay(i+1)=1./(1+25*Ax(i+1)^2)
end
%Problem 2
for i = [0,1,2,3,4,5,6,7,8,9,10]
   %Ax(i+1)=-cos((2*i+1)/6*pi)
   %Ay(i+1)=1./(1+25*Ax(i+1)^2)
end
syms x
x = [-1:0.01:Ax(3)]
f1 = Ay(1).*(x-Ax(2)).*(x-Ax(3))/((Ax(1)-Ax(2))*(Ax(1)-Ax(3)))+Ay(2).*(x-Ax(1)).*(x-Ax(3))/((Ax(2)-Ax(1))*(Ax(2)-Ax(3)))+Ay(3).*(x-Ax(1)).*(x-Ax(2))/((Ax(3)-Ax(1))*(Ax(3)-Ax(2)))
plot(x,f1,'b');hold on;
%原函数图像
x=[-1:0.01:1.0]
y = 1./(1+25*x.^2)
plot(x,y,'r');hold on;
x = [Ax(3):0.01:1]
f2 = Ay(4).*(x-Ax(5)).*(x-Ax(3))/((Ax(4)-Ax(5))*(Ax(4)-Ax(3)))+Ay(5).*(x-Ax(4)).*(x-Ax(3))/((Ax(5)-Ax(4))*(Ax(5)-Ax(3)))+Ay(3).*(x-Ax(4)).*(x-Ax(5))/((Ax(3)-Ax(4))*(Ax(3)-Ax(5)))
plot(x,f2,'b');hold on;
f3 = Ay(7).*(x-Ax(5)).*(x-Ax(6))/((Ax(7)-Ax(5))*(Ax(7)-Ax(6)))+Ay(5).*(x-Ax(7)).*(x-Ax(6))/((Ax(5)-Ax(7))*(Ax(5)-Ax(6)))+Ay(6).*(x-Ax(7)).*(x-Ax(5))/((Ax(6)-Ax(7))*(Ax(6)-Ax(5)))
plot(x,f3);hold on;
f4 = Ay(7).*(x-Ax(8)).*(x-Ax(9))/((Ax(7)-Ax(8))*(Ax(7)-Ax(9)))+Ay(8).*(x-Ax(7)).*(x-Ax(9))/((Ax(8)-Ax(7))*(Ax(8)-Ax(9)))+Ay(9).*(x-Ax(7)).*(x-Ax(8))/((Ax(9)-Ax(7))*(Ax(9)-Ax(8)))
plot(x,f4);hold on;
f5 = Ay(10).*(x-Ax(11)).*(x-Ax(9))/((Ax(10)-Ax(11))*(Ax(10)-Ax(9)))+Ay(11).*(x-Ax(10)).*(x-Ax(9))/((Ax(11)-Ax(10))*(Ax(11)-Ax(9)))+Ay(9).*(x-Ax(10)).*(x-Ax(11))/((Ax(9)-Ax(10))*(Ax(9)-Ax(11)))
plot(x,f5);hold on;