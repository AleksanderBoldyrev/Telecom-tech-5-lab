
A_M = 1;                                    
OMEGA = 20;                          
Ws = 500;                                 
Fs = Ws/(2*pi);                             
T = 1/Fs;                                 
t = [0:T:5*2*pi/OMEGA];                    
s_M = A_M*cos(OMEGA*t);                     

figure
plot(t, s_M);
ylim([-2 2]);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%


figure                                    
specplot(s_M, Fs); 
xlim([0 400]);
ylim([0 100]);

% AM-signal

A0=1;                                      
omega0 = 100;                               
freqdev = 10;                                   
s_AM = fmmod(s_M, OMEGA, omega0, freqdev); 

figure
hold on
plot(t, s_AM);                              
plot(t, s_M, '--', 'Color', 'red'); 
hold off

figure                                      
specplot(s_AM, Fs);  
xlim([0 250]);

f = fmdemod(s_AM, OMEGA, omega0, freqdev);

figure
plot(t, f);                     

figure                                      
specplot(f, omega0); 
xlim([0 400]);
