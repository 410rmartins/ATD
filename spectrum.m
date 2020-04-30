function spectrum(data, fs, window_size, overlap, matriz_atividade)

    typeLabels = {'W','W-U','W-D','SIT','STAND','LAY','STAND-SIT','SIT-STAND','SIT-LIE','LIE-SIT','STAND-LIE','LIE-STAND'};
    
    Nframe = round(window_size*fs);
    Noverlap = round(window_size*overlap*fs);
    
    Tframe = window_size;
    toverlap = window_size * overlap;
    
    h = hamming(Nframe);
    %h = gausswin(Nframe);
    %h = kaiser(Nframe);
    N = numel(data);
    
    t=linspace (0,(N-1)/fs,N);
    
    if(mode(N,2)==0)
        %se o numero de pontos do sinal for par
        f_frame=-fs/2:fs/Nframe:fs/2-fs/Nframe;
    else
        %Se o numero de pontos do sinal for impar
        f_frame=-fs/2+fs/(2*Nframe):fs/Nframe:fs/2-fs/(2*Nframe);
    end
    
    espetro = [];
    nframes = 0;
    t_frames=[];
    
    freq = linspace(-fs/2,fs/2,Nframe);
    
    x = find(freq >= 0);
    for ii=1:Nframe-Noverlap:N-Nframe
        %aplicar a janela ao sinal do tempo
        x_frame=data(ii:ii+Nframe-1).*h;
        
        %obter a magnitude do sinal
        m_X_frame=abs(fftshift(fft(x_frame)));


        espetro = horzcat(espetro,m_X_frame(x));
    end
    

    
    figure;
    imagesc(20*log10(espetro));
    colorbar;
    set(gca,'YDir','normal');
    
    figure()
    spectrogram(data,Nframe,Noverlap,[],fs,'yaxis')
    title('spectrogram function')




end