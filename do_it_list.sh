rm -f a.out
f95 presmoothing.f90 && ./a.out
make clean && make
time ./relaxing.x

#make
#gdb ./relaxing.x
#run
