% Generate extended permutation vector for coefficient matrix of the
% system of linear equations of a sudoku of order n with l rows per block
% so that first lines of coefficient matirx form are in echolon form.
%
% Ralf Poeppel, 2023-04-09
%
% Input
%   n: order of latin square
%   l: count of rows of block, must be divider of n
%
% Return
%   p. permutation vector of rows of the coefficient matrix
%
% Error abort
%   n is not divisible by l
%
function p = sdkPermutationForEcholon(n, l)
  if mod(n, l) ~= 0
    error("Order n is not divisible by l");
  end
  m = n/l; % count of columns of block

  n3 = n * 3;
  p = zeros(1, n3);
  j = 2 * n - 1 + (l - 1) * (m - 1) + 1;
  k = 1;
  for i=1:n3
    keepRow = false;
    if  i <= n
      keepRow = true;
    elseif (i > n) && (i <= 2 * n)
      if i > n + 1
        keepRow = true;
      end
    else
      ib = i - 2 * n;
      if (ib > l) && (mod(ib, l) != 1)
        keepRow = true;
      end
    end

    if keepRow == true
      p(k) = i;
      k = k + 1;
    else
      p(j) = i;
      j = j + 1;
    end
  end
end
