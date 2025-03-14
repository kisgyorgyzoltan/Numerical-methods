function fxx = Hermite(xx,fx,fdx,x)
    fxx=0;
    n = length(xx);
    
    z = zeros(1,2*n);
    Q = zeros(2*n,2*n);
    j=1;
    i=1;
    while j<=2*n
        Q(j,1) = fx(i);
        Q(j+1,1) = fx(i);
        z(j) = xx(i);
        z(j+1)=xx(i);
        j=j+2;
        i=i+1;
    end
    
    
    n=n*2;
    for j=2:n
        for i=1:n-j+1
            if j == 2 && z(i) == z(i+1)
                Q(i,j) = fdx(round(i/2));
            else
                Q(i,j) = (Q(i+1,j-1)-Q(i,j-1))/(z(i+j-1)-z(i));
            end
        end
    end
    
    fxx = Q(1,n);
    for i=n:-1:2
        fxx = fxx .* (x - z(i-1)) + Q(1,i-1);
    end
    
end

