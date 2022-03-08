clc;

% load meshes
load Toy_meshes;
whos;

addpaths_GP;
picture = 1;

%[W,coords] = grid5rec(10, 100);
%[W,coords] = grid5rec(100, 10);
%[W,coords] = grid5recRotate(100, 10, -45);
[W,coords] = gridt(40);
%[W,coords] = grid9(30);

%W = Smallmesh; 
%coords = Smallmesh_coords;
%W = Tapir; 
%coords = Tapir_coords;
%W = Eppstein
%coords = Eppstein_coords;


%[part1,part2] = bisection_coordinate(W, coords, picture);
%[part1,part2] = bisection_metis(W, coords, picture);
%[part1,part2] = bisection_spectral(W, coords, picture);
[part1,part2] = bisection_inertial(W, coords, picture);


number = cutsize(W,part1)

disp(number)