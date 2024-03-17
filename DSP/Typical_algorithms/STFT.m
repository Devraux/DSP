clear all;
close all;
clc;

dt = 0.01;
fp = 1/dt;
t = 0.01:dt:5;
s = sin(2 * pi * 20 * t) + sin(2 * pi * 1 * t) + sin(2 * pi * 10 * t) ;

frame_size = 50; % frame size
overlap = 10;    % frame phase

figure;

for i = 1 : overlap : length(s) - frame_size
    frame = s(i:i+frame_size-1);
    f = linspace(0, fp, frame_size);
    stft = fft(frame);
    stft_abs = abs(stft);
    
    %plot
    subplot(2, 1, 1);
    imagesc(t(i:i+frame_size-1), f, abs(stft'));
    xlabel('time(s)');
    ylabel('frequency (Hz)');
    title('STFT');
    colorbar;

    % input signal
    subplot(2, 1, 2);
    plot(t(i:i+frame_size-1), frame);
    xlabel('time (s)');
    ylabel('Amplitude');
    title('inut signal');
    
    pause(0.5); 
end
