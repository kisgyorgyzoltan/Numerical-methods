function X = UTriangSolve(U, b)

n = length(U(1, :));
X = zeros(n, 1);

X(n) = b(n) / U(n, n);
for i = n - 1:-1:1
    osszeg = 0;
    for j = i + 1:n
        osszeg = osszeg + U(i, j) * X(j);
    end
    
    X(i) = (1.0 / U(i, i)) * (b(i) - osszeg);
end