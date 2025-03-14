function C = elso(xx,fx)
    m = length(xx);
    
    h = zeros(1,m);
    
    for j=1:m-1
        h(j+1) = xx(j+1) - xx(j);
    end
    
    lambda = zeros(1,m);
    mu = zeros(1,m);
    d = zeros(1,m);
    lambda(1) = 1;
    lambda(m)=0;
    d(1)=0;
    mu(m)=1;
    d(m)=0;
    mu(1)=0;
    for j=2:m-1
        lambda(j) = h(j+1)/(h(j)+h(j+1));
        mu(j) = 1 - lambda(j);
        d(j) = (6/(h(j)+h(j+1))) * (((fx(j+1)-fx(j))/h(j+1)) - ((fx(j)-fx(j-1))/(h(j))) );
    end
    
    A = diag(ones(1,m)*2);
    for i=1:m
        for(j=1:m)
            if j==i+1
                A(i,j) = lambda(i);
            end
            if j==i-1
                A(i,j) = mu(i);
            end
        end
    end
    d = d';
    M = linsolve(A,d);
    
    
    alfa = zeros(1,m-1);
    beta = zeros(1,m-1);
    gamma = zeros(1,m-1);
    delta = zeros(1,m-1);
    
    alfa(1:m-1)=fx(1:m-1);
    for j=1:m-1
        beta(j) = ((fx(j+1)-fx(j))/h(j+1)) - ((2*M(j) + M(j+1))/6)*h(j+1);
        delta(j) = (M(j+1)-M(j))/(6*h(j+1));
    end
    gamma(1:m-1) = M(1:m-1)/2;
    
    C(1,:) = alfa(1,:);
    C(2,:) = beta(1,:);
    C(3,:) = gamma(1,:);
    C(4,:) = delta(1,:);
end