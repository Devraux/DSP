clear all;close all;clc

t = linspace(0,1,100); f0 = 1;
x = sin(2 * pi * f0 * t); N = length(x);
l = 20;
x1 = zeros(1,N);
Y = zeros(1,N);
Y1 = zeros(1,N);
z = zeros(1,N);
z1 = zeros(1,N);

k = 1;
for n = 1:N
    if(n + l <=N)
        x1(n) = x(n +l);
    else
        x1(n) = x(k);
        k = k + 1;
    end
end
Y = fft(x);
Y1 = fft(x1);
Y2 = abs(Y1);
Y3 = abs(Y);

for n = 1:N
    z(n) = atan(imag(Y(n))/real(Y(n)));
    z1(n) = atan(imag(Y1(n))/real(Y1(n)));
end

subplot(6,1,1);hold on;
plot(Y2);xlabel("sample");ylabel("amplitude");title("fft of shifted signal(amplitude)");
subplot(6,1,2);hold on;
plot(Y3);xlabel("sample");ylabel("amplitude");title("fft of not shifted signal(amplitude)");
subplot(6,1,3);hold on;
plot(z);xlabel("sample");ylabel("phase");title("signal before shift(phase)")
subplot(6,1,4);hold on
plot(z1);xlabel("sample");ylabel("phase");title("shifted signal(phase)")
subplot(6,1,5);hold on
plot(x);xlabel("sample");ylabel("amplitude");title("input signal(aplitude)")
subplot(6,1,6);hold on
plot(x1);xlabel("sample");ylabel("amplitude");title("shifted signal")