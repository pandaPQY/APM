


do istep = 1,nstep
 print*,'istep =',istep
 if (mod(istep,10)==0) then
   open(11,file='disp.dat',...
   write(11) data
   close(11)
  endif

enddo

