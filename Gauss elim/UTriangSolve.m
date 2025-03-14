function x=UTriangSolve(U,c)
    n = size(U,1);
    x = zeros(1,n);
    x(n) = c(n) / U(n,n);
    for i=(n-1):-1:1
        szumma=0;
        for j=i+1:n
            szumma = szumma + U(i,j) * x(j);
        end
        x(i) = (1/U(i,i)) * (c(i) - szumma);
    end
end