function ret = dominansFA(A)
%   Kiirja hogy a matrix dominans foatlojue vagy sem
meret = size(A);
if meret(1) == meret(2)
    for i = 1 : meret(1)
        osszeg = sum(abs(A(i, :)));
        osszeg = osszeg - abs(A(i, i));
        
        if abs(A(i, i)) < osszeg
            ret = 0;
            return;
        end
    end
    ret = 1;
    return;
end
ret = 0;
end

