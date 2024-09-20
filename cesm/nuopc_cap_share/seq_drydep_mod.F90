module seq_drydep_mod

  use shr_drydep_mod, only: seq_drydep_setHCoeff=>shr_drydep_setHCoeff
  implicit none

  ! method specification
  character(len=*), parameter :: DD_XLND = 'xactive_lnd' ! dry-dep land
  character(len=*), parameter :: drydep_method = DD_XLND ! XLND is the only option now
  logical, protected :: lnd_drydep

contains

  subroutine seq_drydep_readnl(NLFilename, drydep_nflds)

    character(len=*), intent(in)  :: NLFilename ! Namelist filename
    integer, intent(out)          :: drydep_nflds

! !rpf_CESM2_SLH
!     character(len=8) :: token   ! dry dep field name to add
! !   character(len=5) :: token   ! rpf: in cesm1 the string length was too long if using 8 characters and the cpl crashes due to drydep_list cutoff
! !rpf_CESM2_SLH

    call shr_drydep_readnl(NLFilename, drydep_nflds)

    lnd_drydep = drydep_nflds>0

! !rpf_CESM2_SLH
! 333 format ('Sl_dd',i3.3)
! ! 333 format ('Sdv',i2.2) ! rpf: in cesm1 the string length was too long if using 8 characters and the cpl crashes due to drydep_list cutoff
! !rpf_CESM2_SLH

  end subroutine seq_drydep_readnl

end module seq_drydep_mod
