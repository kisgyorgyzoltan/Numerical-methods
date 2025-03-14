function [X, numOfIter] = relaxacio(A, b, omega, epsilon)

ret = dominansFA(A);
if ret == 0
    error("Az A matrix nem dominans foatloju!");
end

n = length(A(1, :));

X0 = zeros(n, 1);
U = -triu(A, 1);
L = -tril(A, -1);
D = A + U + L;

B = (D ./ omega - L) \ ((1 - omega) / omega .* D + U);
f = (D ./ omega - L) \ b;

X1 = B * X0 + f;
numOfIter = 1;
while norm(X1 - X0) >= (1 - norm(B)) / norm(B) * epsilon
    X0 = X1;
    X1 = B * X0 + f;
    numOfIter = numOfIter + 1;
end

X = X1;

end

