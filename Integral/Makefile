#f90=pgfortran
#f90=pgf90
#f90=/opt/mpich2/ch3_nemesis_tcp-pgi90/bin/mpif90
# f90=mpif90
#copt=-O3 -Mvect=sse -Mlarge_arrays
#copt=-g
#copt=-g -Mbounds -Mchkptr 
# OPTIONS: For gfortran
f90=gfortran
copt=-Ofast -ffree-line-length-none -fopenmp -fdefault-real-8
#copt=-fbounds-check -ffree-line-length-none
#copt=-O3 -ffree-line-length-none
objects=NA.o
modules=mod.o
NA:    $(objects) 
	$(f90) $(copt) -o NA   \
        $(objects) $(modules)
mod.o:  mod.f90  
	$(f90) $(copt) -c  mod.f90
NA.o:  NA.f90 $(modules) 
	$(f90) $(copt) -c  NA.f90
clean:
	rm -f *.o
	rm -f *.mod
	rm -f NA  
clear:
	rm -f *.o
	rm -f *.mod
