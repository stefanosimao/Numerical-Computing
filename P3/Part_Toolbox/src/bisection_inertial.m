function [part1,part2] = bisection_inertial(A,xy,picture)
% INERTPART : Inertial partition of a graph.
%
% p = inertpart(A,xy) returns a list of the vertices on one side of a partition
%     obtained by bisection with a line or plane normal to a moment of inertia
%     of the vertices, considered as points in Euclidean space.
%     Input A is the adjacency matrix of the mesh (used only for the picture!);
%     each row of xy is the coordinates of a point in d-space.
%
% inertpart(A,xy,1) also draws a picture.
%
% See also PARTITION


disp(' ');
disp(' Numerical Computing @ USI Lugano:   ');
disp(' Implement inertial bisection');
disp(' ');

[n,m] = size(xy);

% Steps
% 1. Calculate the center of mass.
xm = sum(xy(:, 1)) / n;
ym = sum(xy(:, 2)) / n;

% 2. Construct the matrix M.
%  (Consult the pdf of the assignment for the creation of M) 
x1 = sum((xy(:,1)-xm).^2);
x2 = sum((xy(:,1)-xm .* (xy(:,2)-ym)));
x3 = sum((xy(:,2)-ym).^2);

M = [x1, x2; x2, x3];

% 3. Calculate the smallest eigenvector of M.  
[smallest_evector,smallest_evalue] = eigs(M, 1,'smallestabs');
 n_ev = smallest_evector/norm(smallest_evector);
 
% 4. Find the line L on which the center of mass lies.
L = [-n_ev(2) n_ev(1)];

% 5. Partition the points around the line L.
%   (you may use the function partition.m)
[part1, part2] = partition(xy, L);


% <<<< Dummy implementation to generate a partitioning
% n   = size(A,1);
% map = zeros(n,1);
% map(1:round((n/2)))     = 0; 
% map((round((n/2))+1):n) = 1;
% [part1,part2] = other(map);
% Dummy implementation to generate a partitioning >>>>

if picture == 1
    gplotpart(A,xy,part1);
    title('Inertial bisection using the Fiedler Eigenvector');
end
 
% gplotg(A,xy);


end
