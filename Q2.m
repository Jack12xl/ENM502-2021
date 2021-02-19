function[] = Q2(n, test_time)
    t1 = length(n);
    t2 = length(n);
    
    for i = 1:length(n)
        A = rand(n(i), n(i));
        b = rand(n(i), 1);
        temp = 0;
        for j = 1:test_time
            tic
            x1 = A\b;
            temp = temp + toc;
        end
        t1(i) = temp / test_time;


        temp = 0;
        for j = 1:test_time
            tic
            x2 = LuDecom(A, b, n(i), 0.001);
            temp = temp + toc;
        end
        t2(i) = temp / test_time;
    end

    n = log10(n);
    t1 = log10(t1);
    t2 = log10(t2);
    sampleNum = length(n);
    centerPos = floor(sampleNum / 2);

    figure(1)
    p1 = polyfit(n, t1, 1);
    f1 = polyval(p1, n);
    txt1 = ['y = (' num2str(p1(1)) ')x+ (' num2str(p1(2)) ')'];
    plot(n, t1, '-o', n, f1, '-');
    xlabel('log10( Matrix Size n )') %add an x label
    ylabel('log10( Time in second )') % add a y label
    title('Q2 intrinsic method')
    legend('data','linear fit')
    text(n( centerPos ), f1( centerPos ) - 0.08, txt1);

    figure(2)
    p2 = polyfit(n, t2, 1);
    f2 = polyval(p2, n);
    txt2 = ['y = (' num2str(p2(1)) ')x+ (' num2str(p2(2)) ')'];
    plot(n, t2, '-o', n, f2, '-');
    xlabel('log10( Matrix Size n )') %add an x label
    ylabel('log10( Time in second )') % add a y label
    title('Q2 our method')
    legend('data','linear fit')
    text(n( centerPos ), f2( centerPos ) - 0.08, txt2);
end