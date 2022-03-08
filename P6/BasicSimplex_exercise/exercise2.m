close all;
clear; 
clc;

%Exercise2

zero = [0 0 0 0];

%First set of constraints, we have 16 variables that we have to put to zero when
%we don't use them in a constraint
first = [1 1 1 1]; 
A_first = [first zero zero zero; zero first zero zero; zero zero first zero; zero zero zero first];

%Second set of constraints
second = [320 510 630 125]; 
A_second = [second zero zero zero; zero second zero zero; zero zero second zero; zero zero zero second];

%Third set of constraints
third = [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1]; 
A_third = [third third third third];

%Objective function
c1 = [135 200 410 520];
c2 = 1.1 * c1;
c3 = 1.2 * c1;
c4 = 1.3 * c1;

%Build the problem and solve it
type = 'max';
A = [A_first; A_second; A_third];
h = [18; 32; 25; 17; 11930; 22552; 11209; 5870; 16; 32; 40; 28];
c = [c1 c2 c3 c4];
sign = [-1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1];

[z,x_B,index_B] = simplex (type,A,h,c,sign);

%Plot the cargo distribution
S = zeros(4,4);
for i = 1:6
    S(index_B(i)) = x_B(i);
end

S = transpose(S);

figure;
bar(S,'stacked');
title('Optimal Solution');
xlabel('Compartments');
ylabel('Weight (t)');
legend('Cargo 1','Cargo 2','Cargo 3','Cargo 4');

%disp (A_first);
%disp (A_third);