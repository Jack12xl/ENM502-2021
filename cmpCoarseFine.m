function[err] = cmpCoarseFine(n, alpha)
%% solve and compare the solved field
% assume 2D

    dim = 2;
    [A1, b1] = DiffusionBVP(n, alpha,dim);
    [A2, b2] = DiffusionBVP(2*n - 1, alpha,dim);
    
    x1 = LuDecom(A1, b1, n*n);
    x2 = LuDecom(A2, b2, (2*n-1)^2);
    
    x1 = reshape(x1, [n, n]);
    x2 = reshape(x2, [2*n-1, 2*n-1]);
    
    err = FieldL2Err(x1, x2, n);
end