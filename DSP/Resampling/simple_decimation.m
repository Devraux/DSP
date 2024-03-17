clear all;close all;clc
fs1 = 1000; %Hz
dt = 1/fs1;
N = 500; %number of samples
t = linspace(0,N*dt,N);
tfs2 = linspace(0,N*dt,N/2);
s = 2 * sin(2 * pi * 100* t) - cos(2 * pi * 300 * t) + (1/2) * sin(2 * pi * 200 * t - pi/6);
fs2 = 500; %Hz
fs3 = 700; %Hz
fs4 = 450; %Hz

%If subsampling can be done by taking every nth sample of the signal
%original signal then subsampling can be done this way, however, when it is impossible to
%determine the integer number n you have to use the interpolation method

sfs2 = zeros(1,length(s)/2);
sfs2 = s(1:2:end);

figure(1)
subplot(3,1,1);hold on;
title("input signal");
plot(t,s,"-o",LineWidth=1,Color="red");hold on;
subplot(3,1,2);hold on;
title("down sampling");
plot(tfs2,sfs2,"-o",LineWidth=1,Color="blue");
subplot(3,1,3);hold on;
title("before and after on one chart");
plot(t,s,"-o",LineWidth=1,Color="red");hold on;
plot(tfs2,sfs2,"-o",LineWidth=1,Color="blue");




