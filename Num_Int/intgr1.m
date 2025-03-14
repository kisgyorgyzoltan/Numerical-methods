function I = intgr1(f,a,b,m)
    h = (b-a)/m;
    x = zeros(1,m+1);
    for k=1:m+1
        x(k) = a + ((k-1)*h);
    end
    I = h/6;
    
    s=0;
    for k=2:m+1
        s = s + f((x(k-1) + x(k)) / 2);
    end
    s = s * 4;
    s = s + f(a) + f(b);
    s = s + 2*sum(f(x(2:m)));
    
    I = I * s;
    
end

