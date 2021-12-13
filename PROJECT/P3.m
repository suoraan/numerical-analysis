for i = [0,1,2,3,4,5,6,7,8,9,10]
   Ax(i+1)=-1+2./10.*i 
   Ay(i+1)=1./(1+25*Ax(i+1)^2)
end
syms x;
for i = [2,3,4,5,6,7,8,9,10,11]
   x = [Ax(i-1):0.01:Ax(i)];
   f1= (Ay(i)-Ay(i-1)).*(x-Ax(i))./(Ax(i)-Ax(i-1))+Ay(i);
   plot(x,f1);hold on;
end
%原函数图像
x=[-1:0.01:1.0]
y = 1./(1+25*x.^2)
plot(x,y,'m');
%求积分
syms x;
syms IN;
IN = 0;
for i = [2,3,4,5,6,7,8,9,10,11]
   f1= (Ay(i)-Ay(i-1)).*(x-Ax(i))./(Ax(i)-Ax(i-1))+Ay(i);
   I(i)= int(f1,x,Ax(i-1),Ax(i))
   IN = IN +I(i)
end