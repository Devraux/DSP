clear all;close all;clc
s = [1 2 4 5 6 1 1 1 1 1 1];
h = [7 8 9 3 0 10 1 2 3];
H = h;
ls = length(s);
lh = length(h);

h = flip(h);
if ls > lh
    h = [zeros(1,ls-lh) h];
end

if lh > ls
    s = [s zeros(1,lh-ls)];
end
N = 100; %zz
convolution = zeros(1,length(h));
unlimited_conv = zeros(1,N);

for i = 0 : length(h) - 1
vector_1 = h(end-i:end);
vector_2 = h(1:end-i-1);
vector = [vector_1 vector_2];
convolution(i+1) = sum(vector .* s,"all");
end 

counter = 1;
for i = 1 : N
    unlimited_conv(i) = convolution(counter);
    counter = counter + 1;
    if counter >= length(convolution) + 1 
        counter = 1;
    end
end

figure(1)
subplot(3,1,1)
plot(convolution,"-o",LineWidth=2)
subplot(3,1,2)
plot(cconv(H,s,11),"-o",LineWidth=2)
subplot(3,1,3)
plot(unlimited_conv,"-o",LineWidth=2);
