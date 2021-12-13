%Problem 1
for i = [0,1,2,3,4,5,6,7,8,9,10]
   %Ax(i+1)=-1+2./10.*i;
   %Ay(i+1)=1./(1+25*Ax(i+1)^2);
end
%Problem 2
for i = [0,1,2,3,4,5,6,7,8,9,10]
   Ax(i+1)=-cos((2*i+1)/22*pi);
   Ay(i+1)=1./(1+25*Ax(i+1)^2);
end
syms x
f0 = 1/(1+25.*x.^2);
f1 = diff(f0);
f1 = diff(f1);
f1 = diff(f1);
%df是原函数的三次倒数
df = (15000.*x)./(25.*x.^2 + 1).^3 - (750000.*x.^3)./(25.*x.^2 + 1).^4;
%试图画出插值余项的函数图像
%x =[-1:0.01:Ax(3)];
Rf =1.2.*(x-Ax(1)).*(x-Ax(2)).*(x-Ax(3));
I1 = int(abs(Rf),x,-1,Ax(3))
%plot(x,Rf,'r');
%x = [Ax(3):0.01:Ax(5)]
Rf = 1/6*52.52.*(x-Ax(4)).*(x-Ax(5)).*(x-Ax(3))
I1 = I1 + int(abs(Rf),x,Ax(3),Ax(5))
%plot(x,Rf,'b');
x =[Ax(5):0.01:Ax(7)]
Rf = 1/6*580.4.*(x-Ax(5)).*(x-Ax(6)).*(x-Ax(7))
%I1 = I1 + int(abs(Rf),x,Ax(5),Ax(7))
plot(x,Rf,'r');
%x = [Ax(7):0.01:Ax(9)]
Rf = 1/6*52.52.*(x-Ax(8)).*(x-Ax(7)).*(x-Ax(9))
I1 = I1 + int(abs(Rf),x,Ax(7),Ax(9))
%plot(x,Rf,'b');
%pause; 
%x = [Ax(9):0.01:Ax(11)]
Rf = 1.2.*(x-Ax(10)).*(x-Ax(11)).*(x-Ax(9))
I1 = I1 + int(abs(Rf),x,Ax(9),Ax(11))
%plot(x,Rf,'r');
