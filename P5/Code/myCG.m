function [x,rvec]=myCG(A,b,x0,max_itr,tol)
%Conjugate Gradient method

%Initialization
x = x0;
rvec = [];

%Algorithm as in the sheets
r = b - A * x0;
d = r;
p_old = dot(r,r);
i = 0;
%rvec(i) = norm(r);

%Loop stops if max_iter is reached or when relative residual norm (as used in the Example 7.10 of the book
%and also in Matlab for pcg)is smaller than tol
while (i <= max_itr && norm(r)/norm(b) >= tol)
    s = A * d;
    alpha = p_old / dot(d, s);
    x = x + alpha * d;
    r = r - alpha * s;
    p_new = dot(r,r);
    beta = p_new/p_old;
    d = r + beta * d;
    p_old = p_new;
    
    i = i + 1;
    rvec(i) = norm(r);
end
end
