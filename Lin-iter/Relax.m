function [X2,k] = Relax(A,b,E,om)
    n = size(A,1);
    L = zeros(n,n);
    U = zeros(n,n);
    
    for i=1:n
        for j=1:n
            if(i>j)
                L(i,j) = -A(i,j);
            else
                if(i<j)
                    U(i,j) = -A(i,j);
                end
            end
        end
    end
    
    
    D = diag(diag(A));
    Q = ((1-om)/om)*D + U;
    P = (D/om)-L;
    
    B = inv((D/om)-L) * (((1-om)/om)*D + U) ;
    f = inv((D/om) - L) * b;
    
    X1 = zeros(n,1);
    X2 = B * X1 + f;
    nB = norm(B);
    k=0;
    while (norm(X2 - X1) >= ((1-nB)/nB) * E )
        X1 = X2;
        k=k+1;
        X2 = B * X1 + f;
    end
    
    
    
end

