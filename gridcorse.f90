program gridcorse

  implicit none

  integer,parameter :: ng=256
  integer,parameter :: nc=ng/2
  integer,parameter :: ncc=nc/2
  integer  i,j,k,ic,jc,kc
  integer  icc,jcc,kcc
  real  den(ng,ng,ng)
  real cube_corse(nc,nc,nc)  
  real cube_ccorse(ncc,ncc,ncc)

  open(10,file="delta_cdm.dat",access="stream")
     read(10) den
  close(10)

  do kc=1,nc
  do jc=1,nc
  do ic=1,nc
     cube_corse(ic,jc,kc)=1.0/8.0*(den(2*ic-1,2*jc-1,2*kc-1)+den(2*ic,2*jc-1,2*kc-1)+den(2*ic-1,2*jc,2*kc-1)   &
                              +den(2*ic-1,2*jc-1,2*kc)+ den(2*ic,2*jc,2*kc-1)+den(2*ic,2*jc-1,2*kc)        &
                              +den(2*ic-1,2*jc,2*kc)+den(2*ic,2*jc,2*kc))
  enddo
  enddo
  enddo

  do kcc=1,ncc
  do jcc=1,ncc
  do icc=1,ncc
     cube_ccorse(icc,jcc,kcc)=1.0/8.0*(cube_corse(2*icc-1,2*jcc-1,2*kcc-1)+cube_corse(2*icc,2*jcc-1,2*kcc-1)+       &
                                       cube_corse(2*icc-1,2*jcc,2*kcc-1)+cube_corse(2*icc-1,2*jcc-1,2*kcc)+         &
                                       cube_corse(2*icc,2*jcc,2*kcc-1)+cube_corse(2*icc,2*jcc-1,2*kcc)+             &
                                     cube_corse(2*icc-1,2*jcc,2*kcc)+cube_corse(2*icc,2*jcc,2*kcc))
 enddo
 enddo
 enddo

  
  open(11,file="cube_ccorse.dat",access="stream")
  write(11) cube_ccorse
!  open(11,file="cube_corse.dat",access="stream")
!  write(11) cube_corse
  close(11)

  print*, den(256,256,256),cube_corse(128,128,128),nc,ng,i,j,k,ic,jc,kc

end
