program gridfigure

  implicit none


  integer,parameter :: nf=64
  real def(nf,nf,nf)
  real dispdef(3,nf,nf,nf)

  real newposition(3,nf,nf,nf)
  integer i,j,k,ip,jp,kp  

  open(15,file='def.dat', access='stream')

  do k=1,nf
  do j=1,nf
  do i=1,nf
    read(15) def(i,j,k)
  enddo
  enddo
  enddo
  close(15)

  do k=1,nf
  do j=1,nf
  do i=1,nf
    ip=mod(i,nf)+1
    jp=mod(j,nf)+1
    kp=mod(k,nf)+1 
    dispdef(1,i,j,k)=1./4.*(def(ip,j,k)-def(i,j,k)+def(ip,jp,k)-def(i,jp,k)+def(ip,j,kp)-def(i,j,kp)+def(ip,jp,kp)-def(i,jp,kp))
    dispdef(2,i,j,k)=1./4.*(def(i,jp,k)-def(i,j,k)+def(ip,jp,k)-def(ip,j,k)+def(i,jp,kp)-def(i,j,kp)+def(ip,jp,kp)-def(ip,j,kp))
    dispdef(3,i,j,k)=1./4.*(def(i,j,kp)-def(i,j,k)+def(ip,j,kp)-def(ip,j,k)+def(i,jp,kp)-def(i,jp,k)+def(ip,jp,kp)-def(ip,jp,k))
    newposition(1,i,j,k)=i+0.5+dispdef(1,i,j,k)
    newposition(2,i,j,k)=j+0.5+dispdef(2,i,j,k)
    newposition(3,i,j,k)=k+0.5+dispdef(3,i,j,k)
  enddo
  enddo
  enddo

  open(15,file='newposition.dat',access='stream')
  write(15) newposition
  close(15)
 
  open(15,file='dispdef.dat',access='stream')
  write(15) dispdef
  close(15)

  print*, newposition(:,20,20,20),dispdef(:,20,20,20),i,j,k,ip,jp,kp


end
