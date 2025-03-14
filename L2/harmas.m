A = [ 10 7 8 7; 7 5 6 5; 8 6 10 9; 7 5 9 10];
V = [32;23;33;31];

DetA = det(A);
fprintf('det(A) = %d \n',DetA);

InvA = inv(A);
fprintf('(A)^(-1) = %d \n',InvA);

X=linsolve(A,V);
disp('X=');
disp(X);

PA = [10 7 8.1 7.2 ;7.08 5.04 6 5; 8 5.98 9.89 9 ;6.99 4.99 9 9.89];
PV = [32.1; 22.9; 33.1; 30.9];

XPA = linsolve(PA,V);
disp('Megoldas perturbalt matrix eseten:');
disp(XPA);

XPV = linsolve(A,PV);
disp('Megoldas perturbalt vektor eseten:');
disp(XPV);

pvhiba = norm(V-PV)/norm(V);
fprintf('pv relativ hibaja = %d\n',pvhiba);

xpvhiba = norm(X-XPV)/norm(X);
fprintf('xpv relativ hibaja = %d\n',xpvhiba);

pahiba = norm(A-PA)/norm(A);
fprintf('pa relativ hibaja = %d\n',pahiba);

xpahiba = norm(X-XPA)/norm(X);
fprintf('xpa relativ hibaja = %d\n',xpahiba);

cond(A);