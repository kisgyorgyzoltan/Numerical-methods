function [U,c,I] = GaussElim(A,b)
    n = size(A,1);
    I=[1:n];
    
    for i=1:(n-1)
        %foelem megtalalasa
        m = max(max(abs(A(i:n,i:n))));
        
        [mi,mj] = find(A(i:n,i:n) == max(max(abs(A(i:n,i:n)))));
        
        
        mi = mi + i -1;
        mj = mj + i -1;
        
        mi = mi(1);
        mj = mj(1);
        
        % sorok cserelese
        b([i,mi]) = b([mi,i]);
        A([i,mi],:) = A([mi,i],:);
        
        % oszlopok cserelese
        I([i,mj]) = I([mj,i]);
        A(:,[i,mj])=A(:,[mj,i]);
        
        if(A(i,i) == 0)
            error("szingularis matrix");
        end
        
        % nullasok behozasa
        for k=(i+1):n
           b(k) = b(k) - (b(i) * (A(k,i)/A(i,i)) );
           l =A(i,:)*( A(k,i)/A(i,i));
           A(k,:) =  A(k,:) - l;
        end      
    end
    if(A(n,n) == 0)
            error("szingularis matrix");
    end
    
        U = A;
        c = b;
end