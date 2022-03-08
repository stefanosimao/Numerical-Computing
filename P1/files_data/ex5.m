clear all;
close all;
clc;

myU = {
    'http://www.alpha.com'
    'http://www.beta.com'
    'http://www.gamma.com'
    'http://www.delta.com'
    'http://www.rho.com'
    'http://www.sigma.com'};

i = [2 6 3 4 4 5 6 1 1];
j = [1 1 2 2 3 3 3 4 6];

n = 6;
myG1 = sparse(i,j,1,n,n);
full(myG1)

pagerank(myU, myG1)

%pagerank(myU, myG, 0.95);