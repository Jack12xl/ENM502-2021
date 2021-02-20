function[] = Q3_b(n, dim, alpha)
    if nargin < 3 || isempty(alpha)
        alpha = 2;
    end
    assert(dim == 1 || dim == 2);
    assert(n >= 2);

    num_e = power(n, dim);
    [A, b] = DiffusionBVP(n, alpha, dim);
    res = LuDecom(A, b, num_e, 0.001);
    %         res = A \ b;
    
%% Visualize
    figure()
    if dim == 2
%% dim == 2
        T = reshape(res, n, n);
        contourf(T)
        colorbar
        title_str = sprintf('%d x %d Grid', n, n);
        title(title_str);
    else
%% dim == 1
        T = res;
        plot(T);
        title_str = sprintf('%d Grid', n);
        title(title_str);
    end
end