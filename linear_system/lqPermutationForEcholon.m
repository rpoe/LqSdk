% Generate extended permutation vector for coefficient matrix of the
% system of linear equations of a latin square of order n
% so that first lines of coefficient matirx form are in echolon form.
%
% Ralf Poeppel, 2023-04-07
%
% Input
%   n: order of latin square
%
% Return
%   p. permutation vector of rows of the coefficient matrix
%
function p = lqPermutationForEcholon(n)
  n2 = n * 2;
  p = zeros(1, n2);
  j = 1;
  for i=1:n2
    if i != n+1
      p(j) = i;
      j = j + 1;
    end
  end
  p(j) = n + 1;
end
