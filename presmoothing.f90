program presmoothing

  implicit none

  integer,parameter :: n_coarse=0,n_fine=2,ng=64
  integer,parameter :: n_final=ng/2**n_coarse*2**n_fine
  integer nf,nc,coarse,fine
  real den(ng,ng,ng),den_final(n_final,n_final,n_final),tmpden(n_final,n_final,n_final)
  character(len=3) input,output
  den_final=0
  tmpden=0
  write(input,'(i3)') ng
  print*, " input: ng = ",input
  print*,n_final
  open(10,file='delta_100Mpc_'//trim(adjustl(input))//'.dat',access='stream')
     read(10) den
  close(10)
  
  nc=ng
     do coarse=1,n_coarse
        nc=nc/2
        call coarse_grid(den,nc)
        write(output,'(i3)') nc
        print*, 'coarse the ',coarse,' time, ng=',trim(adjustl(output))
     enddo

     nf=nc
     tmpden(1:nf,1:nf,1:nf)=den
     do fine=1,n_fine
        nf=2*nf
        call fine_grid(tmpden(1:nf/2,1:nf/2,1:nf/2),den_final(1:nf,1:nf,1:nf),nf)
        tmpden(1:nf,1:nf,1:nf)=den_final(1:nf,1:nf,1:nf)
        write(output,'(i3)') nf
        print*, '  fine the ',fine,' time, ng=',trim(adjustl(output))
     enddo



  open(12,file='cube_fine.dat',status='replace',access='stream')
  if (n_fine>0) then
     write(12) den_final
     print*,'size of the output: ',size(den_final)
  else
     write(12) den(1:nc,1:nc,1:nc)
     print*,'size of the output; ',size(den(1:nc,1:nc,1:nc))
  endif  
  close(12)
  
  print*, "output: ng = ",output
end

subroutine coarse_grid(den,nc)
  integer nc
  real den(2*nc,2*nc,2*nc), den_c(nc,nc,nc)
  integer i,j,k
  do k=1,nc
  do j=1,nc
  do i=1,nc
     den(i,j,k)=sum(den(2*i-1:2*i,2*j-1:2*j,2*k-1:2*k))/8
  enddo
  enddo
  enddo
endsubroutine coarse_grid

subroutine fine_grid(den,den_f,nf)
  integer nf
  real den(nf/2,nf/2,nf/2),den_f(nf,nf,nf)
    den_f(::2,::2,::2)=den
    den_f(2::2,::2,::2)=1./2*(den_f(::2,::2,::2)+cshift(den_f(::2,::2,::2),1,1))
    den_f(:,2::2,::2)=1./2*(den_f(:,::2,::2)+cshift(den_f(:,::2,::2),1,2))
    den_f(:,:,2::2)=1./2*(den_f(:,:,::2)+cshift(den_f(:,:,::2),1,3))
endsubroutine fine_grid
