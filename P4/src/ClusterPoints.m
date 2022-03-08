% Cluster 2D pointclouds with spectral clustering and compare with k-means
% USI, ICS, Lugano
% Numerical Computing 

clear all;
close all;
warning OFF;

addpath ../datasets
addpath ../datasets/Meshes

% Specify the number of clusters
K = 2;
%K = 4;

%% 1a) Get coordinate list from pointclouds
% \----------------------------/
  [Points,~,~,~,~,~] = getPoints();
  %[~,Points,~,~,~,~] = getPoints(); 
  %[~,~,Points,~,~,~] = getPoints(); 
  %[~,~,~,Points,~,~] = getPoints(); 
  %[~,~,~,~,Points,~] = getPoints(); 
  %[~,~,~,~,~,Points] = getPoints(); 
% \----------------------------/
% Coords used in this script

%Pts_dummy = [rand(1,100)*5;rand(1,100)*5]';
figure;
%scatter(Pts_dummy(:,1),Pts_dummy(:,2))
scatter(Points(:,1),Points(:,2))
title('TODO: Get the coordinate list from the function getPoints.m')

n = size(Points,1);
%n = size(Pts_dummy,1);
% dummy vars
%dummy_map     = ones(n,1);
%dummy_epsilon = 1;

% Create Gaussian similarity function
%[S] = similarityfunc(Pts_dummy(:,1:2));

[S] = similarityfunc(Points(:,1:2));
%[S] = similarityfunc(Points(:,1:2), 2*log(n));

%% 1b) Find the minimal spanning tree of the full graph. Use the information
%      to determine a valid value for epsilon        
% \----------------------------/
%Length of the longest edge in a minimal spanning tree of the fully connected graph on the data points
 spyral_mst = minSpanTree(S);
 spy(spyral_mst);
 %using 'max' one time gives the max of each column, the second time the
 %max  edge of the MST
 epsilon = max(max(spyral_mst));
% \----------------------------/

%% 1c) Create the epsilon similarity graph
%[G] = USI_epsilonSimGraph(dummy_epsilon,Pts_dummy);
% \----------------------------/
[G] = epsilonSimGraph(epsilon,Points(:,1:2));
% \----------------------------/

%% 1d) Create the adjacency matrix for the epsilon case
% \----------------------------/
 W = S .* G;
% \----------------------------/
figure;
gplotg(W,Points(:,1:2))
title('TODO: Visualize the correct adjacency matrix')

%% 1e) Create the Laplacian matrix and implement spectral clustering
[L,Diag] = CreateLapl(W);

% \----------------------------/
%Standard eigenvalues sorting
[V,D] = eig(L);
[d,ind] = sort(diag(D));
%Standard implementation for reordering of V and D but we only take the K
%smallest eigenvectors and store them in matrix U
Ds = D(ind,ind);
U = V(:,1:K);
% \----------------------------/

% Cluster rows of eigenvector matrix of L corresponding to K smallestÍ
% eigennalues. Use kmeans for that.
[D_spec,x_spec]     = kmeans_mod(U,K,n);

%% 1f) Run K-means on input data
% \----------------------------/
[D_kmeans,x_kmeans] = kmeans_mod(Points,K,n);
% \----------------------------/
%[D_kmeans,x_kmeans] = kmeans_mod(Pts_dummy,K,n);

%% 1g) Visualize spectral and k-means clustering results
figure;
subplot(1,2,1)
gplotmap(W,Points(:,1:2),x_spec)
title('TODO: Plot the spectral clusters')
subplot(1,2,2)
gplotmap(W,Points(:,1:2),x_kmeans)
title('TODO: Plot the K-means clusters')