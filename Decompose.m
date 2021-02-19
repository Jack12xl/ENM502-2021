function[a, err, o] = Decompose(a, n, tol)
%% TODO how s work
    o = linspace(1, n, n);
    s = max(abs(a));                                                    
%    TODO 
    err = 1;
     
    for k = 1:n-1
        o = Pivot(a, o, s, n, k);
        if abs(a(o(k),k)/s(o(k))) < tol
            err = -1;
            disp(a(o(k),k)/s(o(k)));
            break;
            
        end
        for i = k+1:n
            factor = a(o(i),k)/a(o(k),k);
            a(o(i), k) = factor;
            for j = k+1:n
                a(o(i),j) = a(o(i),j) - factor * a(o(k),j);
            end
        end
    end
    
    if abs(a(o(k),k)/s(o(k))) < tol
        err = -1;
        disp(a(o(k),k)/s(o(k)));
        
    end
end