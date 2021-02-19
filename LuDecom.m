function [x] = LuDecom(a, b, n, tol)
    x = transpose(1:n);
    [a, err, o] = Decompose(a, n, tol);
    
    if err ~= -1
        x = transpose(Substitute(a, o, n, b));
    end
end
