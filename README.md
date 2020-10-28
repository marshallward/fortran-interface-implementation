Proposal for supporting multiple FMS-like frameworks
====================================================

Usage
-----

Build the generic non-FMS program:
```
make test_default
./test_default
```

Build the FMS library and the FMS-based program:
```
cd deps
FCFLAGS="-g -O0" make -j
cd ..
make test_fms
./test_fms
```

Quick explanation
-----------------

Both builds use `MOM_mesg` inside the `MOM_io` module to print a message.

MOM_mesg is described in a module which only contains its interface.  There is
only an implicit reference to submodules, where the function would be
implemented.  

Two implementations of `MOM_mesg` are provided, each in a separate file and
each containing one submodule.

The generic build implements `MOM_mesg` in a different submodule,
using Fortran `print` statements, and does not require any references to FMS.

The FMS build implements this in one submodule using mpp_error, an FMS
function.  This build requires an explicit access to the FMS library and its
modules.

These two submodules are incompatible, so would be selected at build time, e.g.
autoconf or mkmf.

Additional implementations could be provided, and we would not need to support
or even know about them.


FMS issues
----------
I don't give any instructions here on building FMS.  It assumes that the
library is in `deps/lib` and that the relevant modfiles are in `deps/include`.

I just copied `deps` from the MOM6 repository (`ac/deps`) and ran `make -j` so
that should probably work if you want to test it out.

(`FCFLAGS="-g -O0" make -j` will probably speed things up.)

Also note that FMS-based models require a `input.nml` file.  An empty one
should be sufficient.