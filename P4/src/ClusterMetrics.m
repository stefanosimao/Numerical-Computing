function [Spec_nodes,Kmeans_nodes] = ClusterMetrics(K,x_spec,x_kmeans)
%% METRICS
Spec_nodes   = 0;
Kmeans_nodes = 0;

 % 2c) Calculate the number of nodes per cluster (for k-means and spectral
 %     clustering) and plot them in a histogram.
 
% \----------------------------/
[Spec_nodes,GR1] = groupcounts(x_spec);
[Kmeans_nodes,GR2] = groupcounts(x_kmeans);

figure;
subplot(1,2,1)
x_specHistogram = histogram(x_spec,K);
title('Spectral Clustering Histogram');
subplot(1,2,2)
x_kmeansHistogram = histogram(x_kmeans,K);
title('k-means Clustering Histogram');

disp('Spectral:');
disp(Spec_nodes);
disp('Kmeans:');
disp(Kmeans_nodes);
% \----------------------------/
end