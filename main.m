%% Sanity Check
% whether the Lu decompose is right
SanityCheck(10:2:20);

%% Q2
n = 256:32:768;
test_time = 4;

Q2(n, test_time);

%% Q3_b
%% 1D
res = 512;
dim = 1;
Q3_b(res, dim);

%% 2D
res = 64;
dim = 2;
Q3_b(res, dim);

%% Q3_b
% benchmark our method and intrinsic method
Q3_b_benchmark(16:4:32, 4, 2);

%% Q3_c1
% err on resolution
Q3_c1(4:2:16, 2);


%% Q3_c2
% err on alpha
Q3_c2(8, 1:1:8);

