% Convert a Matrix to echolon form,
% but take no effort to compute diagonal form.
% Apply only the minimal number of changes to the matrix.
%
% Ralf Poeppel, 2023-04-01
%
% input parameter
%   A: 2 dimensional matrix
%
% return values
%   A: matrix in echolon form
%   rk: rank of the matrix
%
function [A rk] = echolonForm(A)
  [rows, cols] = size(A);
  rk = rows;

  if rows <= 1 
    rk = rank(A);
    if rows == 1 && A(1,1) != 0
      pivot = A(1,1);
      A(1,:) = A(1,:) / pivot;
    end
    return;
  end

  rk = 0;
  % start with pivot column 1
  pivcol = 1;
  % iterate over all rows for the pivot
  for pivrow = 1:rows
    % iterate over remaining columns after pivcol
    fnzc = 0; % first non zero column
    for pc = pivcol:cols
      % determine the first non zero element in current column from pivrow
      fnzr = 0;
      for pr = pivrow:rows
        if A(pr, pc) != 0
          fnzr = pr;
          break;
        end
      end
      
      if fnzr == 0
        % column is already in echolon form, next column
        continue;
      end
      
      % pivot element determined
      fnzc = pc;
      break;
    end
    
    if fnzc == 0
      % row is zero, we are done
      return;
    end
    rk = rk + 1;
    pivot = A(fnzr, fnzc);
    
    % norm current pivot row
    A(fnzr,fnzc:cols) = A(fnzr,fnzc:cols) / pivot;
    
    % subtract current row from following rows
    for r = (fnzr + 1):rows
      first = A(r, fnzc);
      if first != 0
        A(r, fnzc) = 0;
        for c = (fnzc + 1):cols
          A(r, c) = A(r, c) - first * A(fnzr, c);
        end
      end
    end
    
    % row is not next row swap rows
    if fnzr != pivrow 
      tmp = A(fnzr,:);
      A(fnzr,:) = A(pivrow,:);
      A(pivrow,:) = tmp;
    end
    
    % next iteration next column
    pivcol = fnzc + 1;
  end
  
end  
