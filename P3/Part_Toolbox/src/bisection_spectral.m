function [part1,part2] = bisection_spectral(A,xy,picture)
% bisection_spectral : Spectral partition of a graph.
%
% [part1,part2] = bisection_spectral(A) returns a partition of the n vertices
%                 of A into two lists part1 and part2 according to the
%                 spectral bisection algorithm of Simon et al:  
%                 Label the vertices with the components of the Fiedler vector
%                 (the second eigenvector of the Laplacian matrix) and partition
%                 them around the median value or 0.


% 
% disp(' ');
% disp(' Numerical Computing @ USI Lugano:   ');
% disp(' Implement inertial bisection');
% disp(' ');


% Steps
% 1. Construct the Laplacian.
G = graph(A);
L = laplacian(G);

% 2. Calculate its eigensdecomposition. Returns the k smallest magnitude eigenvalues.
[V,D] = eigs(L,2,'smallestabs');
w = V(:,2);

% 3. Label the vertices with the components of the Fiedler vector.
% 4. Partition them around their median value, or 0.
len = size(w,1);
median = sum(w)/len;
part1 = [];
part2 = [];

for i = 1:len
    if w(i) < median
        part1 = [part1 i] ;
    else 
        part2 = [part2 i] ;
    end
end


% <<<< Dummy implementation to generate a partitioning
% n = size(A,1);
% map = zeros(n,1);
% map(1:round((n/2))) = 0; 
% map((round((n/2))+1):n) = 1;
% [part1,part2] = other(map);

if picture == 1
   gplotpart(A,xy,part1);
   title('Spectral bisection using the Fiedler Eigenvector');
 end

% Dummy implementation to generate a partitioning >>>>


end
