clear all;close all;clc

fs1 = 1000; %Hz input frequency
fs2 = 9000; %Hz intermediate frequency
dt = 1/fs1;
dt2 = 1/fs2;
N = 500; %number of samples
t = linspace(0,N*dt,N); %time axis of the primary signal
t2 = linspace(0,N*dt,4500); % time axis after upsampling
t3 = linspace(0,N*dt,225); %final timeline 

f = linspace(0,fs1,N); %frequency axis for the primary signal
fnew = linspace(0,fs2,4500); %frequency axis for intermediate signal
s = 2 * sin(2 * pi * 10* t);% - cos(2 * pi * 300 * t) + (1/2) * sin(2 * pi * 200 * t - pi/6);

%First we have to do interpolation and then decimation
%NWW = 9000 [Hz] => you have to overprocess to 9kHz

wektor_zer = [1, zeros(1, 8)];
zero_padding = kron(s,wektor_zer); %add 8 zeros every sample 

S = fft(s);
Snew = fft(zero_padding);

filtered_signal = zeros(1,length(zero_padding));
for i = 1 : length(zero_padding) %filtration of harmonics(in bad way, FIR/IIR is better idea)
    if(fnew(i) >= 550 && fnew(i) <= 8400)
        filtered_signal(i) = 0;
    else
       filtered_signal(i) = Snew(i); %Filtered signal
    end
end

S_odt = ifft(filtered_signal);


%retaining the final vector
sfinal = S_odt(1:20:end);


figure(1)
subplot(3,1,1);hold on;
title("without zero-padding")
stem(f,abs(S));

subplot(3,1,2);hold on;
title("with zero-padding");
stem(fnew,abs(Snew))

subplot(3,1,3)
title("filtered signal");hold on;
stem(fnew,abs(filtered_signal))


figure(2)
subplot(2,1,1);hold on;
title("input signal")
plot(t,s,"-o");

subplot(2,1,2);hold on;
title("after zero padding")
plot(t2,S_odt,"-o");


figure(3)
subplot(2,1,1);hold on;
title("input signal");
plot(t,s,"-o");

subplot(2,1,2);hold on;
title("agter resampling");
plot(t3,10*sfinal,"-o");
