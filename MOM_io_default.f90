submodule (MOM_io) MOM_io_mesg
  implicit none
contains  
  module subroutine MOM_mesg(mesg)
    character(len=*), intent(in) :: mesg
    print *, mesg
  end subroutine
end submodule MOM_io_mesg
