% »сходный сигнал
x = 0:0.01:2*pi;
y = sin(2*pi*x);
 
figure
subplot(2,1,1)
plot(x, y)
grid
title('»сходный сигнал')
 
% „астотна€ модул€ци€
Fs = 50;                      % „астота дискретизации
Fc = 4*2;                         % Ќесуща€ частота
freqdev = 1;                    % ƒевиаци€ частоты дл€ частотной модул€ции
y_fmod = fmmod(y,Fc,Fs,freqdev);        % „астотна€ модул€ци€
subplot(2,1,2)
plot(x, y_fmod)
grid
title('„астотна€ модул€ци€')
spectrum = fft(y_fmod, 512);      % —пектр частотной модул€ции
norm_spectrum = spectrum.*conj(spectrum)/512;  
f = 100*(0:255)/512;
figure
plot(f, norm_spectrum(1:256))
grid
title('—пектр частотной модул€ции')
axis([min(f) max(f) 0 30]);
y_fdemod = fmdemod(y_fmod,Fc,Fs,freqdev);       % ƒемодул€ци€
figure
plot(x, y_fdemod)
grid
title('„астотна€ демодул€ци€')
axis([min(x) max(x) -2 2]);