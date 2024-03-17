clear all;close all;clc
fs = 200; dt = 1/fs; N = 100;  
t = linspace(0,N*dt,N);
f = 20; %square wave frequency
y = 2.* square(2 * pi * f * t);
P = my_lpc(y,3); %z^-1  z^-2

%encoding
encoded_signal = zeros(1,length(y));
for i = 4 : length(y)
    summ = 0;
    summ = summ - (y(i-3) + y(i-2)*P(2) + y(i-1)* P(1)) +y(i);
    encoded_signal(i) = summ;
end

%decoding
decoded_signal = zeros(1,length(y));
for i = 4 : length(y)
    summ = 0;
    summ = summ + (y(i-3) + y(i-2)*P(2) + y(i-1)* P(1)) + encoded_signal(i);
    decoded_signal(i) = summ;
end

figure(1)
subplot(3,1,1);hold on
title("input signal");
plot(t,y,"-o",LineWidth=2)
subplot(3,1,2);hold on
title("encoded signal");
plot(t,encoded_signal,"-o",LineWidth=2)
subplot(3,1,3);hold on
title("decoded signal");
plot(t,decoded_signal,"-o",LineWidth=2)


