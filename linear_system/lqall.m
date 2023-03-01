% Berechnung der Koeffizeientenmatrix aller lateinischen Quadrate 
% der Ordnung 1 bis 9
%
% Ralf Poeppel, 2023-01-11
%
for n = 1:9
  fprintf("\nLateinisches Quadrat der Ordnung n = %d\n", n);
  fprintf("======================================\n");
  [Bc Br rk] = lq(n);
  printMatrix(Bc, "Bc");
  printMatrix(Br, "Bc rred");
  fprintf("\nRank(Bc rred) = %d\n", rk);
end
