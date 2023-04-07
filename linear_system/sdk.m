% Generate extended coefficient matrix of the
% system of linear equations of a sudoku of order n.
%
% Ralf Poeppel, 2023-01-05, last update 2023-04-07
%
% Input
%   n: order of sudoku
%   l: count of rows of block, must be divider of n
%
% Return
%   Bc: extended coefficient matrix
%
% Error abort
%   n is not divisible by l
%
function Bc = sdk(n, l)
  if mod(n, l) ~= 0
    error("Order n is not divisible by l");
  end
  m = n/l; % count of columns of block
  
  c = n*(n+1)/2; % right side
  Bc = zeros(3*n, n*n+1); % extended coefficient matrix
  
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
  
  % blocks
  eqio = 2*n;
  for no = 0:m-1
    nio = eqio + no*l;
    njo = no*n*l;
    for mo = (0:l-1)
      i = nio + mo + 1;
      nmjo = njo+mo*m;
      for lo = n*(0:l-1)
        nmljo = nmjo + lo;
        for ja = 1:m
          j = nmljo + ja;
          Bc(i,j) = 1;
        end
      end
    end
  end
  
  % right side
  j = n*n+1;
  for i = 1:3*n
    Bc(i, j) = c;
  end

end