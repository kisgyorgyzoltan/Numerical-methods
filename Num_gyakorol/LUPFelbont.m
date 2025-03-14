function [L, U, P] = LUPFelbont(A)

len = size(A, 1);
P = eye(len);

for foatloIndex = 1:len - 1
    B = abs(A(foatloIndex:len, foatloIndex));
    foelem = max(B(:));
    
    if foelem == 0
       error("A matrix szingularis!"); 
    end
    
    foSor = find(foelem == B);
    foSor = foSor(1) + foatloIndex - 1;
    
    if foSor ~= foatloIndex
       A([foatloIndex, foSor], :) = A([foSor, foatloIndex], :);
       P([foatloIndex, foSor], :) = P([foSor, foatloIndex], :);
    end
    
    for i = foatloIndex + 1:len

        l = A(i, foatloIndex) / A(foatloIndex, foatloIndex);
        A(i, foatloIndex) = l;
        
        for j = foatloIndex + 1:len
            A(i, j) = A(i, j) - l * A(foatloIndex, j);
        end
    end
end

if A(len, len)==0
    error('A szingularis!');
end

U = triu(A);
L = tril(A,-1) + eye(len);

end

