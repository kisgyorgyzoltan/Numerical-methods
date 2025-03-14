function [X2,k,B] = JacobiIt(A,b,E)
    n = length(A);
    
    for i=1:n
        sumij=0;
        for j=1:n
            if(j ~= i)
                sumij= sumij + abs(A(i,j));
            end
        end
        if(not(abs(A(i,i)) >sumij))
            error("Nem soronkent dominans foatloju a matrix!");
        end
    end
    
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
    
    

    Q = L + U;
    D = diag(diag(A));
    P = D;
    
    B = inv(D)* (L+U) ;
    f = inv(D)*b;
    nB = norm(B);
    
    
    
    X1 = zeros(n,1);
    X2 = B * X1 + f;
    k=0;
    
    while (norm(X2 - X1) >= ((1-nB)/nB) * E )
        X1 = X2;
        k=k+1;
        X2 = B * X1 + f;
    end
    
    
end

