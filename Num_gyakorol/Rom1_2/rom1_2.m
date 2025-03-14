function rom1_2
    a = 115;
    f = @(x) sqrt(x);
    
    XX = [10;11];
    fX = f(XX);
    
    Aitken(XX,fX,a,0.001)
end