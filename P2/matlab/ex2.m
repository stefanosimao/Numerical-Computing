clear all;
close all;
clc;


load ('A_SymPosDef');

%Original matrix
spy(A_SymPosDef);


%Reverse Cuthill-McKee permuted matrix
%r = symrcm(A_SymPosDef);
%spy(A_SymPosDef(r,r))


%Cholesky factor of the original matrix
%spy(chol(A_SymPosDef));


%Cholesky factor of the Reverse Cuthill-McKee permuted matrix
%r = symrcm(A_SymPosDef);
%spy(chol(A_SymPosDef(r,r)))
