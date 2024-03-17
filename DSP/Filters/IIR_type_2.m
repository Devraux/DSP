clear all;close all;clc

function [bd, ad] = butt_zach_h(fp, fr, Rp, Rr, fs)
    %determination of the Butterworth filter coefficients
    Kr = 10^(Rr/10);
    Kp = 10^(Rp/10);
    N = ceil(log10(sqrt((Kr - 1)/(Kp - 1))) / log10(fr/fp));
    f0 = fr/(Kr - 1)^(1/(2*N));

    za = []; %Butterwortha has no zeros
    k = 1:N;
    pa = 2*pi*f0*exp(1j*pi*(0.5 + (2*k - 1)/(2*N))); %equation substitution
    ka = abs(prod(pa)); %gain
    [ba, aa] = zp2tf(za, pa, ka); %transforms zero-poles to polynomial/multinomial
    
    %zamiana na cyfrowy
    [r, p, k] = residue(ba, aa); %simple fractions
    Ts = 1/fs; %sampling period
    [bd, ad] = residue(r*Ts, exp(p*Ts), k); %switch to digital filter
end

