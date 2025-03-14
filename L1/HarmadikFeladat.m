function [] = HarmadikFeladat()

X=[-1:0.01:1];

for m=1:1:8

    y=cos(m * acos(X));

    plot(X,y);
    pause(1);
end

end

