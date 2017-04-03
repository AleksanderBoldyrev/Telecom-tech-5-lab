Fs = 8e4; 
T = 4; 
t = 0:1/Fs:T;
F = 1000;                % Modulating sig. freq.
s_M = cos(2*pi*F*t); 
figure
plot(t, s_M)
Fc = 1.5e3;             % Carrier frequency
s_PM_1 = pmmod(s_M, Fc, Fs, 0.1); 
s_PM_2 = pmmod(s_M, Fc, Fs, 10); 
figure;
subplot(1, 2, 1);
plot(t(1:200), s_PM_1(1:200));
ylim([-1.1 1.1]);
title('\beta=0.1');
subplot(1, 2, 2);
plot(t(1:200), s_PM_2(1:200));
ylim([-1.1 1.1]);
title('\beta=10');

N = floor(length(t)/2);
f = (0:N)/length(t) * Fs; 
spec_PM_1 = fft(s_PM_1); 
spec_PM_2 = fft(s_PM_2);
figure
subplot(1, 2, 1)
plot(f, abs(spec_PM_1(1:N+1)))
title('\beta=0.1')
subplot(1, 2, 2)
plot(f, abs(spec_PM_2(1:N+1)))
title('\beta=10')

f = pmdemod(s_PM_2, Fc, Fs, 10);

figure
plot(t, f); 