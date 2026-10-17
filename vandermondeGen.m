function A = vandermondeGen(t)
    % generate a Vandermonde matrix given a vector t
    n = length(t);
    t = t(:);
    A = t .^ (0:n-1);
end