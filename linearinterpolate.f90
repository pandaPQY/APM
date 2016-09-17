program linearinterpolate
! linear interpolate the density field form ng=32 to ng=64
  implicit none

  integer,parameter :: ng=128

  integer,parameter :: nf=ng*2
  real den(ng,ng,ng)
  real den_f(nf,nf,nf)
  integer i,j,k

  open(11,file='cube_corse.dat',access='stream')

  do k=1,ng
  do j=1,ng
  do i=1,ng
    read(11) den(i,j,k)
  enddo
  enddo
  enddo
  close(11)

  do k=1,ng
  do j=1,ng
  do i=1,ng

    den_f(2*i-1,2*j-1,2*k-1)=den(i,j,k)
    den_f(2*i,2*j-1,2*k-1)=(den(i,j,k)+den(mod(i,ng)+1,j,k))/2
    den_f(2*i-1,2*j,2*k-1)=(den(i,j,k)+den(i,mod(j,ng)+1,k))/2
    den_f(2*i-1,2*j-1,2*k)=(den(i,j,k)+den(i,j,mod(k,ng)+1))/2
    den_f(2*i,2*j,2*k-1)=(den(i,j,k)+den(mod(i,ng)+1,j,k) &
                 +den(i,mod(j,ng)+1,k)+den(mod(i,ng)+1,mod(j,ng)+1,k))/4
    den_f(2*i,2*j-1,2*k)=(den(i,j,k)+den(mod(i,ng)+1,j,k) &
                 +den(i,j,mod(k,ng)+1)+den(mod(i,ng)+1,j,mod(k,ng)+1))/4
    den_f(2*i-1,2*j,2*k)=(den(i,j,k)+den(i,mod(j,ng)+1,k) &
                 +den(i,j,mod(k,ng)+1)+den(i,mod(j,ng)+1,mod(k,ng)+1))/4
    den_f(2*i,2*j,2*k)=(den(i,j,k)+den(mod(i,ng)+1,j,k)+den(i,mod(j,ng)+1,k) &
                 +den(i,j,mod(k,ng)+1)+den(i,mod(j,ng)+1,mod(k,ng)+1)       &
                 +den(mod(i,ng)+1,j,mod(k,ng)+1)+den(mod(i,ng)+1,mod(j,ng)+1,k)&
                 +den(mod(i,ng)+1,mod(j,ng)+1,mod(k,ng)+1))/8
  enddo
  enddo
  enddo

  open(12,file='cube_fine.dat',access='stream')
  write(12) den_f
  close(12)


end

           


