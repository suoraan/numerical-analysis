program Integral
	use para
	open(unit=11, file="solution.txt")
	print *,"input 1 for 复化梯形;"
	print *,"input 2 for Simpson;"
	print *,"input 3 for Romberg;"
	read *,typecode
	if ( typecode==1 ) then
		print *,"input the n,a,b:   n for number of segments;a,b are integral limit (a,b)"
		read *, n,a,b		
		result = 0.
		write(11,"(a)") "复化梯形:"
		write(11,"(a,I2,a)") "T",n,"(x)"
		write(11,"(a,$)") "="
		write(11,"(a,F6.4,A,F3.1,A,$)") "0.5*",(b-a)/n,"*[f(",a,")+2("
		do i = 1, n-1
			write(11,"(a,F6.4,A,$)") "+f(",a+i*(b-a)/n,")"
		end do
		write(11,"(a,F3.1,a)") ")+f(",b,")]"

		write(11,"(a,$)") "="
		write(11,"(a,F6.4,A,F3.1,A,$)") "1/2*",(b-a)/n,"*[",fx(a),"+2("
		result = result+fx(a)
		do i = 1, n-1
			write(11,"(a,F6.4,$)") "+",fx(a+i*(b-a)/n)
			result = result + 2*fx(a+i*(b-a)/n)
		end do
		write(11,"(a,F3.1,a)") ")+",fx(b),"]"
		result = result+fx(b)
		result = result*0.5*(b-a)/n
		write(11,"(a,F10.6)") "=",result
	elseif( typecode==2 )then
		print *,"input the n,a,b:   n for number of segments;a,b are integral limit (a,b)"
		read *, n,a,b		
		result = 0.
		write(11,"(a)") "Simpson:"
		write(11,"(a,I2,a)") "S",n,"(x)"
		write(11,"(a,$)") "="
		write(11,"(a,F6.4,A,F3.1,A,$)") "1/6*",(b-a)/n,"*[f(",a,")+2("
		do i = 1, n-1
			write(11,"(a,F6.4,A,$)") "+f(",a+i*(b-a)/n,")"
		end do
		write(11,"(a,$)") ")+4*("
		do i = 0, n-1
			write(11,"(a,F6.4,A,$)") "+f(",a+(i+0.5)*(b-a)/n,")"
		end do
		write(11,"(a,F3.1,a)") ")+f(",b,")]"

		write(11,"(a,$)") "="
		write(11,"(a,F6.4,A,F3.1,A,$)") "1/6*",(b-a)/n,"*[",fx(a),"+2("
		result = result +fx(a)
		do i = 1, n-1
			write(11,"(a,F6.4,$)") "+",fx(a+i*(b-a)/n)
			result = result +2*fx(a+i*(b-a)/n)
		end do
		write(11,"(a,$)") ")+4*("
		do i = 0, n-1
			write(11,"(a,F6.4,$)") "+",fx(a+3*i*(b-a)/n/2.0)
			result = result +4*fx(a+(i+0.5)*(b-a)/n)
		end do
		write(11,"(a,F3.1,a)") ")+",fx(b),"]"
		result = result+fx(b)
		result = result*(b-a)/n/6.
		write(11,"(a,F10.6)") "=",result
	elseif( typecode==3 )then
		print *,"input the integral limit a and b, and error limit:"
		read *,a,b,er
		write(11,"(A)") "Romberg:"
		allocate(T(20,20))
		T(:,:)=0.
		do k = 1,20
			T(m,k) = T(m,k)+fx(a)
			do i = 1, 2**(k-1)-1
				T(m,k) = T(m,k) + 2*fx(a+i*(b-a)/(2**(k-1)))
			end do
			T(m,k) = T(m,k)+fx(b)
			T(m,k) = T(m,k)*0.5*(b-a)/(2**(k-1))
			write(11,"(a,I2,a,I2,a,f10.7,$)") "T(",m,",",k,")=",T(m,k)
			do i = 2,k
				T(i,m+k-i)=4**(i-1)*T(i-1,m+k-i+1)/(4**(i-1)-1)-T(i-1,m+k-i)/(4**(i-1)-1)
				write(11,"(a,I2,a,I2,a,f10.7,$)") "  T(",i,",",m+k-i,")=",T(i,m+k-i)
			end do
			if ( k>1 .and. abs(T(k,1)-T(k-1,2))<er ) then
				exit	
			end if	
			write(11,*) " "		
		end do	
	end if
	print *,"done"
end program Integral
