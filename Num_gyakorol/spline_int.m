function spline = spline_int(X, Y, yDeriv, x)

len = length(X);
H = zeros(1, len);

H(1) = 0;
for j = 2:len
    H(j) = X(j) - X(j - 1);
end

[alfa, beta, gamma, delta] = spline_coef(H, Y, yDeriv);

len_x = length(x);
spline = zeros(1, len_x);
for i = 1:len_x
    
    res_int = find(X <= x(i));
    len_res = length(res_int);
    if len_res == length(X)
        j = len_res - 1;
    else
        j = len_res;
    end
    
    
    spline(i) = alfa(j) + beta(j) * (x(i) - X(j)) + gamma(j) * (x(i) - X(j)) ^ 2 + delta(j) * (x(i) - X(j)) ^ 3;
end

end

