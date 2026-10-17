A = [1 2 2 ; 4 4 2 ; 4 6 4];
b = [3 ; 6 ; 10];
[L, U] = myLU(A);
y = fwdSubst(L, b);
x = backSubst(U, y) % obtained x = [ -1 ; 3 ; -1 ], which is the solution