clear all;close all;clc

a = randi(10,1,100);
%a = [1 2 3 4 8 8 8 8 8 8 1 0 10 1];
N = length(a);
parameter = 100;


f = zeros(3,10);
for n = 1 : 10 % drawn number
    p = 0;
    for i = 1 : N % check how many times it occurs
        if(a(i) == n)
        p = p + 1;
        end
    end
    f(1,n) = n;%number
    f(2,n) = p;%number of its occurrences
end

aa = zeros(1,10); % rewriting one row to a new matrix, needed to count probability
for i = 1 : 10
    aa(i) = f(2,i);
end

for i = 1 : 10
    f(2,i) = f(2,i)/sum(aa,'all'); %probability matrix with number of occurrences
end

ff = sortrows(f.',2, 'descend');
ff = ff'; % sorting from largest to smallest element in terms of probability 


for i = 1 : length(aa) 
c = (2^i) ;
ff(3,i) = (2^i)-2;
end

huffman = zeros(1,length(aa));

for i = 1 : length(aa)
g = ff(3,i);
g_char = decimalToBinaryVector(g);
g_bin = convertCharsToStrings(g_char);
%huffman(i) = g_bin;
end

ff(3,end) = (2^10)-1;

sequence_encoded = zeros(1,N);
for i = 1 : N % draws a number to encode
    number_to_encode = a(i); % number I'm going to code
    for j = 1 : length(ff)
        number_that_code_wants_to_have = ff(1,j);
        if(number_to_encode == number_that_code_wants_to_have)
            sequence_encoded(i) = ff(3,j);
            break
        end
    end
end



