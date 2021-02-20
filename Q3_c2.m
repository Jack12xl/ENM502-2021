function[] = Q3_c2(n, alphas)
%% err on alpha
    err = zeros(length(alphas), 1);
    for i = 1:length(alphas)
        err(i) = cmpCoarseFine(n, alphas(i));
    end
    
    p2 = polyfit(alphas, err, 2);
    f2 = polyval(p2, alphas);
    
    figure();
    txt2 = ['y = (' num2str(p2(1)) ')x^2+ (' num2str(p2(2)) ')x+ (' num2str(p2(3)) ')'];
    plot(alphas, err, '-o', alphas, f2, '-');
    legend('data','2nd degree fit')
    
    title_str = sprintf('Error Evluation grid res=%d', n);
    title(title_str)
    
    text(2, 2, txt2);
    
    xlabel('Alpha value') %add an x label
    ylabel('average error in norm2') % add a y label
end