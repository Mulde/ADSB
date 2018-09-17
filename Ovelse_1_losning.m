%% E5ADSB Exercise 1 - System Identification
% KPL 2018-08-27
clear; close all; format compact; clc; 

%% Initialization
N = 1000;
b = [0.67; 0.21];  % "unknown system" coefficients

%% Task 1
xin = randn(N,1);    % input signal

%% Task 2
d = filter(b,1,xin); % desired signal

%% Task 3 - LMS filter algorithm

% Initialization
M  = 3;          % filter size - best guess...
mu = 0.005;      % step-size
x  = zeros(M,N); % delay line init.
w  = zeros(M,N); % coeff. init.
e  = zeros(1,N); % error vector
y  = zeros(1,N); % output vector  

% LMS loop
for n = M:N
    x = xin(n:-1:n-(M-1));           % fill delay line
    y(n) = w(:,n)'*x;                % calculate output
    e(n) = d(n) - y(n);              % calculate error
    w(:,n+1) = w(:,n) + 2*mu*e(n)*x; % update coefficients
end
w = w(:,1:N);
wo = w(:,end);

%% Task 4 - plotting
figure
n = 0:N-1;
subplot(2,1,1), plot(n,w)
title('Convergence of filter coefficients')
ylabel('w(n)')
legend('w_0(n)','w_1(n)','w_2(n)','location','best')
grid
subplot(2,1,2), plot(n,10*log10(e.^2)), axis tight
title('Squared error')
xlabel('iteration, n'), ylabel('e^2(n) [dB]')
grid

disp(['Identified system: ' num2str(round(wo',3))])

figure
plot(n,d,n,y,n,e)
title('Desired signal vs. output from filter')
xlabel('iteration, n')
legend('d(n)','y(n)','e(n)')
grid

