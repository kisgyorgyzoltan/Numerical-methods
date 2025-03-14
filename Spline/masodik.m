function s = masodik(xx,fx,x)
    C = elso(xx,fx);
    v=find(xx<=x);
    j = v(end);
    if(length(v) == length(xx))
        j=j-1;
    end
    s=C(1,j) + C(2,j)*(x-xx(j)) + C(3,j)*((x-xx(j))^2) + C(4,j)*((x-xx(j))^3);
end