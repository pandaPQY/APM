
      call grid
      end


      subroutine grid
      implicit none
      include 'relaxgl.fi'

      real u(1,ng1,ng2,ng3), def(ng1,ng2,ng3), tmp(ng1,ng2,ng3)
     &     ,defp(ng1,ng2,ng3),phi(ng1,ng2,ng3), tmp2(ng1+2,ng2,ng3)
      real*4 tmp4(ng1,ng2,ng3)
      integer i

      u=0

      open(10,file='cube.dat',access='stream')
      read(10) tmp4
      u(1,:,:,:)=tmp4+1

      write(*,*) sum(u)
      def=0
      do i=1,10
         call calcdefp(defp,tmp,tmp2,def,u,1.,1.,1)
         def=def+defp
      enddo

      end
