mx(1)=-2
may(1)=1/3
for i=1:39
    may(i+1)=(2+mx(i))/(2-mx(i))
    mx(i+1)=mx(i)+0.1
end
plot(mx,may)