function rom1_8

X = [0 3 5 8 13];
Fx = [0 225 383 623 993];
FDeriv = [75 77 80 74 72];

pos = hermite(X, Fx, FDeriv, 10);
disp(pos);

end

