function [x] = LuDecom(a, b, n, tol)
    if nargin < 4 || isempty(tol)
        tol = 0.001;
    end

    x = transpose(1:n);
    [a, err, o] = Decompose(a, n, tol);
    
    err = 1;
    if err ~= -1
        x = transpose(Substitute(a, o, n, b));
    end
end
