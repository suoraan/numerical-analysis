program NA
	use para
	open(unit=11, file="solution.txt")
	print *,"input 1, if nomal iretation;"
	print *,"input 2; if erfenfa;"
	print *,"input 3; if gauss;"
	print *,"input 4; if gauss liezhuyuansu;"
	print *,"input 5; if gauss-seidel diedai;"
	print *,"input 6; if jacobi diedai;"
	print *,"input 7; if SOR;"
	print *,"please input the problem type:"
	read *,typ
	if ( typ==1 ) then
		allocate(x(20))
		x(1) = 0
		!x(2) = 1.9
		do i = 1, 20
			x(i+1) = (2-e**x(i))/10
			print "(a,I2,a,F20.8)", "x",i,"=",x(i)
		end do	
	elseif( typ==2 ) then
		allocate(x(20))
		x1=0
		print "(a,I2,a,F20.8)", "x",1,"=",x1
		x2=1
		!print *, "x",2,"=",x2
		do i = 2, 20
			f1=e**x1+10*x1-2
			f2= e**x2+10*x2-2
			m=(x1+x2)/2.
			f= e**m+10*m-2
			if(f1*f<0) then
				x2 = m
			elseif(f2*f<0) then
				x1 = m
			end if	
			print "(a,I2,a,F20.8)", "x",i,"=",m
		end do
	elseif( typ==3 .or. typ==4) then
		print *,"please input the number of x, and the number of equation:"
		read *,nx,ne
		allocate(matrix(ne,nx+1))
		allocate(temp(ne,nx+1))
		allocate(x(nx))
		print *,"please input the parameters line by line(involving b):"
		do i = 1, ne
			read *,(matrix(i,j),j=1,nx+1)
		end do
		print *,"please check the problem:"
		do i = 1, ne
			do j = 1,nx
				print "(F10.5,x,a,I1,$)", matrix(i,j),"x",j			
			end do
			print "(x,a,F10.5)","=",matrix(i,nx+1)		
		end do
		print *,"if it is correct?  Y/N"
		read *,r
		if ( r=="N" ) then
			stop "please open the code again"
		end if
		write(11,"(a)") "the ordinary problem is :"
		do i = 1, ne
			do j = 1,nx
				write(11, "(F10.5,x,a,I1,$)") matrix(i,j),"x",j			
			end do
			write(11, "(x,a,F10.5)")"=",matrix(i,nx+1)		
		end do
		write(11,*) " "

		do i = 1, nx+1
			do j = 1,ne
				temp(j,i) = matrix(j,i)				
			end do
		end do
		do k =1,ne-1
			write(11, "(I1,a)")k,"th elimination, the problem seems like:"
			if ( typ == 4 ) then
				max = matrix(k,k)
				ik = k
				do j =k,ne
					if ( abs(matrix(j,k))>abs(max) ) then
						max = matrix(j,k)
						ik = j
					end if
				end do
				do j = k,nx+1
					matrix(k,j) = temp(ik,j)
					matrix(ik,j) = temp(k,j)
					temp(k,j) = matrix(k,j)
					temp(ik,j) = matrix(ik,j)
				end do				
			end if

			do i = k+1,ne
				do j =1, nx+1
					matrix(i,j) = matrix(i,j)-(temp(i,k)*temp(k,j))/temp(k,k)
				end do
			end do
			do i = 1, ne
				do j = 1,nx
					write(11, "(F10.5,x,a,I1,$)") matrix(i,j),"x",j			
				end do
				write(11, "(x,a,F10.5)")"=",matrix(i,nx+1)		
			end do
			write(11,"(a)") " "
			do i = 1, nx+1
				do j = 1,ne
					temp(j,i) = matrix(j,i)				
				end do
			end do			
		end do
		x(nx) = matrix(ne,nx+1)/matrix(ne,nx)
		
		do k = ne-1,1,-1
			sum = 0
			do i = k+1,ne
				sum = sum + (matrix(k,i)*x(i))			
			end do
			x(k) = (matrix(k,nx+1)-sum)/matrix(k,k)
		end do
		write(11,"(a)") "the solution of the problem is as follows:"
		do i = 1,nx
			write(11, "(a,I2,2x,a,F8.4)") "x",i,"=",x(i)
		end do
	elseif(typ==5) then
		print *,"please input the number of x, and the number of equation:"
		read *,nx,ne
		allocate(matrix(ne,nx+1))
		allocate(tempx(nx))
		allocate(x(nx))
		x(:)=1
		tempx(:)=1
		print *,"please input the parameters line by line(involving b):"
		do i = 1, ne
			read *,(matrix(i,j),j=1,nx+1)
		end do
		print *,"please check the problem:"
		do i = 1, ne
			do j = 1,nx
				print "(F10.5,x,a,I1,$)", matrix(i,j),"x",j			
			end do
			print "(x,a,F10.5)","=",matrix(i,nx+1)		
		end do
		print *,"if it is correct?  Y/N"
		read *,r
		if ( r=="N" ) then
			stop "please open the code again"
		end if	
		write(11,"(a)") "the ordinary problem is :"
		do i = 1, ne
			do j = 1,nx
				write(11, "(F10.5,x,a,I1,$)") matrix(i,j),"x",j			
			end do
			write(11, "(x,a,F10.5)")"=",matrix(i,nx+1)		
		end do
		write(11,*) " "
		do while(nn < nx)
			do i = 1, nx
				sum=0
				do j =1,nx
					if ( i==j ) then
						cycle
					end if
					sum = sum+matrix(i,j)*x(j)					
				end do
				x(i)=(matrix(i,nx+1)-sum)/matrix(i,i)
			end do
			nn=0
			do i = 1, nx
				if ( abs(x(i)-tempx(i))<0.0001 ) then
					nn=nn+1
				end if
			end do
			print "(2X,a,2F10.6,a)","x=(",(x(i),i=1,nx),")T"

			do i = 1, nx
				tempx(i)=x(i)
			end do
		end do
	elseif(typ==6) then
		print *,"please input the number of x, and the number of equation:"
		read *,nx,ne
		allocate(matrix(ne,nx+1))
		allocate(tempx(nx))
		allocate(x(nx))
		x(:)=1
		tempx(:)=1
		print *,"please input the parameters line by line(involving b):"
		do i = 1, ne
			read *,(matrix(i,j),j=1,nx+1)
		end do
		print *,"please check the problem:"
		do i = 1, ne
			do j = 1,nx
				print "(F10.5,x,a,I1,$)", matrix(i,j),"x",j			
			end do
			print "(x,a,F10.5)","=",matrix(i,nx+1)		
		end do
		print *,"if it is correct?  Y/N"
		read *,r
		if ( r=="N" ) then
			stop "please open the code again"
		end if	
		write(11,"(a)") "the ordinary problem is :"
		do i = 1, ne
			do j = 1,nx
				write(11, "(F10.5,x,a,I1,$)") matrix(i,j),"x",j			
			end do
			write(11, "(x,a,F10.5)")"=",matrix(i,nx+1)		
		end do
		write(11,*) " "
		do while(nn < nx)
			do i = 1, nx
				sum=0
				do j =1,nx
					if ( i==j ) then
						cycle
					end if
					sum = sum+matrix(i,j)*tempx(j)					
				end do
				x(i)=(matrix(i,nx+1)-sum)/matrix(i,i)
			end do
			nn=0
			do i = 1, nx
				if ( abs(x(i)-tempx(i))<0.0001 ) then
					nn=nn+1
				end if
			end do
			print "(a,3F10.6,a)","x=(",(x(i),i=1,nx),")T"

			do i = 1, nx
				tempx(i)=x(i)
			end do
		end do		
	elseif(typ==7) then
		print *,"please input the number of x, and the number of equation:"
		read *,nx,ne
		allocate(matrix(ne,nx+1))
		print *,"please input w"
		read *,m
		allocate(tempx(nx))
		allocate(x(nx))
		allocate(xx(nx))
		x(:)=1
		tempx(:)=1
		print *,"please input the parameters line by line(involving b):"
		do i = 1, ne
			read *,(matrix(i,j),j=1,nx+1)
		end do
		print *,"please check the problem:"
		do i = 1, ne
			do j = 1,nx
				print "(F10.5,x,a,I1,$)", matrix(i,j),"x",j			
			end do
			print "(x,a,F10.5)","=",matrix(i,nx+1)		
		end do
		print *,"if it is correct?  Y/N"
		read *,r
		if ( r=="N" ) then
			stop "please open the code again"
		end if	
		write(11,"(a)") "the ordinary problem is :"
		do i = 1, ne
			do j = 1,nx
				write(11, "(F10.5,x,a,I1,$)") matrix(i,j),"x",j			
			end do
			write(11, "(x,a,F10.5)")"=",matrix(i,nx+1)		
		end do
		write(11,*) " "
		ik=0
		xx(1)=0.5
		xx(2)=1
		xx(3)=-0.5
		do while(nn < nx)
			ik=ik+1
			do i = 1, nx
				sum=0
				do j =1,nx
					if ( i==j ) then
						cycle
					end if
					sum = sum+matrix(i,j)*x(j)					
				end do
				x(i) = (1-m)*x(i)+m*((matrix(i,nx+1)-sum)/matrix(i,i))
				!x(i)=(matrix(i,nx+1)-sum)/matrix(i,i)
			end do
			nn=0
			do i = 1, nx
				if ( abs(x(i)-xx(i))<0.000005 ) then
					nn=nn+1
				end if
			end do
			print "(2X,1I2,a,3F10.6,a)",ik,"th,x=(",(x(i),i=1,nx),")T"
			do i = 1, nx
				tempx(i)=x(i)
			end do
		end do		
	end if
	print *,"  done"
end program NA
