function rom2_9

a = 256;

f = @(x)(x .^ 2 - a);
fDeriv = @(x)(2 .* x);
x0 = a / 2;
epsilon = 10 ^ (-5);
NMax = 100;

sqrt = NewtonRaphson(f, fDeriv, x0, epsilon, NMax);

disp("Gyok: " + sqrt);

end

