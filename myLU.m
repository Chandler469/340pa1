function [L, U] = myLU(A)
    n = width(A);
    L = eye(n);
    U = A;
    for k = 1:n
        [M_k, L_k] = elimMat(U, k);
        U = M_k * U;
        L = L * L_k;
    end
end