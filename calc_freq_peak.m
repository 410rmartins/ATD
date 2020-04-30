function peak_freq = calc_freq_peak(values)
    values = detrend(values);    
    N = numel(values);
    fs = 50;
    
    %calcular o vetor de frequencias
    if(mod(N,2)==0)
        %se o numero de pontos do sinal for par
        f=-fs/2:fs/N:fs/2-fs/N;
    else
        %Se o numero de pontos do sinal for impar
        f=-fs/2+fs/(2*N):fs/N:fs/2-fs/(2*N);
    end
    f = abs(f);
    
    X = fftshift(fft(values));
    m_X = abs(X);
    
    peak_freq = max(findpeaks(m_X));
    
end