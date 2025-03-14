function kettes(n1,n2)
for n=n1:n2
    t1 = zeros(1,n);
    t2 = zeros(1,n);
    
    for i=1:n
        t1(i) = -1 + i * (2/n);
        t2(i)=i/n;
    end
    
    V = vandermond(t1);
    c = cond(V,'Inf');
    fprintf('kondicionalis szamja V(t1) = %d\n',c);

    V = vandermond(t2);
    cond(V,'Inf');
    c = cond(V,'Inf');
    fprintf('kondicionalis szamja V(t1) = %d\n',c);
end