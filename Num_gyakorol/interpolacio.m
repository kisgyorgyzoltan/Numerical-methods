function val = interpolacio(X, f, x, epsilon)

m = length(X);

dist = abs(X - x);
[~, I] = sort(dist);
X = X(I);
f = f(I);

val = zeros(1, length(x));
for k = 1 : length(x)
    Q = zeros(m, m);
    Q(:, 1) = f;
    for i = 2:m
        for j = 2 : i
            Q(i, j) = ((X(i) - x) * Q(j - 1, j -1) - (X(j - 1) - x(k)) * Q(i, j - 1)) / (X(i) - X(j - 1));
        end
        
        val(k) = Q(i, i);
        
        if abs(Q(i, i) - Q(i - 1, i - 1)) < epsilon
            break;
        end
    end
end

end

