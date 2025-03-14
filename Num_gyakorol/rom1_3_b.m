function rom1_3_b

A = [4 1 1 1; 0 -5 2 1; 1 1 10 1; -1 2 1 -6];
b = [7 1 1 3; -2 1 2 4; 13 1 -1 5; -4 1 5 6];

[L, U, ~] = LUPFelbont(A);

for i = 1 : length(b(1, :))
    y = UTriangSolve(U, b(:, i));
    x = LTriangSolve(L, y);
    disp(x);
end

