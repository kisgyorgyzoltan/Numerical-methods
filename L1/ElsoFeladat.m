function [] = ElsoFeladat(X)

n = size(X,1);

jo = 1;

for i=1:n
    sorelem = abs(X(i,i));
    sorertek = sum(abs(X(i,:))) - sorelem;
    if (sorelem <= sorertek)
        jo = 0;
        break;
    end
end

if(jo == 1)
    disp('igen');
else
    disp('nem');
end

end

