function freqMax = calcFreqMax(time, values, atividade_nome)
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
    
    [pks, los] = findpeaks(m_X);
    maxPassos = max(pks);
    freq = find(pks == maxPassos);
    freqMax = f(los(max(freq)));
end