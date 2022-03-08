clear all;
close all;
clc;

%diary(sprintf('ex5_output.txt'))
%variable A is the sparse matrix 
load('housegraph');

%let's set all diag elements to zero by first extracting all elems from the
%diag and then building a diag matrix with only these elems. Finally
%subtract this matrix from the original
A = A - diag(diag(A));

%return the row and column of each nonzero element 
[row,column] = find(A);

%multiplying the two rows corresponding to the coauthors of the two
%authors we have a row with common coauthors. With 'find' we retrieve 
%the indices of these coauthors and then their name
names1 = name(find(A(Golub,:).* A(Moler,:)),:);
names2 = name(find(A(Golub,:).* A(Saunders,:)),:);
names3 = name(find(A(TChan,:).* A(Demmel,:)),:);

[n,m] = size(names1);
fprintf('Golub and Moler common coauthors (%d): \n \n',n);
disp(names1)
disp('__________________________________________________');

[n,m] = size(names2);
fprintf('\nGolub and Saunders common coauthors (%d): \n \n',n);
disp(names2)
disp('__________________________________________________');

[n,m] = size(names3);
fprintf('\nTChan and Demmel common coauthors (%d): \n \n',n);
disp(names3)
disp('__________________________________________________');

disp(A(Saunders,:));
