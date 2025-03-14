function rom2_10

f = @(x)(x .^ 4 - 3 .* x .^ 2 + 75 .* x - 10000);
fDeriv = @(x)(4 .* x .^ 3 - 6 .* x + 75);

X = -20:0.01:20;

grid on;
hold on;
plot(X, f(X));
ylim([-1, 1]);

x0_1 = -10;
gyok1 = NewtonRaphson(f, fDeriv, x0_1, 10 ^ (-5), 1000)

x0_2 = 10;
gyok2 = NewtonRaphson(f, fDeriv, x0_2, 10 ^ (-5), 1000)

end

