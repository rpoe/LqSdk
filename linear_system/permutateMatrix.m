% Permutate matrix rows as given by a permutation vector.
%
% Ralf Poeppel, 2023-01-07
%
% Input
%   A: matrix, to permutate
%   p: permutation vector
%
% Return
%   B: permutated matrix
%
% Error abort
%   length of vector p differs from count of rows of A
%
function B = permutateMatrix(A, p)
  [r, c] = size(A);
  n = length(p);
  if r != n 
    error("length of vector p differs from count of rows of A");
  end
  
  B = zeros(r, c);
  for i=1:n
    B(i,:) = A(p(i),:);
  end
end
  