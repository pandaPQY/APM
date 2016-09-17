
      call grid
      end


      subroutine grid
      implicit none
      include 'relaxgl.fi'
      include 'globalpa.fi'

      real u(nstore,ng1,ng2,ng3), def(ng1,ng2,ng3), tmp(ng1,ng2,ng3)
     &     ,defp(ng1,ng2,ng3),phi(ng1,ng2,ng3), tmp2(ng1+2,ng2,ng3)
      real*4 tmp4(ng1,ng2,ng3)
      integer i

      u=0
      compressmax=10

      !open(10,file='cube_corse.dat',status="old",access='stream')
      open(10,file='cube_fine.dat',status="old",access='stream')

      read(10) tmp4
      write(*,*) maxval(tmp4),minval(tmp4)
      u(1,:,:,:)=tmp4+1

      write(*,*) sum(u)
      def=0
      do i=1,100
         call calcdefp(defp,tmp,tmp2,def,u,1.,1.,5)
         def=def+defp
         call relaxing(u,def,defp,1.,1.,5)
    
  
      enddo

			tmp4=def
      open(10,file='def.dat',access='stream')
      write(10) tmp4
			tmp4=u(1,:,:,:)
      open(10,file='rhorg.dat',access='stream')
      write(10) tmp4
      

      end
