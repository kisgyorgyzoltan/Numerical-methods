function value = romberg_itg(f, a, b, n, eps)

h = b - a;
Q = zeros(n, n);

Q(1, 1) = (h / 2) * (f(a) + f(b));

hatv = 1;

for k = 2 : n
   ossz = 0; 
   for j = 1 : hatv
       ossz = ossz + f(a + (2 * j - 1) * (h / (2 * hatv)));
   end
   
   Q(k,1) = (1 / 2 * Q(k - 1, 1)) + (h / (2 * hatv) * ossz);  
   
   hatv4 = 4;
   for j = 2 : k
     Q(k, j) = ((hatv4 * Q(k, j - 1)) - Q(k - 1,j - 1)) / (hatv4 - 1);
     hatv4 = hatv4 * 4;
   end
   
   if abs(Q(k - 1, k - 1) - Q(k, k)) < eps
       value = Q(k, k);
       return;
   end
   
   hatv = hatv * 2;
   
end

value = Q(n, n);
disp('Nem sikerult elerni a kert pontossagot!');

end

