function value = simpson_itg(f, a, b, m)

h = (b - a) / m;

X = zeros(m + 1);
X(1) = a;

for i = 2 : m + 1
   X(i) = X(i - 1) + h;
end

ossz1 = 0;
for k = 2 : m
    ossz1 = ossz1 + f(X(k)); 
end

ossz2 = 0;
for k = 2 : m + 1
    ossz2 = ossz2 + f((X(k - 1) + X(k)) / 2);
end

value = h / 6 * (f(a) + 2 * ossz1 + f(b) + 4 * ossz2);

end