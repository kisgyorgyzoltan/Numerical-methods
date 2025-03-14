function X = LTriangSolve(L, b)

n = length(L(1, :));
X = zeros(n, 1);

X(1) = b(1) / L(1, 1);
for i = 2 : n
    osszeg = 0;
    for j = 1:i-1
        osszeg = osszeg + L(i, j) * X(j);
    end
    
    X(i) = (b(i) - osszeg) / L(i, i) ;
end