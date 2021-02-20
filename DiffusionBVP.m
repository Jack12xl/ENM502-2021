function[A, b] = DiffusionBVP(n, alpha , dim)
%% Q3(a) create A,b for both 2/3D BVP diffusion problem
% div2(T) + alpha = 0 

    assert(dim == 1 || dim == 2);
    assert(n >= 2);
    % # of elements of A along one dim
    num_e = power(n, dim); 
%     cell grid size
    h = 1 / (n - 1);
    h2 = h * h;
    h2inv = 1 / h2;
    
    A = zeros(num_e);
    b = alpha * zeros(num_e, 1);
%% 1 D dimension
    if dim == 1
        diag_arr = -2 * h2inv * ones(1, num_e);
%         boundary condition
        diag_arr(1) = 1;
        diag_arr(num_e) = 1;
%         diagonal
        D0 = diag(diag_arr);
        
        diag_arr = h2inv * ones(1, num_e - 1);
        
        diag_arr1 = diag_arr;
        diag_arr1(1) = 0;
        
        diag_arr2 = diag_arr;
        diag_arr2(num_e-1) = 0;
        
        A = D0 + diag(diag_arr1, 1) + diag(diag_arr2, -1);
        
        b = -alpha * ones(num_e, 1);
%         boudary 
        b(1) = 0;
        b(num_e) = 0;
    end
%% 2 D dimension
    if dim == 2
        diagArr = -4*h2inv*ones(num_e, 1);
%         the boundary index of the field T
        bd_idxes = getBoundaryIdxes([n, n]);
        diagArr(bd_idxes) = 1;
        
        diagArrSub = h2inv*ones(num_e, 1);
        diagArrSub(bd_idxes) = 0;
        
        diagArrLeft = diagArrSub(2:end);
        diagArrRight = diagArrSub(1:end-1);
        diagArrTop = diagArrSub(1:end-n);
        diagArrBot = diagArrSub(1+n:end);
        
        A = diag(diagArr) + diag(diagArrLeft, -1) + diag(diagArrRight, 1) + diag(diagArrTop, n) + diag(diagArrBot, -n);
        
        b = -alpha * ones(num_e, 1);
        b(bd_idxes) = 0;
    end
end