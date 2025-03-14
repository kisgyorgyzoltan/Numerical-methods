function val = hermite(X, Fx, FDeriv, x)

n = length(X);

if length(Fx) ~= n || length(FDeriv) ~= n
    error("Nem azonosak a dimenziok!");
end

n = 2 * n;
Z = zeros(1, n);
Q = zeros(n, n);

Z(1:2:n) = X;
Z(2:2:n) = X;
Q(1:2:n, 1) = Fx;
Q(1:2:n, 2) = FDeriv;
Q(2:2:n, 1) = Fx;

for i = n - 1 : -1 : 1
    for j = 2 : n - i + 1
        if Z(i + j - 1) == Z(i)
            continue;
        end
        
        Q(i, j) = (Q(i + 1, j - 1) - Q(i, j - 1)) / (Z(i + j - 1) - Z(i));
    end
end

len = length(x);
val = zeros(1, len) + Fx(1);
ratio = ones(1, len);
for i = 2:n
    ratio = ratio .* (x - Z(i - 1));
    val = val + Q(1, i) .* ratio;
end

end

