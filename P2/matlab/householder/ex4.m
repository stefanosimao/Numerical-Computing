clear all;
close all;
clc;

%diary(sprintf('ex4_output.txt'))
%variable A is the sparse matrix 
load('housegraph');
%spy(A);

%let's set all diag elements to zero by first extracting all elems from the
%diag and then building a diag matrix with only these elems. Finally
%subtract this matrix from the original
A = A - diag(diag(A));

%return the row and column of each nonzero element 
[row,column] = find(A);

%count how many instances of the same number in column
[CN, VL] = groupcounts(column);

%sort CN and VL in descending order using CN
B = sortrows([CN, VL],1, 'descend');
disp(row);
%size of B
[l,o] = size(B);

%loop over B and name to retrieve the author's name and the degree
% for i=1:2
%     str = sprintf('Author: %s Degree: %d \n ', name(B(i,2),:), B(i,1));
%     disp(str);
%     
%     %search in column for all elements corresponding to the degree of the
%     %current loop, multiply this elementwise with row in order to only have
%     %the list of indexes corresponding to the coauthors
%     c = (row .*(column==B(i,2)));
%     %disp(c);
%     %remove zero elements
%     c = c(c~=0);
%     loop over the coauthors list and search for their names, print them
%     for j=1:size(c)
%         disp(name(c(j),:));
%     end
% 
%     disp('__________________________________________________');
% end
