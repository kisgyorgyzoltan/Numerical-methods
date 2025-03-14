function masodik(f,a,b)
    v = a:0.5:b;
    Fv = f(v);
    syms x;
    fd = diff(f,x);
    Fdv = vpa(subs(fd,x,v));
    p = a:0.01:b;
    Fp=f(p);
    grafx=Hermite(v,Fv,Fdv,p);
    
    plot(p,Fp);
    hold on;
    plot(p,grafx);
    axis([a,b,a,b]);
end