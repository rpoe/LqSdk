% Print a Matrix in nice format
%
function printMatrix(A, name)
  [r, c] = size(A);

  fprintf("\n%s\n",name);
  k = 1;
  for j = 1:c/10
    fprintf("%20d", k);
    k++;
  end
  fprintf("\n");
  k = 1;
  for j = 1:c
    if k == 10
      k = 0;
    end
    if j == c
      fprintf("%5d\n", k)
    else
      fprintf("%2d", k)
    end
    k++;
  end
  fprintf("\n");

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
  end
end
