function rom2_3

A = Vandermonde([1/2 1/3 1/4 1/5 1/6]);
b = ones(1, 5);
e = [0.01, 0.02, 0, -0.01, 0.01];

X1 = GaussElimSolve(A, b);
X2 = GaussElimSolve(A, b + e);

disp("Elso egyenletrendszer megoldasa: ");
disp(X1);
disp("Masodik egyenletrendszer megoldasa: ");
disp(X2);

cond = norm(A, Inf) * norm(inv(A), Inf);
disp("Kondicioszam: " + cond);

end

