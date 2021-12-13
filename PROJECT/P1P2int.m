%Problem 1
for i = [0,1,2,3,4,5,6,7,8,9,10]
   %Ax(i+1)=-1+2./10.*i 
   %Ay(i+1)=1./(1+25*Ax(i+1)^2)
end
%Problem 2
for i = [0,1,2,3,4,5,6,7,8,9,10]
   Ax(i+1)=-cos((2*i+1)/22*pi)
   Ay(i+1)=1./(1+25*Ax(i+1)^2)
end
syms x
f1 = Ay(1).*(x-Ax(2)).*(x-Ax(3))/((Ax(1)-Ax(2))*(Ax(1)-Ax(3)))+Ay(2).*(x-Ax(1)).*(x-Ax(3))/((Ax(2)-Ax(1))*(Ax(2)-Ax(3)))+Ay(3).*(x-Ax(1)).*(x-Ax(2))/((Ax(3)-Ax(1))*(Ax(3)-Ax(2)))
f1 = collect(f1)
I1 = int(f1,x,-1,Ax(3))
f2 = Ay(4).*(x-Ax(5)).*(x-Ax(3))/((Ax(4)-Ax(5))*(Ax(4)-Ax(3)))+Ay(5).*(x-Ax(4)).*(x-Ax(3))/((Ax(5)-Ax(4))*(Ax(5)-Ax(3)))+Ay(3).*(x-Ax(4)).*(x-Ax(5))/((Ax(3)-Ax(4))*(Ax(3)-Ax(5)))
f2 = collect(f2)
I2 = int(f2,x,Ax(3),Ax(5))
f3 = Ay(7).*(x-Ax(5)).*(x-Ax(6))/((Ax(7)-Ax(5))*(Ax(7)-Ax(6)))+Ay(5).*(x-Ax(7)).*(x-Ax(6))/((Ax(5)-Ax(7))*(Ax(5)-Ax(6)))+Ay(6).*(x-Ax(7)).*(x-Ax(5))/((Ax(6)-Ax(7))*(Ax(6)-Ax(5)))
f3 = collect(f3)
I3 = int(f3,x,Ax(5),Ax(7))
f4 = Ay(7).*(x-Ax(8)).*(x-Ax(9))/((Ax(7)-Ax(8))*(Ax(7)-Ax(9)))+Ay(8).*(x-Ax(7)).*(x-Ax(9))/((Ax(8)-Ax(7))*(Ax(8)-Ax(9)))+Ay(9).*(x-Ax(7)).*(x-Ax(8))/((Ax(9)-Ax(7))*(Ax(9)-Ax(8)))
f4 = collect(f4)
I4 = int(f4,x,Ax(7),Ax(9))
f5 = Ay(10).*(x-Ax(11)).*(x-Ax(9))/((Ax(10)-Ax(11))*(Ax(10)-Ax(9)))+Ay(11).*(x-Ax(10)).*(x-Ax(9))/((Ax(11)-Ax(10))*(Ax(11)-Ax(9)))+Ay(9).*(x-Ax(10)).*(x-Ax(11))/((Ax(9)-Ax(10))*(Ax(9)-Ax(11)))
f5 = collect(f5)
I5 = int(f5,x,Ax(9),1.0)
I  = I1+I2+I3+I4+I5