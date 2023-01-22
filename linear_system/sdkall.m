% Berechnung der Koeffizeientenmatrix aller Sudokus 
% der Ordnung 4, 6, 8 und 9
%
% Ralf Poeppel, 2023-01-07
%
sdks = [4 2; 6 2; 6 3; 8 2; 8 4; 9 3];
[nmax, cols] = size(sdks);
for i = 1:nmax
  n = sdks(i,1);
  l = sdks(i,2);
  m = n/l;
  fprintf("\nSudoku Ordnung n = %d, Blocksize l = %d rows, m = %d columns\n", n, l, m);
  fprintf("=========================================================\n", n, l, m);
  [Bc, Br, rk] = sdk(n,l);
  printMatrix(Bc, "Bc");
  printMatrix(Br, "Bc rred");
  fprintf("\nRank(Br) = %d\n", rk);
end
