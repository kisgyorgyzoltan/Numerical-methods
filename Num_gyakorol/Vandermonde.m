function [T] = Vandermonde(t)

len = length(t);
T = zeros(len, len);

for i = 1 : len
    T(i, 1) = 1;
    for j = 2 : len
        T(i, j) = T(i, j - 1) * t(i);
    end
end

end

