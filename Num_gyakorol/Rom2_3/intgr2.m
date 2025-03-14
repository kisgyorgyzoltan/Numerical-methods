function I = intgr2(f,a,b,E,mmax)
    I=0;
    h = b-a;
    Q = zeros(mmax,mmax);
    Q(1,1) = (h/2) * (f(a)+f(b));
    kettohatv = 2;
    
    for k=2:mmax
        negyhatv = 4;
        Q(k,1) = (Q(k-1,1)/2) + ((h/kettohatv)*sum(f(a+ ((2*(1:(kettohatv/2)) - 1)*(h/kettohatv)))));
        for j = 2:k
                Q(k,j) = (negyhatv*Q(k,j-1) - Q(k-1,j-1))/(negyhatv - 1);
                negyhatv = negyhatv * 4;
        end
        kettohatv = kettohatv * 2;
        if (abs(Q(k-1,k-1)-Q(k,k))< E)
            I = Q(k,k);
            break;
        end
    end
end

