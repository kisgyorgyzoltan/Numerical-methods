function val = lang_new_iter(X, Fx, x)

n = length(X);

if length(Fx) ~= n
    error("Nem azonosak a dimenziok!");
end

Q = zeros(n, n);
Q(:, 1) = Fx;

for i = n - 1 : -1 : 1
    for j = 2 : n - i + 1
        Q(i, j) = (Q(i + 1, j - 1) - Q(i, j - 1)) / (X(i + j - 1) - X(i));
    end
end

len = length(x);
val = zeros(1, len) + Fx(1);
ratio = ones(1, len);
for i = 2:n
    ratio = ratio .* (x - X(i - 1));
    val = val + Q(1, i) .* ratio;
end

end

