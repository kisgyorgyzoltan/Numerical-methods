function [] = GaussElimSolve(A,b)
    n = size(A,1);

    [U,c,I] = GaussElim(A,b);
    x = UTriangSolve(U,c);
        
    y = zeros(1,n);
    
    for i=1:n
        y(I(i)) = x(i);
    end
    
    disp(y);
    
end

