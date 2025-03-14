function masodik(f,a,b)
    v = a:0.5:b;
    Fv = f(v);
    p = a:0.01:b;
    Fp=f(p);
    grafx=Newpol(v,Fv,p);
    
    plot(p,Fp);
    hold on;
    plot(p,grafx);
    axis([a,b,a,b]);
end