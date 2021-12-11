module para
	real :: inputx,a,b,result,er
	integer :: typecode,n,m=1,k=0
	real,dimension(:,:),allocatable :: T

contains
	function fx(x)
		Implicit None
		real :: fx,x
		!fx=x/(4+x**2)
		fx=2.718281828459**(-x)
	end function fx
end module para

