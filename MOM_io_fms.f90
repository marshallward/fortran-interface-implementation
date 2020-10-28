submodule (MOM_io) MOM_io_mesg
  use mpp_mod, only : mpp_error, mpp_init
  implicit none
contains  
  module subroutine MOM_mesg(mesg)
    character(len=*), intent(in) :: mesg

    call mpp_init
    call mpp_error(0, mesg)
  end subroutine
end submodule MOM_io_mesg
