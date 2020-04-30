function passosPerSecond = calcPassos(values,tipo)
    typeLabels = {'W','W-U','W-D','SIT','STAND','LAY','STAND-SIT','SIT-STAND','SIT-LIE','LIE-SIT','STAND-LIE','LIE-STAND'};
    
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
    
    max_val = max(findpeaks(m_X));
    [pks, los] = findpeaks(m_X, 50, 'MinPeakHeight', max_val-(max_val*0.3));
    
    [pks1, los1] = findpeaks(m_X);
    pks = pks(length(pks)/2 + 1 : end);
    picoY = find(pks1 == pks(1));
    passosPerSecond = f(los1(max(picoY)));
    
%     X = fftshift(fft(values))/N;
%     m_X = abs(X);
%     ind = find(f >= 0);
%     m_X(find(m_X==max_val))/sum(m_X(ind));
    

end