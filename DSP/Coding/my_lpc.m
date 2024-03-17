function lpc_coefficients = my_lpc(signal, order)
   if size(signal, 1) < size(signal, 2)
        signal = signal';
    end

    % signal length
    N = length(signal);

    % Initialization of the autocorrelation matrix
    R = zeros(order + 1, 1);

    % calculation of autocorrelation
    for k = 0:order
        R(k + 1) = sum(signal(1:N - k) .* signal(k + 1:N));
    end

    % Initialization of the vector of resulting LPC coefficients
    lpc_coefficients = zeros(order, 1);

    a = zeros(order, 1);

    %calculation of LPC coefficients
    for p = 1:order
        k_sum = 0;
        for j = 1:p - 1
            k_sum = k_sum + lpc_coefficients(j) * R(p - j + 1);
        end
        a(p) = (R(p + 1) - k_sum) / R(1);

        %data update
        for j = 1:p - 1
            a(j) = lpc_coefficients(j) - a(p) * lpc_coefficients(p - j);
        end
        lpc_coefficients = a(1:p);
    end
end