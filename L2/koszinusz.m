function [eredmeny] = koszinusz(x,E)
    x=mod(x,2*pi);
    uj=1;
    eredmeny = 1;
    i=0;
    while(abs(uj)>= E)
        uj = uj * ((x^2)/((2*i + 1)* (2*i + 2)));
        eredmeny = eredmeny +((-1)^(i+1))*uj;
        i=i+1;
    end
end

