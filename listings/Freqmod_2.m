% �������� ������
x = 0:0.01:2*pi;
y = sin(2*pi*x);
 
figure
subplot(2,1,1)
plot(x, y)
grid
title('�������� ������')
 
% ��������� ���������
Fs = 50;                      % ������� �������������
Fc = 4*2;                         % ������� �������
freqdev = 1;                    % �������� ������� ��� ��������� ���������
y_fmod = fmmod(y,Fc,Fs,freqdev);        % ��������� ���������
subplot(2,1,2)
plot(x, y_fmod)
grid
title('��������� ���������')
spectrum = fft(y_fmod, 512);      % ������ ��������� ���������
norm_spectrum = spectrum.*conj(spectrum)/512;  
f = 100*(0:255)/512;
figure
plot(f, norm_spectrum(1:256))
grid
title('������ ��������� ���������')
axis([min(f) max(f) 0 30]);
y_fdemod = fmdemod(y_fmod,Fc,Fs,freqdev);       % �����������
figure
plot(x, y_fdemod)
grid
title('��������� �����������')
axis([min(x) max(x) -2 2]);