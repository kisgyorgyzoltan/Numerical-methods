function rom1_3

A = [35 32 -28; 32 30 -30; -28 -30 54];
len = length(A(1, :));

invMatrix = zeros(len, len);

L = CholeskyFelbont(A);

for i = 1:len
    b = zeros(len, 1);
    b(i) = 1;
    y = LTriangSolve(L, b);
    invMatrix(i, :) = UTriangSolve(L', y);
end

disp(invMatrix);
end

