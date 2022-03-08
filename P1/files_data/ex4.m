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

i = [2 3 3 4 4 1 6 5];
j = [1 1 2 2 3 4 5 6];

n = 6;
myG = sparse(i,j,1,n,n);
full(myG)

pagerank(myU, myG)

%pagerank(myU, myG, 0.95);