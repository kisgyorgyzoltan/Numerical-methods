function [Lmf] = Newpol(XX,fX,x)
    m = length(XX); % m+1 db pont m-edfoku...
    
    
    M = zeros(m,m);
    M(:,1) = fX(:)';
    for j=2:m
        for i=1:m-j+1
            M(i,j) = (M(i+1,j-1) - M(i,j-1)) / (XX(i+j-1)-XX(i));
        end
    end

    
    Lmf = M(1,m);
    for i=m:-1:2
        Lmf = Lmf .* (x - XX(i-1)) + M(1,i-1);
    end
end

