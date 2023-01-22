% Gleichungssystem Lateinisches Quadrat Ordnung n 
% Erweiterte Koeffizeintenmatrix berechnen
%
% Ralf Poeppel, 2023-01-05
%
% lq erstellt die erweiterte Koeffizientenmatrix Bc eines
% lateinischen Quadrates, berechnet den Rang und die
% Zeilenstufenform von Bc.
%
% Eingabeparameter
%   n: Ordnung des Lateinischen Quadrats
%
% Rückgabewerte
%   Bc: Erweiterte Koeffizientenmatrix
%   Br: Zeilenstufenform von Bc
%   rk: Rang der Matrix
%
function [Bc Br rk] = lq(n)
  c = n*(n+1)/2;
  Bc = zeros(2*n, n*n+1);
  Br = Bc;
  rk = 0;
  for i = 1:n
    for j = 1:n
      Bc(i, (j-1)*n+i) = 1;
    end
  end
  for i = 1:n
    for j = 1:n
      Bc(i+n, j+n*(i-1)) = 1;
    end
  end
  j = n*n+1;
  for i = 1:2*n
    Bc(i, j) = c;
  end
  %rk = rank(Bc);
  Br = rref(Bc);
  rk = rank(Br);
end