program gridfigure

  implicit none


  integer,parameter :: nf
  real def(nf,nf,nf)
  real dispdef(3,nf,nf,nf)
  real temposition(3,nf,nf,nf)
  real newposition(nf,nf,nf)
  integer i,j,k
  open(01, 'def.dat', access=='stream')

  do k=1,ng
  do j=1,ng
  do i=1,ng
    read(01) def(i,j,k)
  enddo
  enddo
  enddo
  close(01)

  do k=1,ng
  do j=1,ng
  do i=1,ng
    temposition(1,i,j,k)=i
    temposition(2,i,j,k)=j
    temposition(3,i,j,k)=k    
    dispdef(1,i,j,k)=-def(mod(i,nf)+1,j,k)+def(i,j,k)
    dispdef(2,i,j,k)=-def(i,mod(j,nf)+1,k)+def(i,j,k)
    dispdef(3,i,j,k)=-def(i,j,mod(k,nf)+1)+def(i,j,k)
    newposition(i,j,k)=dispdef(1,i,j,k)=def(mod(i,nf)+1,j,k)-def(i,j,k)


  enddo
  enddo
  enddo

