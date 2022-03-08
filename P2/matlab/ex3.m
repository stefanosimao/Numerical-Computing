clear all;
close all;
clc;

n = 100;

A = zeros(n,n);

A(:,1) = "x"; 
A(:,n) = "x"; 
A(1,:) = "x"; 
A(n,:) = "x"; 
A(1:n+1:end) = "x";

spy(A);

