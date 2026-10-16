function y = backSubst(L,b,k)
    % Backward substitution
    [m,n]=size(L);
    if ~exist('k')  % If first call no k param given, but k=1
        k=n;
    end
    
    y=b(k)/L(k,k);
    if k > 1 % Recursion step
        l = [L(1:k-1,k);zeros(n-k+1,1)];
        y = [backSubst(L,b-y*l,k-1);y];
    end
end