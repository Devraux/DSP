clear all; close all;clc

t = linspace(0,2,100);f0 = 1;
x = sin(2 * pi * f0 * t); 
l = 90; N = length(x);
Y = fft(x); Y3 = (abs(Y));

for n = 1:N
    x1(n) = x(n) * exp(-j*2*pi*l/N); % SIGNAL FLIPPED IN FREQ
end
Y1 = fft(x1); Y2 = abs(Y1);

for n=1:N
    z(n) = atan(real(Y(n))/imag(Y(n)));
    z1(n) = atan(real(Y1(n))/imag(Y1(n)));
end

subplot(4,1,1);hold on
plot(Y3);xlabel("sample");ylabel("amplitude");title("signal not flipped(aplitude)")
subplot(4,1,2);hold on
plot(Y2);xlabel("sample");ylabel("amplitude");title("signal flipped(amplitude)")
subplot(4,1,3);hold on
plot(z);xlabel("sample");ylabel("phase");title("signal not flipped(phase)")
subplot(4,1,4);hold on
plot(z1);xlabel("sample");ylabel("phase");title("signal flipped(phase)")

