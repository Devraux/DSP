function [y] = rectanglee(x,A,W,S)

% Rectangular signal
N = length(x);
y = zeros(1, N);
x = x - S;
for i = 1:N
    if(x(i) > -W/2 && x(i) < W/2)
        y(i) = 1;
    elseif (abs(x(i)) == 0 )
        y(i) = 0;
    end
end
y = A.*y;
end