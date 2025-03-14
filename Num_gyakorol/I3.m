function [invMtx] = I3(A)

    %simetrikus, hatekony modszer a Cholesky
    L = Cholesky(A);
    
    b = [1;0;0];
    y = LTriangSolve(L,b);
    a1 = UTriangSolve(L',y);
    
    b = [0;1;0];
    y = LTriangSolve(L,b);
    a2 = UTriangSolve(L',y);

    b = [0;0;1];
    y = LTriangSolve(L,b);
    a3 = UTriangSolve(L',y);

    Mtx = A;
    invMtx = [a1';a2';a3']
end