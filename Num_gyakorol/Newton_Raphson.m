function [ nx,n] = Newton_Raphson(f,fd,x0,eps,nmax)
   
    nx = zeros(1,nmax);
    nx(1) = x0;
    nx(2) = x0 - f(x0)/fd(x0);
    i  = 2;
    
    while abs(nx(i) - x0) > eps
    
        i = i + 1;
        x0 = nx(i-1);
        nx(i) = x0 - f(x0)/fd(x0);
        
        plot([nx(i),nx(i-1)],[f(nx(i)),f(nx(i-1))],'g');
        hold on;
        
        if i > nmax
            error('Elerte a max iteraxio szamot.');
        end
    end
    n = i;
end