function [V] = vandermond(t)
    n= size(t,2);
    V=zeros(n,n);
    for i=1:n
        tm=t(i);
        V(i,1)=1;
        for j =2:n
            V(i,j) = V(i,j-1) *tm;
        end
    end
    
end

