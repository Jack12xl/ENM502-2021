function[err] = FieldL2Err(f1, f2, n)
%% L2 distance of fine grid and coarse grid
% f1: coarse grid
% f2: fine grid
% n: one dim of f1

%% for simplicity, we assume 
% 
% * n2 = 2n1 - 1 (no 2d interpolation)
% * field is square
% 
% 

% get the corresponding value on fine grid
    f_tmp = f2(1:2:2*n-1, 1:2:2*n-1);
    
    err = norm(f_tmp - f1) / power(n, 2);
end