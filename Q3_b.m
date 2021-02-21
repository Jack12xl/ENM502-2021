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
    f = figure();
    if dim == 2
%% dim == 2
        T = reshape(res, n, n);
        contourf(T);
        colorbar;
        title_str = sprintf('%d x %d Grid', n, n);
        title(title_str);
    else
%% dim == 1
        T = res;
        plot(T);
        xlabel('grid index') %add an x label
        ylabel('T') % add a y label
        title_str = sprintf('%d Grid', n);
        title(title_str);
    end
    f_str = sprintf('./results/%d_%d_D.png', n, dim);
    saveas(f, f_str);
end