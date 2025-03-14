function value = NewtonRaphson(f, fDeriv, x0, epsilon, Nmax)

value0 = x0;
value = value0 - f(value0) / fDeriv(value0);

if abs(f(value)) < epsilon
    return;
end

for i = 1 : Nmax
    value0 = value;
    value = value0 - f(value0) / fDeriv(value0);
    
    if abs(f(value)) < epsilon
        return;
    end
end

value = 0;
disp('Nem sikerult elerni a kert pontossagot!');

end