function [sqrt] = II9 (a,maxit)
    
    %sqrt(a) = x |^2
    f = @(x) x.^2 - a;
    fd = @(x) 2.*x;
%     fplot(f,[-a/2,a/2]);
%     hold on;
    
    %Olyan kezdoerteket kell valasztanunk, aminek a negyzete nagyobb a
    %szamunknal (gyök nem lehet negativ)
    
    [koz,n] = NewtonRaphsons(f,fd,a/2,1/10000,maxit,-a/2,a/2);
    disp(koz(n));
    disp(n);
%     sqrt = koz(n);
end