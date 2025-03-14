    function rom2_6

func = @(x)(sin(x .^ 2));
X = 0:0.1:1;
fX = func(X);

fApprox = @(x)interpolacio(X, fX, x, 0.01);

itg = romberg_itg(fApprox, 0, 1, 100, 0.01);

disp(itg);

end

