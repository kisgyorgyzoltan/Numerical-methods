function M = spline_mat(h, Y)

len = length(h);
if len ~= length(Y)
    error('A vektor dimenzioi nem talalnak');
end

lambda = zeros(len, 1);
mu = zeros(len, 1);
d = zeros(len, 1);

lambda(1) = 1;
mu(len - 1) = 1;
d(1) = 0;
d(len) = 0;

for j = 2:len - 1
    lambda(j) = h(j + 1) / (h(j) + h(j + 1));
    mu(j - 1) = 1 - lambda(j);
    d(j) = 6 / (h(j) + h(j+1)) * ((Y(j + 1) - Y(j)) / h(j + 1) - (Y(j) - Y(j - 1)) / h(j));
end

A = spdiags([mu, ones(len, 1) + 1, lambda], -1:1, len, len);
M = A \ d;

end

