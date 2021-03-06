Fs = 8e3; 
T = 33; 
t = 0:1/Fs:T;
F_n = 0.15; 
s_M = cos(2*pi*F_n*t); 
figure
plot(t, s_M)
Fc = 2e3; 
s_FM_1 = fmmod(s_M, Fc, Fs, 0.1); 
s_FM_2 = fmmod(s_M, Fc, Fs, 1000);
% figure
% subplot(1, 2, 1)
% plot(t(1:200), s_FM_1(1:200))
% ylim([-1.1 1.1])
% title('\beta=0.1')
% subplot(1, 2, 2)
% plot(t(1:200), s_FM_2(1:200))
% ylim([-1.1 1.1])
% title('\beta=1000')

figure
plot(t, s_FM_1);


N = floor(length(t)/2);
f = (0:N)/length(t) * Fs; 
spec_FM_1 = fft(s_FM_1); 
spec_FM_2 = fft(s_FM_2);
figure
subplot(1, 2, 1)
plot(f, abs(spec_FM_1(1:N+1)))
title('\beta=0.1')
subplot(1, 2, 2)
plot(f, abs(spec_FM_2(1:N+1)))
title('\beta=1000')

f = fmdemod(s_FM_2, Fc, Fs, 1000);

figure
plot(t, f); 

figure                                      
specplot(f, F_n); 
