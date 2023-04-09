% Generate extended coefficient matrix of the
% system of linear equations of a sudoku 
% of orders 4, 6, 8, and 9
%
% Ralf Poeppel, 2023-01-07, last update 2023-04-09
%
sdks = [4 2; 6 2; 6 3; 8 2; 8 4; 9 3];
[nmax, cols] = size(sdks);
%for i = 1:nmax
for i = 1:nmax
  n = sdks(i,1);
  l = sdks(i,2);
  m = n/l;
  fprintf("\nSudoku Order n = %d, Blocksize l = %d rows, m = %d columns\n", n, l, m);
  fprintf("=========================================================\n", n, l, m);
  Bc = sdk(n,l);
  Br = rref(Bc);
  rk = rank(Br);
  printMatrix(Bc, "Bc");
  printMatrix(Br, "Bc rred");
  fprintf("\nRank(Bc rred) = %d\n", rk);
  [Be re] = echolonForm(Bc);
  if re != rk
    error("rank has changed.")
  endif
  printMatrix(Be, "Bc echolon form");
  P = sdkPermutationForEcholon(n, l);
  s = sprintf(' %d', P);
  fprintf("\npermutation vector for rows\n%s\n", s);
  Bp = permutateMatrix(Bc, P);
  printMatrix(Bp, "Bp permutated matrix");
  [Be re] = echolonForm(Bp);
  if re != rk
    error("rank has changed.")
  endif
  printMatrix(Be, "Bp echolon form");
end
