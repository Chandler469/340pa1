function [M_K, L_K] = elimMat(A, k)
    M_K = eye(size(A, 1));
    L_K = eye(size(A, 1));
    M_K(k+1:end, k) = -A(k+1:end, k) / A(k, k);
    L_K(k+1:end, k) = A(k+1:end, k) / A(k, k);
end