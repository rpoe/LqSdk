% Print a Matrix in nice format
%
function printMatrix(A, name)
  fprintf("\n%s\n",name);
  [r, c] = size(A);
  for i = 1:r
    for j = 1:c
      if j == 1
        fprintf("%2d", A(i, j));
      elseif j == c
        fprintf("%5d\n", A(i,j));
      else
        fprintf("%2d", A(i, j));
      end
    end
  endfor
