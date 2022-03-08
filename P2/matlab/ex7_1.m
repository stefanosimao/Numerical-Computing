clear all;
close all;
clc;

%diary(sprintf('ex7_1_output.txt'))
%load data
X = load('karate.adj');

%sum of each column
sumC = sum(X);

%sort the sums and pick first 5
sortedSumC = sort(sumC, 'descend');
topFive = sortedSumC(1:5);

for i = 1 : 5
    %find nodes by comparing the sum of the columns with the current node
    %and then retrieving the column number with 'find'
    node = find(sumC == topFive(i)); 
    
    %print
    fprintf('%d: Node %d\n', i, node);
    fprintf('   Degree: %d\n\n', topFive(i));
end

