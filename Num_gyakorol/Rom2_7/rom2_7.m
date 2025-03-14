function rom2_7
    f = @(x) exp(x);
    XX = [0,1,2];
    x = 0.25;
    M1 = Newpol(XX,f(XX),x)
    M2 = Aitken(XX,f(XX),x,eps)
    M3 = Hermite(XX,f(XX),f(XX),x)
    M4 = masodik(XX,f(XX),x)
end