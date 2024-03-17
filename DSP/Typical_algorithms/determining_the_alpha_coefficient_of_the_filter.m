clear all;close all;clc
fs = 200; dt = 1/fs; N = 100;  
t = linspace(0,N*dt,N);
f = 20; %square wave freq.
y = 2.* square(2 * pi * f * t);
P = my_lpc(y,3); %z^-1  z^-2

%encoding
encoded_signal = zeros(1,length(y));
for i = 4 : length(y)
    sum = 0;
    sum = sum - (y(i-3) + y(i-2)*P(2) + y(i-1)* P(1)) +y(i);
    encoded_signal(i) = sum;
end

%decoding
encoded_signal = zeros(1,length(y));
for i = 4 : length(y)
    sum = 0;
    sum = sum + (y(i-3) + y(i-2)*P(2) + y(i-1)* P(1)) + encoded_signal(i); %exemplary case
    encoded_signal(i) = sum;
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
plot(t,encoded_signal,"-o",LineWidth=2)


