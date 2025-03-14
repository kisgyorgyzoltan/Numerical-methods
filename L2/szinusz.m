function [eredmeny] = szinusz(x,E)
     x=mod(x,2*pi);
    i=1;
    uj=x*((x^2)/(2*i*(2*i + 1)));
    eredmeny=x - uj;
    while(abs(uj)>= E)
        i=i+1;
        uj=uj*((x^2)/(2*i*(2*i + 1)));
        eredmeny = eredmeny + ((-1)^(i))*uj;
    end
end

