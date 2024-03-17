% Definition of continuous signal
Fs = 1000;  % sampling frequency
T = 1/Fs;  % sampling period
t = 0:T:1;  % time axis

% High-frequency signal definition
f_high = 200;  % high frequency
x_high = sin(2*pi*f_high*t);  % High-frequency sinusoidal signal

% High-frequency signal display
figure;
subplot(2,1,1);
plot(t, x_high);
title('High frequency signal');
xlabel('Time [s]');
ylabel('Amplitude');

% High-frequency signal sampling with different sampling rates
Fs_low = 100;  % Low frequency sampling
T_low = 1/Fs_low;  % sampling period
t_low = 0:T_low:1;  % Time vector for low sampling frequency
x_low = sin(2*pi*f_high*t_low);  % High-frequency signal sampling with low sampling rate

% Display of signal sampled at low sampling rate
subplot(2,1,2);
stem(t_low, x_low);
title('Signal sampled at low sampling rate');
xlabel('Time [s]');
ylabel('Amplitude');
