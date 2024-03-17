clear all;close all;clc

fs = 200; dt = 1/fs; N = 100;  
t = linspace(0,N*dt,N);
f = 20; %frequency
s = 2.* square(2 * pi * f * t);

p1 = my_lpc(s,N);
p2 = lpc(s,N-1);

figure(1)
plot(p1,"o",LineWidth=2,Color="red");hold on
plot(p2,"x",LineWidth=2,Color="blue");