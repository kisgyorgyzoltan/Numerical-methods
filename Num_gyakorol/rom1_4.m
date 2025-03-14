function rom1_4

A = rand(4, 4) + 1000 * eye(4, 4);
b = rand(4, 5);

if det(A) == 0
    return;
end

tic
    for i = 1 : length(b(1, :))
       X = GaussElimSolve(A, b(:, i))
    end
toc

tic
    [L, U, ~] = LUPFelbont(A);
    for i = 1 : length(b(1, :))
        Y = GaussElimSolve(U, b(:, i));
        X = LTriangSolve(L, Y)
    end
toc

end