clear all;close all;clc

dt = 0.01;
fp = 1/dt;
f0 = 1;
t = 0:dt:10;
y = sin(2 * pi * f0 * t);
N = length(y);


e = zeros(1,length(y));
for  k = 0 : length(y) - 1
e(k + 1) = exp((-i*2*pi/N) * k);
end

Y = zeros(1,N);
for i = 0:N -1
    sum = 0;
    for j = 1 : N 
        sum = sum + y(j)*e(j)^i;
    end
    Y(i+1) = sum;
end
f = linspace(-fp/2,fp/2,N);
figure(1)
subplot(2,2,1);hold on;
title("spectre from FFT");
plot(f,fft(y,N));

subplot(2,2,2);hold on;
title("spectre from DFT (real part)");
plot(f,real(Y));

subplot(2,2,3);hold on
title("FFT phase");
plot(f,angle(fft(y,N)));

subplot(2,2,4);hold on;
title("DFT phase");hold on;
plot(f,angle(Y));


%IDFT
IDFT = zeros(1,N);
for i = 0 : N - 1
    sum = 0;
    for j = 1: N
        sum = sum + Y(j) * e(j)^-i;
    end
    IDFT(i + 1) = sum;
end
IDFT = (1/N) * IDFT;

figure(2)
subplot(2,1,1);hold on;
title("sygnał orginalny");
plot(t,y)
subplot(2,1,2);hold on;
title("sygnał odtworzony");
plot(t,IDFT)









