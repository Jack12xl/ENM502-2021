function[] = Q3_b(n, dim, alpha)
    if nargin < 3 || isempty(alpha)
        alpha = 2;
    end
    assert(dim == 1 || dim == 2);
    assert(n >= 2);
    %%dim == 2
    if dim == 2
        [A, b] = DiffusionBVP(n, alpha, dim);
        res = LuDecom(A, b, n*n, 0.001);
%         res = A \ b;
%% Visualize
        T = reshape(res, n, n);
        figure(5)
        contourf(T)
        colorbar
        title_str = sprintf('%d x %d Grid', n, n);
        title(title_str);
    end
end