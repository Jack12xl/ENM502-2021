function[] = Q3_c1(ns, alpha)
%% err on n
    err = zeros(length(ns), 1);
    for i = 1:length(ns)
        err(i) = cmpCoarseFine(ns(i), alpha);
    end
    
    p2 = polyfit(ns, err, 2);
    f2 = polyval(p2, ns);
    
    figure();
    txt2 = ['y = (' num2str(p2(1)) ')x^2+ (' num2str(p2(2)) ')x+ (' num2str(p2(3)) ')'];
    plot(ns, err, '-o', ns, f2, '-');
    legend('data','2nd degree fit')
    
    title_str = sprintf('Error Evluation Alpha=%d', alpha);
    title(title_str)
    
    text(2, 2, txt2);
    
    xlabel('Coarse grid resolution') %add an x label
    ylabel('average error in norm2') % add a y label
end