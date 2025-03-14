function [L] = Cholesky(A)
    n = size(A,1);
    L = zeros(n,n);
    
%     szimmetrikus-e A
    S = transpose(A);
    szimm=1;
    for i=1:n
        for j=1:n
            if(A(i,j)~=S(i,j))
                szimm=0;
                break;
            end
        end
        if(szimm == 0)
            break;
        end
    end
    
    if(szimm == 0)
        error('Nem szimmetrikus A!!!');
    end
    
    for i=1:n
        s2=0;
        for j=1:i-1
            s1=0;
            for k=1:j-1
                s1=s1+(L(i,k)*L(j,k));
            end
            L(i,j)=(1/L(j,j))*(A(i,j)-s1);
            s2=s2+(L(i,j)^2);
        end
        if(A(i,i)<s2)
            error('hiba nem lehet gyokot vonni');
        end
        L(i,i) = sqrt(A(i,i)-s2);
    end
end