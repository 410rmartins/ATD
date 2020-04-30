    function calcDFT(time, values, atividade_nome)
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
    %f = abs(f);
    
    figure();
%% Values
    
    subplot(421)
    plot(time, values)
    axis tight
    xlabel('t [s]')
    ylabel('Amplitude')
    title(atividade_nome)
    
%% DFT
    
    X = fftshift(fft(values));
    m_X = abs(X);
    
    subplot(422)
    plot(f,m_X), hold on
    title('|DFT| do sinal');
    ylabel('Magnitude = |X|')
    xlabel('f [Hz]')
    axis tight
    
%% Blackman
    
    XBlackman = fftshift(fft(values.*blackman(N)));
    m_XBlackman = abs(XBlackman);

    subplot(423)
    plot(f,m_XBlackman), hold on
    title('Blackman Window');
    ylabel('Magnitude = |XBlackman|')
    xlabel('f [Hz]')
    axis tight
    
%% Gauss
    
    XGauss = fftshift(fft(values.*gausswin(N)));
    m_XGauss = abs(XGauss);
    
    subplot(424)
    plot(f,m_XGauss), hold on
    title('Gauss Window');
    ylabel('Magnitude = |XGauss|')
    xlabel('f [Hz]')
    axis tight
    
%% Hamming
    
    XHamming = fftshift(fft(values.*hamming(N)));
    m_XHamming = abs(XHamming);
    
    subplot(425)
    plot(f,m_XHamming), hold on
    title('Hamming Window');
    ylabel('Magnitude = |XHamming|')
    xlabel('f [Hz]')
    axis tight

%% Triang
    
    XTriang = fftshift(fft(values.*triang(N)));
    m_XTriang = abs(XTriang);
    
    subplot(426)
    plot(f,m_XTriang), hold on
    title('Triang Window');
    ylabel('Magnitude = |XTriang|')
    xlabel('f [Hz]')
    axis tight
    
%% Rect
    
    XRect = fftshift(fft(values.*rectwin(N)));
    m_XRect = abs(XRect);
    
    subplot(427)
    plot(f,m_XRect), hold on
    title('Rect Window');
    ylabel('Magnitude = |XRect|')
    xlabel('f [Hz]')
    axis tight

%% Kaiser
    
    XKaiser = fftshift(fft(values.*kaiser(N)));
    m_XKaiser = abs(XKaiser);
    
    subplot(428)
    plot(f,m_XKaiser), hold on
    title('Kaiser Window');
    ylabel('Magnitude = |XKaiser|')
    xlabel('f [Hz]')
    axis tight
    
%% plots normais em funcao das varias janelas

    %figure;
    
    %subplot(421)
    %plot(time, values)
    %axis tight
    %xlabel('t [s]')
    %ylabel('Amplitude')
    %title(atividade_nome)
    
    %   kaiser
    %ValuesKaiser = values.*kaiser(N);
        
    %subplot(422)
    %plot(f,ValuesKaiser), hold on
    %title('Kaiser Window');
    %ylabel('Magnitude = |ValuesKaiser|')
    %xlabel('f [Hz]')
    
    %   triang
    %ValuesTriang = values.*triang(N);
    
    %subplot(423)
    %plot(f,ValuesTriang), hold on
    %title('Triang Window');
    %ylabel('Magnitude = |ValuesTriang|')
    %xlabel('f [Hz]')
    
    %   rect
    %ValuesRect = values.*rectwin(N);
    
    %subplot(424)
    %plot(f,ValuesRect), hold on
    %title('Rect Window');
    %ylabel('Magnitude = |ValuesRect|')
    %xlabel('f [Hz]')
    
    %   hammnig
    %ValuesHamming = values.*hamming(N);
    
    %subplot(425)
    %plot(f,ValuesHamming), hold on
    %title('Hamming Window');
    %ylabel('Magnitude = |ValuesHamming|')
    %xlabel('f [Hz]')
    
    %   gauss
    %ValuesGauss = values.*gausswin(N);
    
    %subplot(426)
    %plot(f,ValuesGauss), hold on
    %title('Gauss Window');
    %ylabel('Magnitude = |ValuesGauss|')
    %xlabel('f [Hz]')
    
    %   blackman
    %ValuesBlackman = values.*blackman(N);
    
    %subplot(427)
    %plot(f,ValuesBlackman), hold on
    %title('Blackman Window');
    %ylabel('Magnitude = |ValuesBlackman|')
    %xlabel('f [Hz]')
end