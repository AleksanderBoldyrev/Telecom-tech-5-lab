
A_M = 1;                                    
OMEGA = 1;                          
Ws = 50;                                 
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

% AM-signal

A0=1;                                      
omega0 = 10;                               
phi0 = 2.5;                                   
s_AM = pmmod(s_M, OMEGA, omega0, phi0); 

figure
hold on
plot(t, s_AM);                              
plot(t, s_M, '--', 'Color', 'red'); 
hold off

figure                                      
specplot(s_AM, Fs);      

f = pmdemod(s_AM, OMEGA, omega0, phi0);

figure
plot(t, f);                     

figure                                      
specplot(f, OMEGA); 
