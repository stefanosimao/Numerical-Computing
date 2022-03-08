close all;
clear all;
clc;

%Load Data
load('blur_data/B.mat');
load('blur_data/A.mat');
B = double(B);
A = double(A);

%Original
figure
imshow(B)
title('Blured Image')

%Vectorize the image (row by row)
b = B';
b = b(:);

%Pre-multiplication
b = A' * b;
A = A' * A;

%Init
x0 = ones(62500, 1);

%CG
[x1, r] = myCG(A, b, x0, 200, 10^-6 );

%Devectorize and tilt
x1 = reshape(x1, 250, 250);
x1 = x1';

figure;
imshow(x1);
title('Conjugate Gradient')

figure;
semilogy(r/norm(b));
xlabel('Iteration');
ylabel('Residual');
s = sprintf('Convergence CG');
title(s)

% incomplete cholesky for preconditioning
M = ichol(A, struct('type', 'nofill', 'diagcomp', 0.01));

%PCG
[x2, flag, relres, iter, resvec] = pcg(A ,b , 1e-6, 200, M, M', x0);

x2 = reshape(x2, 250, 250);
x2 = x2';

figure;
imshow(x2);
title('PCG')

figure;
semilogy(resvec/norm(b));
xlabel('Iteration');
ylabel('Residual');
s = sprintf('Convergence PCG');
title(s)
