% Cluster 2D real-world graphs with spectral clustering and compare with k-means
% USI, ICS, Lugano
% Numerical Computing 

clear all;close all;
warning OFF;

addpath ../datasets
addpath ../datasets/Meshes

 load airfoil1.mat
% load barth.mat
% load grid2.mat
% load 3elt.mat

% Specify the number of clusters
K = 4;
% Read graph
W   = Problem.A;
Pts = Problem.aux.coord;
n   = size(Pts,1);
% dummy var
%dummy_map = ones(n,1);

figure;
spy(W)
title('Adjacency matrix')
%% 2a) Create the Laplacian matrix and plot the graph using the 2nd and 3rd eigenvectors
[L,Diag] = CreateLapl(W);
% \----------------------------/

% Eigen-decomposition
% \----------------------------/
%Standard eigenvalues sorting
[V,D] = eig(L);
[d,ind] = sort(diag(D));
%Standard implementation for reordering of V and D but we only take the 2nd and 3rd eigenvectors
%and store them in matrix U
Ds = D(ind,ind);
%U = V(:,2:3);
U = V(:,1:4);
% \----------------------------/

% Plot and compare
figure;
subplot(1,2,1);
gplot(W,Pts)
xlabel('Nodal coordinates')
subplot(1,2,2);
gplot(W,U)
xlabel('TODO: Plot using Eigenvector coordinates')

%% 2b) Cluster each graph in K = 4 clusters with the spectral and the 
%      k-means method, and compare yourresults visually for each case.

% \----------------------------/
[D_spec,x_spec]     = kmeans_mod(U,K,n);
[D_kmeans,x_kmeans] = kmeans_mod(Pts,K,n);
% \----------------------------/


% Compare and visualize
figure;
subplot(1,2,1);
gplotmap(W,Pts,x_spec)
title('TODO: Plot the spectral clusters')
subplot(1,2,2);
gplotmap(W,Pts,x_kmeans)
title('TODO: Plot the K-means clusters')

%% 2c) Calculate the number of nodes per cluster
[Spec_nodes,Kmeans_nodes] = ClusterMetrics(K,x_spec,x_kmeans);
