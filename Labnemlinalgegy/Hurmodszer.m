function x = Hurmodszer(f,x0,x1,E,N0)
    x = zeros(1,N0+1);
    N=2;
    x(1) = x0;
    x(2) = x1;
    
    while ( (abs(x(N)-x(N-1))>E) && (N0 >= N) )
        N = N+1;
        x(N) = x(N-1) - ((f(x(N-1))*(x(N-1)-x(N-2)))/(f(x(N-1))-f(x(N-2))));
    end
    
    if(N==N0)
        disp("elertuk a maximalis iteracio szamot");
    end
    
end

