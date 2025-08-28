clear; close all; clc;
%intervalo de n
n=-2:5;
%Definicao do sinal de x[n]
x=[0 1 1 1 1 1 0.5 0]

% Plot do sinal discreto
% stem(n, x, 'filled', 'linewidth', 1.5);
% xlabel('n');
% ylabel('x[n]');
% title('Sinal Discreto x[n] é apresentado na figura abaixo');
% grid on;
% axis([-3, 6, -1.5,2 ])

%Criar a figura com subplot
figure

%subplot1 
%sinal original x[n]
subplot(3, 2, 1)
stem(n, x, 'filled', 'linewidth', 1.5);
xlabel('n');
ylabel('x[n]');
title('Sinal Discreto x[n] é apresentado na figura abaixo');
grid on;
axis([-3, 6, -1.5,2 ])

%subplot2
% Sinal deslocado x[n-2]
subplot(3, 2, 2)
stem(n-2, x, 'filled', 'linewidth', 1.5);
xlabel('n-2');
ylabel('x[n-2]');
title('Sinal Deslocado x[n-2]');
grid on;
axis([-5, 6, -1.5, 2]);

%subplot3
% Sinal invertido x[4-n]
subplot(3, 2, 3)
stem(4-n, x, 'filled', 'linewidth', 1.5);
xlabel('-n');
ylabel('x[4-n]');
title('Sinal Invertido x[4-n]');
grid on;
axis([-3, 8, -1.5, 2]);

%subplot4
% Sinal escalonado x[2n] (Heaviside step function)
subplot(3, 2, 4)
stem(2*n, x .* (n >= 0), 'filled', 'linewidth', 1.5);
xlabel('2n');
ylabel('x[2n] (Escalonado)');
title('Sinal Escalonado x[2n]');
grid on;
axis([-3, 9, -0.5, 1.5]);


%subplot5
% Sinal multiplicado por degrau unitario
% Definir a função degrau unitário u[2-n]
u = double(2 - n >= 0); % 1 para 2-n >= 0, 0 caso contrário
% Aplicar a função x[n]u[2-n]
y = x .* u; % Multiplicação ponto a ponto
% Criar o subplot
subplot(3, 2, 5); % Posição do subplot
stem(n, y, 'filled', 'linewidth', 1.5);
title('Gráfico de x[n]u[2-n]');
xlabel('n');
ylabel('x[n]u[2-n]');
grid on;
axis([-3, 6, -1.5, 3]);


%subplot6
% Sinal multiplicado por degrau unitario deslocado
subplot(3, 2, 6)
delta = (n == 3); % 1 em n=3, 0 caso contrário
% Aplicar a função x[n-1]
x_shifted = [0, x(1:end-1)]; % Deslocar x[n] para x[n-1]
% Multiplicar x[n-1] pela função delta[n-3]
y = x_shifted .* delta; % Multiplicação ponto a ponto
stem(n, y, 'filled', 'linewidth', 1.5);
title('Gráfico de x[n-1] \cdot \delta[n-3]');
xlabel('n');
ylabel('y[n]');
grid on;
axis([-5, 5, -0.5, 1.5]);
