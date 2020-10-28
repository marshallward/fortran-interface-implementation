module MOM_io
  implicit none
  interface
    module subroutine MOM_mesg(mesg)
      character(len=*), intent(in) :: mesg
    end subroutine MOM_mesg
  end interface
end module MOM_io
