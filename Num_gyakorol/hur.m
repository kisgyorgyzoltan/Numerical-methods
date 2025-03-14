function x = hur(f, x0, x1, eps, Nmax)

x = x1 - f(x1) * (x1 - x0) / (f(x1) - f(x0));

if abs(x - x1) < eps
    return;
end

for i = 1 : Nmax
    x0 = x1;
    x1 = x;
    x = x1 - f(x1) * (x1 - x0) / (f(x1) - f(x0));
    
    if abs(x - x1) < eps
        return;
    end
end

x = 0;
disp('Nem lehetett elerni a kert pontossagot!');

end

