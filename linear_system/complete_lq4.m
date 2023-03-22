% Example for completing latin square order 4, using a system of linear equations
%
% Ralf Poeppel, 2023-03-22

% Basic system of linear equations
n = 4;
[Bc Br rk] = lq(n);
fprintf("Basic system of order %d\n", n);
printMatrix(Br, "Bc row reduced system");

% add known variables
A = [
0 0 0 0 10;
0 3 0 0 10;
0 0 2 0 10;
0 0 0 1 10];
printMatrix(A, "Step 0: matrix of latin square")
Bc0 = Br;
row = rk + 1;
lastcol = n * n + 1;
Bc0(row, 6) = 1;
Bc0(row, lastcol) = 3;
row = row + 1;
Bc0(row, 11) = 1;
Bc0(row, lastcol) = 2;
row = row + 1;
Bc0(row, 16) = 1;
Bc0(row, lastcol) = 1;
printMatrix(Bc0, "Step 0: matrix of LGS")
Br0 = rref(Bc0);
printMatrix(Br0, "Step 0: row reduced matrix of LGS")

% iteration 1 select 2 variables for line 4 of matrix, line 9 of LGS
fprintf("\n\nStep 1: select some possible values for row 4");
A = [
0 0 0 0 10;
0 3 0 0 10;
0 0 2 0 10;
0 4 3 1 10];
printMatrix(A, "Step 1: matrix of latin square")
Bc1 = Br0;
[lr lc] = size(Bc1);
row = lr + 1;
Bc1(row, 15) = 1;
Bc1(row, lastcol) = 3;
row = row + 1;
Bc1(row, 14) = 1;
Bc1(row, lastcol) = 4;
printMatrix(Bc1, "Step 1: 2 vars selected; matrix of LGS")
Br1 = rref(Bc1);
printMatrix(Br1, "Step 1: row reduced matrix of LGS")

% iteration 2 select 2 variables for line 3 of matrix, line 7 of LGS
fprintf("\n\nStep 2: select some possible values for row 3");
A = [
0 0 0 0 10;
0 3 0 0 10;
0 1 2 4 10;
0 4 3 1 10];
printMatrix(A, "Step 2: matrix of latin square")
Bc2 = Br1;
[lr lc] = size(Bc2);
row = lr + 1;
Bc2(row, 12) = 1;
Bc2(row, lastcol) = 4;
row = row + 1;
Bc2(row, 10) = 1;
Bc2(row, lastcol) = 1;
printMatrix(Bc2, "Step 2: 2 vars selected; matrix of LGS")
Br2 = rref(Bc2);
printMatrix(Br2, "Step 2: row reduced matrix of LGS")

% iteration 3 select 2 variables for line 2 of matrix, line 5 of LGS
fprintf("\n\nStep 3: select some possible values for row 2");
A = [
0 0 0 0 10;
0 3 1 2 10;
0 1 2 4 10;
0 4 3 1 10];
printMatrix(A, "Step 3: matrix of latin square")
Bc3 = Br2;
[lr lc] = size(Bc2);
row = lr + 1;
Bc3(row, 7) = 1;
Bc3(row, lastcol) = 1;
row = row + 1;
Bc3(row, 8) = 1;
Bc3(row, lastcol) = 2;
printMatrix(Bc3, "Step 3: 2 vars selected; matrix of LGS")
Br3 = rref(Bc3);
printMatrix(Br3, "Step 3: row reduced matrix of LGS")
