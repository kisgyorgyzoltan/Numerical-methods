function harmadik(f,a,b)
    v = a:1:b;
    Fv = f(v);
    
    p = a:0.01:b;
    
    s = zeros(1,length(p));
    for i=1:length(p)
        s(i) = masodik(v,Fv,p(i));
    end
    
    plot(p,f(p));
    hold on;
    plot(p,s);
end

