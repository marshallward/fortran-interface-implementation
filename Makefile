FC = gfortran
MPIFC = mpifort
FMS_INCLUDE ?= deps/include
FMS_LIB ?= deps/lib

all: test_fms test_default

test_fms: itest.o MOM_io.o MOM_io_fms.o
	$(MPIFC) -L$(FMS_LIB) -o $@ $^ -lFMS

test_default: itest.o MOM_io.o MOM_io_default.o
	$(FC) -o $@ $^

# Actual dep is MOM_io.mod
itest.o: itest.f90 MOM_io.o
	$(FC) -c -o $@ $<

MOM_io.o: MOM_io.f90
	$(FC) -c -o $@ $<

# Actual dep is MOM_io.smod?
MOM_io_fms.o: MOM_io_fms.f90 MOM_io.o
	$(FC) -I$(FMS_INCLUDE) -o $@ -c $<

# Ditto here
MOM_io_default.o: MOM_io_default.f90 MOM_io.o
	$(FC) -o $@ -c $<

clean:
	rm -f *.o *.mod *.smod test_default test_fms 
