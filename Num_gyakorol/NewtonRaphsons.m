function [x,n] = NewtonRaphsons(f,fd,x0,E,N0,a,b)
%     x = zeros(1,N0);
    
    hold on;
    felosztas = linspace(a,b,1000);
    plot(felosztas,f(felosztas));
    
    x(1) = x0;
     plot(felosztas,f(x(1))+fd(x(1))*(felosztas-x(1)));
    x(2) = b - (f(b)/fd(b));
    pause(2);
     plot(felosztas,f(x(2))+fd(x(2))*(felosztas-x(2)));
    
    N = 2;
    
    while ( abs(x(N)-x(N-1)) > E && N0 >= N)
        N = N+1;
        x(N) = x(N-1) - (f(x(N-1))/fd(x(N-1)));
        
        plot(felosztas,f(x(N))+fd(x(N))*(felosztas-x(N)));
        pause(2);
    end
    
    if(N==N0)
        disp("elertuk a maximalis iteracio szamot");
    end
    n = N;
end