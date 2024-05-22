clc; close all; clear;

R = 100; %filter order
h = fir1(R, 1/15, hamming(R+1)); %low pass filter
%frequency axis should be in 0:fs/2 range

% [char_lp, f_lp] = freqz(h);

%save it under the variable,
h_lp = h;
%index
n = 0:(length(h_lp)-1);
h_bp = h_lp.*cos(pi*(n-ceil(R/2)));
[char_bp, f] = freqz(h_bp, 1);

figure(1); clf;
subplot(3,1,1);

plot(f, abs(char_bp), 'k.-');
title('transformed band pass filter(Amplitude)');
subplot(3,1,2);
plot(f, angle(char_bp), 'k.-');
title('transformed band pass filter(phase)');
subplot(3,1,3);
plot(f, 20*log10(abs(char_bp)), 'k.-');
title('transformed band pass filter(Amplitude[db])');


% figure(2);
% subplot(2,1,1);
% plot(f_lp, abs(char_lp), 'b.-');
% title('first filter')
% subplot(2,1,2);
% plot(f_lp, 20*log10(abs(char_lp)), 'b.-');
% title('first filter')

% my frequency characteristics
function [Y, F] = LTIch(b, a)
 %b - coefficients at x[n] -> coefficients at X(z)
 %a - factors at y[n] -> factors at Y(z)
 
 if a(1) ~= 1
     b = b/a(1);
     a = a/a(1);
 end
 
 fs = 1; %normalization
 
 f = 0:0.001:(fs/2);
 
 z = exp(1j*2*pi*f/fs);
  
 A = length(a);
 B = length(b);
 
 numerator = zeros(1, length(f));
 denominator = zeros(1, length(f));
 
 for n = 1:B
    numerator = numerator + b(n)*exp(1j*2*pi*f/fs*(n-1));
 end
 for m = 1:A
    denominator = denominator + a(m)*exp(1j*2*pi*f/fs*(m-1));
 end
 Y = numerator./denominator;
 F = f;
 end
