all: test_fms test_default

MPIFC = mpifort
FMS_INCLUDE = deps/include
FMS_LIB = deps/lib

test_fms: itest.o MOM_io.o MOM_io_fms.o
	$(MPIFC) -L$(FMS_LIB) -o $@ $^ -lFMS

test_default: itest.o MOM_io.o MOM_io_default.o
	gfortran -o $@ $^

# Actual dep is MOM_io.mod
itest.o: itest.f90 MOM_io.o
	gfortran -c -o $@ $<

MOM_io.o: MOM_io.f90
	gfortran -c -o $@ $<

# Actual dep is MOM_io.smod?
MOM_io_fms.o: MOM_io_fms.f90 MOM_io.o
	gfortran -I$(FMS_INCLUDE) -o $@ -c $<

# Ditto here
MOM_io_default.o: MOM_io_default.f90 MOM_io.o
	gfortran -o $@ -c $<

clean:
	rm -f *.o *.mod *.smod test_default test_fms 
