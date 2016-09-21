program smooth

  implicit none

  integer,parameter :: ng=256
  real den(ng,ng,ng)
  real dennew(ng,ng,ng)
  integer i,j,k
  integer ip,jp,kp,ib,jb,kb
  open(22,file="cube_fine.dat",access="stream")
  read(22) den
  close(22)

  do k=1,ng
  do j=1,ng
  do i=1,ng
     ip=mod(i-2,ng)+1
     jp=mod(j-2,ng)+1
     kp=mod(k-2,ng)+1
     ib=mod(i,ng)+1
     jb=mod(j,ng)+1
     kb=mod(k,ng)+1
     dennew(i,j,k)=1.0/27.0*(den(ip,jp,kp)+den(ip,jp,k)+den(ip,jp,kb)+den(ip,j,kp)+den(ip,j,k)+den(ip,j,kb)+      &
                             den(ip,jb,kp)+den(ip,jb,k)+den(ip,jb,kb)+den(i,jp,kp)+den(i,jp,k)+den(i,jp,kb)+      &
                             den(i,j,kp)+den(i,j,k)+den(i,j,kb)+den(i,jb,kp)+den(i,jb,k)+den(i,jb,kb)+            &
                             den(ib,jp,kp)+den(ib,jp,k)+den(ib,jp,kb)+den(ib,j,kp)+den(ib,j,k)+den(ib,j,kb)+      &
                             den(ib,jb,kp)+den(ib,jb,k)+den(ib,jb,kb))
  enddo
  enddo
  enddo
 
  open(22,file="cube_ffine.dat",access="stream")
  write(22) dennew
  close(22)




end
