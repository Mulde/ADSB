%%Øvelse 1 ADSB System identifikation
% Mads Halkjær Villadsen
clear; close all; format compact; clc;

%% erklæring af faste variabler.
N = 1000;
b = [0.67; 0.21];
%% task 1
%generate the signal x(k) in matlab using randn
xin = randn(N,1);
%xin = 0:100;
%% task 2
%generate d(k) using matlabs filter function
d = filter(b,1,xin); % desired signal

%% task 3
%implement the LMS algorithm by making a loop that adapts the filter 
%coefficents using the LMS algorithm
%store e(k) and w(k) an arrays so the evolution after completion
M = 2;
mu = 0.005;
x_delay = zeros(M,N);
w = zeros(M,N);
y = zeros(1,N);
e = zeros(1,N);
%loop
for n=M:N
    x_delay = xin(n:-1:n-(M-1));            %fill delay line
    y(n) = w(:,n)'*x_delay;                 %calculate output
    e(n) = d(n) - y(n);                     %calculate error
    w(:,n+1) = w(:,n)+2*mu*e(n)*x_delay;    %update coefficents
end

w = w(:,1:N);
w0 = w(:,end);

%% task 4
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

disp(['Identified system: ' num2str(round(w0',3))])

figure
plot(n,d,n,y,n,e)
title('Desired signal vs. output from filter')
xlabel('iteration, n')
legend('d(n)','y(n)','e(n)')
grid