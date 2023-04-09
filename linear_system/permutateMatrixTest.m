% Script to test permutateMatrix
%
% Ralf Poeppel, 2023-04-07
%
% tests
A = [
1 2 3;
4 5 6;
7 8 9;
];
P = [1 3 2];
expB = [
1 2 3;
7 8 9;
4 5 6;
];
B = permutateMatrix(A, P);
if !isequal(B, expB)
  A
  P
  B
  expB
  error("permutateMatrix(A, P) = B want expB");
end

A = [
1 2 3 4;
5 6 7 8;
8 9 10 11;
12 13 24 25;
];
P = [1 4 3 2];
expB = [
1 2 3 4;
12 13 24 25;
8 9 10 11;
5 6 7 8;
];
B = permutateMatrix(A, P);
if !isequal(B, expB)
  A
  P
  B
  expB
  error("permutateMatrix(A, P) = B want expB");
end

fprintf("All tests passed\n");