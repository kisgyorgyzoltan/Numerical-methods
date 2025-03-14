function rom1_2

m = 10;
cseb = @(x)(cos((2 .* x - 1) .* pi ./ (2 .* m)));

X = -5:5;
X2 = cseb(1:m);
func = @(x)(1 ./ (1 + 25 * x .^ 2));
fX = func(X2);

XX = -1:0.01:1;
approxX = zeros(1, length(XX));
for i = 1:length(XX)
    approxX(i) = interpolacio(X2, fX, XX(i), 0.01);
end

hold on;
plot(XX, func(XX));
plot(XX, approxX);

end

