program cube_cdm_256_new

  implicit none

  integer,parameter :: n=256

  real den(n**3)

  open(11,file='cube_fine.dat',access='stream')
  read(11) den
  close(11)
  
  den=den*0.9

  open(11,file='cube_fine.dat',access='stream')
  write(11) den
  close(11)

end
