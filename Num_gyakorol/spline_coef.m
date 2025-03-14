function [alfa, beta, gamma, delta] = spline_coef(h, Y, yDeriv)

len = length(h);

alfa = zeros(1, len);
beta = zeros(1, len);
gamma = zeros(1, len);
delta = zeros(1, len);
M = spline_mat_b(h, Y, yDeriv);

for j = 1 : len - 1
    alfa(j) = Y(j);
    beta(j) = (Y(j + 1) - Y(j)) / h(j + 1) - ((2 * M(j) + M(j + 1)) / 6) * h(j + 1);
    gamma(j) = M(j) / 2;
    delta(j) = (M(j + 1) - M(j)) / (6 * h(j + 1));
end

alfa(len) = Y(len);
beta(len) = 0;
gamma(len) = M(len) / 2;
delta(len) = 0;

end

