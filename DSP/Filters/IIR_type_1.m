clear all;close all;clc

Rp = 2; %[dB]
Rr = 50; %[dB]
fp = 1250; %[Hz]
fr = 1750; %[Hz]
fs = 8000; %[Hz]
f = linspace(0,fs);
f0 = (fr)/(10^(Rr/10) - 1);

licznik =  log10(sqrt(10 ^ (Rr/10) - 1)/sqrt(10^(Rp/10) - 1));
mianownik = log10(fr/fp);
N = ceil(licznik/mianownik); % filter order
H = 1./sqrt(1 + (f./f0).^(2*N));

za = [];
k = 1:N;
pk = 2 * pi * f0 * exp(j*pi*((1/2) + (2 * k - 1)/(2 * N)));
ka = abs(prod(pk));%gain in transmittance
[ba, aa] = zp2tf(za, pk, ka);%zero-pole transformation to polynomial/multinomial
[r, p, k] = residue(ba, aa); %determining simple fractions
Ts = 1/fs; %sampling period
[bd, ad] = residue(r*Ts, exp(p*Ts), k);
%iir_1
%iir_3

