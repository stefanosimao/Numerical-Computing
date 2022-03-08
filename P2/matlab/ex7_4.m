clear all;
close all;
clc;

%diary(sprintf('ex7_4_output.txt'))
M = load('karate.adj');

deg = sum(M);
L = diag(deg)- M;
[V D] = eig(L);

plot(sort(V(:,2)), '.-');
%plot(V(:,2), '.-');
[ignore p] = sort(V(:,2));
%spy(M(p,p));

disp('First Group:');
for i=1:16
    fprintf('  %2d', p(i));
end;
fprintf('\n');

disp('Second Group:');
for i=17:34
    fprintf('  %2d', p(i));
end;
disp(' ')

