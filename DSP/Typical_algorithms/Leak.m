clear all;close all;clc

dt = 0.01;
fp = 1/dt;
t = 0:dt:2;
f1 = 1;
f2 = 1;
y1 = sin(2 * pi * f1 * t);
y2 = sin(2 * pi * f2 * t) .* rectanglee(t,1,1,1.4);
y3 = y1 + y2;
N = length(y1);

figure(1)
subplot(3,1,1);hold on;
plot(t,y2);
subplot(3,1,2);hold on;
plot(t,y1);
subplot(3,1,3)
plot(t,y3);hold on;

Y1 = fft(y1,N);Y1 = Y1/N;
Y2 = fft(y2,N);Y2 = Y2/N;
Y3 = fft(y3,N);Y3 = Y3/N;
f = linspace(0,fp,N);

figure(2)
subplot(3,1,1);hold on;
title("spectre without leak");
plot(f,abs((Y1)));
subplot(3,1,2);hold on;
title("spectre with leak[ABS]");
plot(f,abs(Y2));
subplot(3,1,3);hold on;
title("spectre with leak[phase]");
plot(f,abs(Y3));
