[X,k,B] = JacobiIt(A,b,1e-15);
disp(X);
ro = max(eig(B));
fprintf("k=%d\n",k);
omega = 2/(1+sqrt(1-ro^2));

[X,k] = Relax(A,b,1e-15,1);
fprintf("k=%d\n",k);

[X,k] = Relax(A,b,1e-15,omega);
fprintf("k=%d\n",k);
disp(X);