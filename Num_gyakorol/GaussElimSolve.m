function X = GaussElimSolve(A, b)
[U, c, I] = GaussElim(A, b);
X = UTriangSolve(U, c);
[~, sor_I] = sort(I);
X = X(sor_I);
end

