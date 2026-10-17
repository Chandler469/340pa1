t = [-1.0 -0.5 0.0 0.5 1.0];
A = vandermondeGen(t);
y = [1.0 0.5 0.0 0.5 2.0];
[Q, R] = qr(A)
x = backSubst(R, transpose(Q))