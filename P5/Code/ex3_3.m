close all;
clear all;
clc;

load('test_data/A_test.mat');
load('test_data/b_test.mat');

A = double(A_test);
b = double(b_test);

x0 = ones(100, 1);
[x, r] = myCG(A, b, x0, 200, 10^-12 );

figure;
%Using relative residual norm
semilogy(r/norm(b));
xlabel('Iteration');
ylabel('Residual');
s = sprintf('Convergence');
title(s)

%EX 3.3.3
eig_vals = eig(A_test);
figure;
semilogy(eig_vals); 
title ('Eigenvalues') ;

cond1 = cond(A_test);
cond2 = (max(eig_vals)/(min(eig_vals)));
disp(cond1);
disp(cond2);

% >> options.format = 'pdf';
%  >> options.outputDir = pwd;
%  >> publish('assignment1.m', options)
