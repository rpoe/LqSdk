% Gleichungssystem Lateinisches Quadrat Ordnung n 
% Erweiterte Koeffiziintenmatrix berechnen
%
% Ralf Poeppel, 2023-01-05
%
% lq erstellt die erweiterte Koeffizientenmatrix Bc eines
% Sudokus, berechnet den Rang und die
% Zeilenstufenform von Bc.
%
% Eingabeparameter
%   n: Ordnung des Sudokus
%   l: Zeilenzahl der Blöcke
%
% Rückgabewerte
%   Bc: Erweiterte Koeffizientenmatrix
%   Br: Zeilenstufenform von Bc
%   rk: Rang der Matrix
%
% Fehlerabbruch
%   n ist nicht durch l teilbar
function [Bc Br rk] = sdk(n, l)
  if mod(n, l) ~= 0
    error("Ordnung n ist nicht durch Blockzeilenzahl l teilbar");
  end
  m = n/l; % Blockspaltenzahl
  %fprintf("Blocksize is l = %d rows x m = %d columns\n", l, m);
  
  c = n*(n+1)/2; % rechte Seite
  Bc = zeros(3*n, n*n+1); % erweiterte Koeffizientenmatrix
  
  % Zeilen
  for i = 1:n
    for j = 1:n
      Bc(i, (j-1)*n+i) = 1;
    end
  end
  
  % Spalten
  for i = 1:n
    for j = 1:n
      Bc(i+n, j+n*(i-1)) = 1;
    end
  end
  
  % Blöcke
  eqio = 2*n;
  % fprintf("%d\n", eqio);
  for no = 0:m-1
    nio = eqio + no*l;
    njo = no*n*l;
    % fprintf("  %d, %d\n", nio, njo);
    for mo = (0:l-1)
      i = nio + mo + 1;
      nmjo = njo+mo*m;
      % fprintf("    %d, %d\n", i, nmjo);
      for lo = n*(0:l-1)
        nmljo = nmjo + lo;
        % fprintf("      %d, %d\n", i, nmljo);
        for ja = 1:m
          j = nmljo + ja;
          % fprintf("        %d, %d\n", i, j);
          Bc(i,j) = 1;
        end
      end
    end
    %fprintf("\n");
  end
  
  % rechte Seite
  j = n*n+1;
  for i = 1:3*n
    Bc(i, j) = c;
  end

  Br = rref(Bc);
  rk = rank(Br);
end