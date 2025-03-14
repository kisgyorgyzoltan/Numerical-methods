function L = CholeskyFelbont(A)

len = size(A, 1);
for i = 1:len
    for j = i:len
        if A(i, j) ~= A(j, i)
            error("A matrix nem szimmetrikus!");
        end
    end
end

L = zeros(len, len);

for i = 1:len
    for j = 1:i - 1
        ossz = 0;
        for k =1:j - 1
            ossz = ossz + L(i, k) * L(j, k);
        end
        
        L(i, j) = 1.0 / L(j, j) * (A(i, j) - ossz);
    end
    
    ossz = 0;
    for k = 1:i - 1
        ossz = ossz + L(i, k) ^ 2;
    end
    
    if A(i, i) - ossz < 0
        error("A matrix nem pozitiv definit");
    end
    
    L(i, i) = sqrt(A(i, i) - ossz);
end

end

