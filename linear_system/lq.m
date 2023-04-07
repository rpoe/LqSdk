% Generate extended coefficient matrix of the
% system of linear equations of a latin square of order n.
%
% Ralf Poeppel, 2023-01-05, last update 2023-04-07
%
% Input
%   n: order of latin square
%
% Return
%   Bc: extended coefficient matrix
%
function [Bc Br rk] = lq(n)
  c = n*(n+1)/2;
  Bc = zeros(2*n, n*n+1);

  % columns
  for i = 1:n
    for j = 1:n
      Bc(i, (j-1)*n+i) = 1;
    end
  end

  % rows
  for i = 1:n
    for j = 1:n
      Bc(i+n, j+n*(i-1)) = 1;
    end
  end

  % right side
  j = n*n+1;
  for i = 1:2*n
    Bc(i, j) = c;
  end

end
