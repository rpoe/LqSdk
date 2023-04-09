% Generate extended coefficient matrix of the
% system of linear equations of a latin square
% of orders 1 to 9
%
% Ralf Poeppel, 2023-01-11, last update 2023-04-09
%
for n = 1:9
  fprintf("\nLatin square of order n = %d\n", n);
  fprintf("======================================\n");
  Bc = lq(n);
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
  P = lqPermutationForEcholon(n);
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
