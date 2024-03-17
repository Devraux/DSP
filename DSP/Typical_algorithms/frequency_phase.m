clear all;close all;clc

fs = 200; %[Hz];
x_s = [1 1/2];
y_s = [1 1];
p = roots(x_s);
z = roots(y_s);
n = 100;
w = linspace(0, pi, n+1);
w = w(1:end-1);
unit_circle = exp(j*w);
f = (w/pi) * (fs/2);
h = y_s(1) * ones(1,n);

for k = 1 : length(z)
    g = unit_circle - z(k);
    h = h.*g;
end

for k = 1 : length(p)
    g = unit_circle-p(k);
    h = h./g;
end

y = 10*log(abs(h));

figure(1)
subplot(2,1,1);hold on;
title("ABS");
plot(f,10*log(abs(h)));
subplot(2,1,2);hold on;
title("PHASE");
plot(f,angle(h))
