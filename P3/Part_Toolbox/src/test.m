function test()

A = blkdiag (ones (5), ones (5));

A(1, 10) = 1; A(10, 1) = 1 ; A(5, 6) = 1; A(6, 5) = 1;

[map , edgecut] = metismex ('PartGraphRecursive' , sparse(A), 2);


disp(map)
disp(edgecut)