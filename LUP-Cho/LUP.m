function [L,U,P] = LUP(A)
n = size(A,1);

P = eye(n);
L = zeros(n,n);

for i=1:(n-1)
        %foelem megtalalasa
        m = max(abs(A(i:n,i)));
        
        mi = find(A(i:n,i) == m);
            
        mi = mi + i -1;
        
        % sorok cserelese
        A([i,mi],:) = A([mi,i],:);
        P([i,mi],:) = P([mi,i],:);
        L([i,mi],:) = L([mi,i],:);
        
        % nullasok behozasa
        for k=(i+1):n
           L(k,i) = (A(k,i)/A(i,i)) ;
           fprintf("l(%d,%d)=%d\n",k,i,-(A(k,i)/A(i,i)));
           l =A(i,:)*( A(k,i)/A(i,i));
           A(k,:) =  A(k,:) - l;
        end
        
end

L = L + eye(n);
U = A;

end

