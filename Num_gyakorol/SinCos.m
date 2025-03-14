function [sn, cn] = SinCos(x, E)

while x >= 2 * pi
   x = x - 2 * pi;
end

while x < 0
    x = x + 2 * pi;
end

sn = 0;
cn = 0;

next_comp_sin = x;
next_comp_cos = 1;
fact_sin = 1;
fact_cos = 0;
sign_sin = 1;
sign_cos = 1;

while abs(next_comp_sin) > E
    sn = sn + sign_sin * next_comp_sin;
    sign_sin = -1 * sign_sin;
    next_comp_sin = next_comp_sin * (x^2 / ((fact_sin + 1) * (fact_sin + 2)));
    fact_sin = fact_sin + 2;
end

while abs(next_comp_cos) > E
   cn = cn + sign_cos * next_comp_cos;
   sign_cos = -1 * sign_cos;
   next_comp_cos = next_comp_cos * (x^2 / ((fact_cos + 1) * (fact_cos + 2)));
   fact_cos = fact_cos + 2;
end

end

