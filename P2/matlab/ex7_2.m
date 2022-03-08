clear all;
close all;
clc;

%diary(sprintf('ex7_2_output.txt'))
G = load('karate.adj');

%call pagerank on G passing a list of zeros as U
pagerank(zeros(34,1),G);
