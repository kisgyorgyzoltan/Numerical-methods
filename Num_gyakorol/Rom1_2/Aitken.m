function er = Aitken(XX,fX,x,epsz)

    er = -111;
    m = length(XX); % m = m+1 nalam

    Q = zeros(m);
    
    for i=1:m
        Q(i,1) = fX(i);
    end
    
    % Q rendezese
    for i=1:m
            if(abs(XX(i) - x) >= abs(XX(i+1:m) - x))
                Q([i,i+1:m],:) = Q([i+1:m,i],:);                
                XX([i,i+1:m],:) = XX([i+1:m,i],:); 
            end
    end
    
    for i=2:m
        for j=1:i-1
            Q(i,j+1) = (Q(j,j)*(XX(i)-x) - Q(i,j) * (XX(j)-x) )/( XX(i)-XX(j) );
        end
        
        if( abs( Q(i,i) - Q(i-1,i-1) ) < epsz)
            er = Q(i,i);
            
            return;
        end
        
    end
    disp('nincs megoldas');
    
end

