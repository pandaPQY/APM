Here's the steps to give the figure of curviliant coordinate:

    1. give the right ng in "dim.gh" and "presmoothing.f90"
    2. source do_it_list  (to MAKEFILE)
    3. give the right ng in "gridfigure.f90" and use it to give newposition.dat
    4. use "CurviliantCoordinate.m" in MATLAB to give the figure of curviliant coordinate

Tips:

    If openmp, should channg ulimit in .bashrc


The condition so far is:

    Can give good result of ng=64 and ng=128, but in case of ng=256 and ng=512, relaxation diverged.
    The density field of ng=512 given by N-Body simulation has vacum grid point.


by Qiaoyin Pan
