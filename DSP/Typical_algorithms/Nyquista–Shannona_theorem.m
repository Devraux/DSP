clear all;close all;clc
dt1 = 0.1;
dt2 = 0.01;
t1 = 0:dt1:5;
t2 = 0:dt2:5;
fp = 1;
s = sin(2 * pi * fp *t1) .* myrectangle(t1,1,1,1);

sum = zeros(1,length(t2));
for i = 1 : length(t2)
    for j = 1 : length(t1)
sum(i) = sum(i) + s(j) * sa(pi*(1/dt1)*(t2(i) - (j-1) * dt1));
    end
end

figure(1)
subplot(2,1,1)
plot(t1,s)
subplot(2,1,2)
plot(t2,sum)

function y = sa(x)
    if x == 0
        y = 1;
    else
        y = sin(x)/x;
    end
end
