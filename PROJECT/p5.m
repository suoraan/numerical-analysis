syms x;
for i = [0,1,2,3,4,5,6,7,8,9,10]
   %Ax(i+1)=-1+2./10.*i 
   %Ay(i+1)=1./(1+25*Ax(i+1)^2)
end
%Problem 2
for i = [0,1,2,3,4,5,6,7,8,9,10]
   Ax(i+1)=-cos((2*i+1)/22*pi)
   Ay(i+1)=1./(1+25*Ax(i+1)^2)
end
x=[-1:0.01:1]
f=Ay(1).*(x-Ax(2)).*(x-Ax(3)).*(x-Ax(4)).*(x-Ax(5)).*(x-Ax(6)).*(x-Ax(7)).*(x-Ax(8)).*(x-Ax(9)).*(x-Ax(10)).*(x-Ax(11))./((Ax(1)-Ax(2)).*(Ax(1)-Ax(3)).*(Ax(1)-Ax(4)).*(Ax(1)-Ax(5)).*(Ax(1)-Ax(6)).*(Ax(1)-Ax(7)).*(Ax(1)-Ax(8)).*(Ax(1)-Ax(9)).*(Ax(1)-Ax(10)).*(Ax(1)-Ax(11)))+Ay(2).*(x-Ax(1)).*(x-Ax(3)).*(x-Ax(4)).*(x-Ax(5)).*(x-Ax(6)).*(x-Ax(7)).*(x-Ax(8)).*(x-Ax(9)).*(x-Ax(10)).*(x-Ax(11))./((Ax(2)-Ax(1)).*(Ax(2)-Ax(3)).*(Ax(2)-Ax(4)).*(Ax(2)-Ax(5)).*(Ax(2)-Ax(6)).*(Ax(2)-Ax(7)).*(Ax(2)-Ax(8)).*(Ax(2)-Ax(9)).*(Ax(2)-Ax(10)).*(Ax(2)-Ax(11)))+Ay(3).*(x-Ax(1)).*(x-Ax(2)).*(x-Ax(4)).*(x-Ax(5)).*(x-Ax(6)).*(x-Ax(7)).*(x-Ax(8)).*(x-Ax(9)).*(x-Ax(10)).*(x-Ax(11))./((Ax(3)-Ax(1)).*(Ax(3)-Ax(2)).*(Ax(3)-Ax(4)).*(Ax(3)-Ax(5)).*(Ax(3)-Ax(6)).*(Ax(3)-Ax(7)).*(Ax(3)-Ax(8)).*(Ax(3)-Ax(9)).*(Ax(3)-Ax(10)).*(Ax(3)-Ax(11)))+Ay(4).*(x-Ax(1)).*(x-Ax(2)).*(x-Ax(3)).*(x-Ax(5)).*(x-Ax(6)).*(x-Ax(7)).*(x-Ax(8)).*(x-Ax(9)).*(x-Ax(10)).*(x-Ax(11))./((Ax(4)-Ax(1)).*(Ax(4)-Ax(2)).*(Ax(4)-Ax(3)).*(Ax(4)-Ax(5)).*(Ax(4)-Ax(6)).*(Ax(4)-Ax(7)).*(Ax(4)-Ax(8)).*(Ax(4)-Ax(9)).*(Ax(4)-Ax(10)).*(Ax(4)-Ax(11)))+Ay(5).*(x-Ax(1)).*(x-Ax(2)).*(x-Ax(3)).*(x-Ax(4)).*(x-Ax(6)).*(x-Ax(7)).*(x-Ax(8)).*(x-Ax(9)).*(x-Ax(10)).*(x-Ax(11))./((Ax(5)-Ax(1)).*(Ax(5)-Ax(2)).*(Ax(5)-Ax(3)).*(Ax(5)-Ax(4)).*(Ax(5)-Ax(6)).*(Ax(5)-Ax(7)).*(Ax(5)-Ax(8)).*(Ax(5)-Ax(9)).*(Ax(5)-Ax(10)).*(Ax(5)-Ax(11)))+Ay(6).*(x-Ax(1)).*(x-Ax(2)).*(x-Ax(3)).*(x-Ax(4)).*(x-Ax(5)).*(x-Ax(7)).*(x-Ax(8)).*(x-Ax(9)).*(x-Ax(10)).*(x-Ax(11))./((Ax(6)-Ax(1)).*(Ax(6)-Ax(2)).*(Ax(6)-Ax(3)).*(Ax(6)-Ax(4)).*(Ax(6)-Ax(5)).*(Ax(6)-Ax(7)).*(Ax(6)-Ax(8)).*(Ax(6)-Ax(9)).*(Ax(6)-Ax(10)).*(Ax(6)-Ax(11)))+Ay(7).*(x-Ax(1)).*(x-Ax(2)).*(x-Ax(3)).*(x-Ax(4)).*(x-Ax(5)).*(x-Ax(6)).*(x-Ax(8)).*(x-Ax(9)).*(x-Ax(10)).*(x-Ax(11))./((Ax(7)-Ax(1)).*(Ax(7)-Ax(2)).*(Ax(7)-Ax(3)).*(Ax(7)-Ax(4)).*(Ax(7)-Ax(5)).*(Ax(7)-Ax(6)).*(Ax(7)-Ax(8)).*(Ax(7)-Ax(9)).*(Ax(7)-Ax(10)).*(Ax(7)-Ax(11)))+Ay(8).*(x-Ax(1)).*(x-Ax(2)).*(x-Ax(3)).*(x-Ax(4)).*(x-Ax(5)).*(x-Ax(6)).*(x-Ax(7)).*(x-Ax(9)).*(x-Ax(10)).*(x-Ax(11))./((Ax(8)-Ax(1)).*(Ax(8)-Ax(2)).*(Ax(8)-Ax(3)).*(Ax(8)-Ax(4)).*(Ax(8)-Ax(5)).*(Ax(8)-Ax(6)).*(Ax(8)-Ax(7)).*(Ax(8)-Ax(9)).*(Ax(8)-Ax(10)).*(Ax(8)-Ax(11)))+Ay(9).*(x-Ax(1)).*(x-Ax(2)).*(x-Ax(3)).*(x-Ax(4)).*(x-Ax(5)).*(x-Ax(6)).*(x-Ax(7)).*(x-Ax(8)).*(x-Ax(10)).*(x-Ax(11))./((Ax(9)-Ax(1)).*(Ax(9)-Ax(2)).*(Ax(9)-Ax(3)).*(Ax(9)-Ax(4)).*(Ax(9)-Ax(5)).*(Ax(9)-Ax(6)).*(Ax(9)-Ax(7)).*(Ax(9)-Ax(8)).*(Ax(9)-Ax(10)).*(Ax(9)-Ax(11)))+Ay(10).*(x-Ax(1)).*(x-Ax(2)).*(x-Ax(3)).*(x-Ax(4)).*(x-Ax(5)).*(x-Ax(6)).*(x-Ax(7)).*(x-Ax(8)).*(x-Ax(9)).*(x-Ax(11))./((Ax(10)-Ax(1)).*(Ax(10)-Ax(2)).*(Ax(10)-Ax(3)).*(Ax(10)-Ax(4)).*(Ax(10)-Ax(5)).*(Ax(10)-Ax(6)).*(Ax(10)-Ax(7)).*(Ax(10)-Ax(8)).*(Ax(10)-Ax(9)).*(Ax(10)-Ax(11)))+Ay(11).*(x-Ax(1)).*(x-Ax(2)).*(x-Ax(3)).*(x-Ax(4)).*(x-Ax(5)).*(x-Ax(6)).*(x-Ax(7)).*(x-Ax(8)).*(x-Ax(9)).*(x-Ax(10))./((Ax(11)-Ax(1)).*(Ax(11)-Ax(2)).*(Ax(11)-Ax(3)).*(Ax(11)-Ax(4)).*(Ax(11)-Ax(5)).*(Ax(11)-Ax(6)).*(Ax(11)-Ax(7)).*(Ax(11)-Ax(8)).*(Ax(11)-Ax(9)).*(Ax(11)-Ax(10)))
plot(x,f,'r');hold on;
y = 1./(1+25*x.^2)
plot(x,y,'b');hold on;
e = f-y
plot(x,e,'g')
legend('????????????','?????????','??????')