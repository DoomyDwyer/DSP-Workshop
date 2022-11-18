%% This is a sampling script
close, clc, clear

%% signal generation

duration = 0.01; 
dt = 0.0001; %time step (how often we compute a sample)
t = 0:dt:duration; %x-axis (time)
f = 500; %frequency
x_t = sin(2 * pi * f * t); %continuous time sinusoid


% plotting code
figure(1)
subplot(3, 1, 1) % subplot 1
plot(t ,x_t, 'linewidth',1.5)
xlim([0 0.01]) % limit the x-axis
title('Continuous Time Sinusoid x(t) (500Hz)')
xlabel('time (s)')
ylabel('amplitude')
legend('x(t)', 'Location', 'eastoutside', 'Box', 'off')
grid on
% hold on

%% sampling

Fs = 2000; % sampling frequency 
Ts = 1/Fs; % sampling period
n = 0:Ts:duration; % x-axis (samples)
x_n = sin(2 * pi * f * n); % discrete time sinusoid

% plotted 
subplot(3, 1, 2) % subplot 2
plot(t ,x_t, 'linewidth',1.5)
hold on
stem(n, x_n, 'g', 'linewidth',1.5) % for 'discrete' 
xlim([0 0.01]) % limit the x-axis 
hold off
grid on
title('Sampled Sinusoid x[n] (500Hz)')
xlabel('n')
ylabel('amplitude')
legend('x(t)', 'x[n]', 'Location', 'eastoutside', 'Box', 'off')
% sound(x_n)

%% reconstruction

t_r = linspace(0, max(n), (max(n)/dt)); %x-axis (reconstructed time axis)
y_t = interp1(n, x_n, t_r, "spline"); %reconstructed continous time sinusoid

%plotting code
subplot(3, 1, 3) % subplot 3
plot(t_r, y_t,'r','linewidth',1.5) 
grid on
title('Reconstructed Sinusoid x[n] (500Hz)')
xlabel('time (s)')
ylabel('amplitude')
legend('x(t)', 'Location', 'eastoutside', 'Box', 'off')
xlim([0 0.01]) %limit x-axis
% sound(x_n)

%% Add FFT Code here to verify 
