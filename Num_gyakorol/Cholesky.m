function [L] = Cholesky(A)
    n = length(A);
    L = zeros(n);
    At = transpose(A);
    if isequal(A,At)
        n = size(A);   
        for i = 1:n
            for j = 1:i
                if(i ~= j)
                    sum = 0;
                    for k = 1:j-1
                        sum = sum + L(i,k)*L(j,k);
                    end
                    L(i,j) = (A(i,j) - sum)/L(j,j);
                end
            end
            sum = 0;
            for j = 1:i-1
                sum = sum + L(i,j)^2;
            end
            sum = A(i,i) - sum;
            if sum < 0
               disp('nem pozitiv definit');
            else
                a=sqrt(sum);
                L(i,i)=a;
            end
        end
    else
        disp('rossz bemeno adat');
    end
end

