function [U, c, I] = GaussElim(A, b)

len = size(A, 1);
I = 1:len;

for foatloIndex = 1:len - 1
    B = abs(A(foatloIndex:len, foatloIndex:len));
    foelem = max(B(:));
    
    if foelem == 0
       error("A matrix szingularis!"); 
    end
    
    [foSor, foOszlop] = find(foelem == B);
    foSor = foSor(1) + foatloIndex - 1;
    foOszlop = foOszlop(1) + foatloIndex - 1;
    
    if foSor ~= foatloIndex
       A([foatloIndex, foSor], :) = A([foSor, foatloIndex], :);
       b([foatloIndex, foSor]) = b([foSor, foatloIndex]); 
    end
    
    if foOszlop ~= foatloIndex
        A(:, [foatloIndex, foOszlop]) = A(:, [foOszlop, foatloIndex]);
        I(:, [foatloIndex, foOszlop]) = I(:, [foOszlop, foatloIndex]);
    end
    
    for i = foatloIndex + 1:len

        l = A(i, foatloIndex) / A(foatloIndex, foatloIndex);

        for j = 1:len
            A(i, j) = A(i, j) - l * A(foatloIndex, j);
        end

        b(i) = b(i) - l * b(foatloIndex);
    end
end

if A(len, len)==0
    error('A szingularis!');
end

U = A;
c = b;

end

