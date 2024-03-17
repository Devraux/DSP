clear all;close all;clc

fp = 1250; %[Hz]
fr = 1750; %[Hz]
Rr = 50; %[dB] =>Blackman window
fs = 80; %[Hz]

a = 5.6;
R = ceil(a * fs*(fr-fp));
K = R+1;
n = linspace(0,R,K);
f0 =fp + (fr-fp)/2;
hx = 2 * (f0/fs) * sinc(2 * (f0/fs) * (n-R/2));
window = blackman(K);
window = window';
h = window .* hx;
[H1, F1] = freqz(h,1,2000,fs);
figure(1)
plot(F1,H1)

figure(2)
freqz(h,1,2000,fs);

figure(3)
freqz(H1,F1)