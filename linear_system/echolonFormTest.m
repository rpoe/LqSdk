% Script to test echolonForm
%
% Ralf Poeppel, 2023-04-01
%
% tests
A = [];
[B rk] = echolonForm(A);
expB = A;
expRk = 0;
if !isequal(B, expB) || rk != expRk
  A
  B
  expB
  rk
  expRk
  error("echolonForm(A) = [B, rk] want expB, expRk");
end

A = [0];
[B rk] = echolonForm(A);
expB = A;
expRk = 0;
if !isequal(B, expB) || rk != expRk
  A
  B
  expB
  rk
  expRk
  error("echolonForm(A) = [B, rk] want expB, expRk");
end

A = [1];
[B rk] = echolonForm(A);
expB = A;
expRk = 1;
if !isequal(B, expB) || rk != expRk
  A
  B
  expB
  rk
  expRk
  error("echolonForm(A) = [B, rk] want expB, expRk");
end

A = [2];
[B rk] = echolonForm(A);
expB = [1];
expRk = 1;
if !isequal(B, expB) || rk != expRk
  A
  B
  expB
  rk
  expRk
  error("echolonForm(A) = [B, rk] want expB, expRk");
end

A = [2 4];
[B rk] = echolonForm(A);
expB = A / 2;
expRk = 1;
if !isequal(B, expB) || rk != expRk
  A
  B
  expB
  rk
  expRk
  error("echolonForm(A) = [B, rk] want expB, expRk");
end

A = [2 1;
     0 0];
[B rk] = echolonForm(A);
expB = A / 2;
expRk = 1;
if !isequal(B, expB) || rk != expRk
  A
  B
  expB
  rk
  expRk
  error("echolonForm(A) = [B, rk] want expB, expRk");
end

A = [2 6;
     0 4];
[B rk] = echolonForm(A);
expB = [1 3;
        0 1];
expRk = 2;
if !isequal(B, expB) || rk != expRk
  A
  B
  expB
  rk
  expRk
  error("echolonForm(A) = [B, rk] want expB, expRk");
end

A = [2 6;
     2 10];
[B rk] = echolonForm(A);
expB = [1 3;
        0 1];
expRk = 2;
if !isequal(B, expB) || rk != expRk
  A
  B
  expB
  rk
  expRk
  error("echolonForm(A) = [B, rk] want expB, expRk");
end

A = [1 3 4;
     1 5 6];
[B rk] = echolonForm(A);
expB = [1 3 4;
        0 1 1];
expRk = 2;
if !isequal(B, expB) || rk != expRk
  A
  B
  expB
  rk
  expRk
  error("echolonForm(A) = [B, rk] want expB, expRk");
end

A = [2 6 8;
     2 10 16];
[B rk] = echolonForm(A);
expB = [1 3 4;
        0 1 2];
expRk = 2;
if !isequal(B, expB) || rk != expRk
  A
  B
  expB
  rk
  expRk
  error("echolonForm(A) = [B, rk] want expB, expRk");
end

A = [2 6 8;
     2 6 16];
[B rk] = echolonForm(A);
expB = [1 3 4;
        0 0 1];
expRk = 2;
if !isequal(B, expB) || rk != expRk
  A
  B
  expB
  rk
  expRk
  error("echolonForm(A) = [B, rk] want expB, expRk");
end

A = [2 6 8;
     2 6 8];
[B rk] = echolonForm(A);
expB = [1 3 4;
        0 0 0];
expRk = 1;
if !isequal(B, expB) || rk != expRk
  A
  B
  expB
  rk
  expRk
  error("echolonForm(A) = [B, rk] want expB, expRk");
end

A = [2 6 8;
     2 10 16;
     2 14 40];
% 2 6 8
% 0 4 8
% 0 8 32
% 0 0 16
[B rk] = echolonForm(A);
expB = [1 3 4;
        0 1 2;
        0 0 1];
expRk = 3;
if !isequal(B, expB) || rk != expRk
  A
  B
  expB
  rk
  expRk
  error("echolonForm(A) = [B, rk] want expB, expRk");
end

A = [2 6 8;
     2 10 16;
     2 10 16];
[B rk] = echolonForm(A);
expB = [1 3 4;
        0 1 2;
        0 0 0];
expRk = 2;
if !isequal(B, expB) || rk != expRk
  A
  B
  expB
  rk
  expRk
  error("echolonForm(A) = [B, rk] want expB, expRk");
end

A = [2 6 8;
     2 6 9;
     2 6 9];
[B rk] = echolonForm(A);
expB = [1 3 4;
        0 0 1;
        0 0 0];
expRk = 2;
if !isequal(B, expB) || rk != expRk
  A
  B
  expB
  rk
  expRk
  error("echolonForm(A) = [B, rk] want expB, expRk");
end

A = [2 6 8;
     2 6 8;
     2 6 8];
[B rk] = echolonForm(A);
expB = [1 3 4;
        0 0 0;
        0 0 0];
expRk = 1;
if !isequal(B, expB) || rk != expRk
  A
  B
  expB
  rk
  expRk
  error("echolonForm(A) = [B, rk] want expB, expRk");
end

A = [0 0 0;
     0 0 0;
     0 0 0];
[B rk] = echolonForm(A);
expB = [0 0 0;
        0 0 0;
        0 0 0];
expRk = 0;
if !isequal(B, expB) || rk != expRk
  A
  B
  expB
  rk
  expRk
  error("echolonForm(A) = [B, rk] want expB, expRk");
end

A = [0 0 1;
     0 2 3;
     3 9 6];
[B rk] = echolonForm(A);
expB = [1 3 2;
        0 1 1.5;
        0 0 1];
expRk = 3;
if !isequal(B, expB) || rk != expRk
  A
  B
  expB
  rk
  expRk
  error("echolonForm(A) = [B, rk] want expB, expRk");
end

A = [3 9 6;
     0 0 1;
     0 2 3];
[B rk] = echolonForm(A);
expB = [1 3 2;
        0 1 1.5;
        0 0 1];
expRk = 3;
if !isequal(B, expB) || rk != expRk
  A
  B
  expB
  rk
  expRk
  error("echolonForm(A) = [B, rk] want expB, expRk");
end

% 0 0 0 1
% 1 1 1 1
% 3 4 5 5
% 4 6 9 11
%
% 1 1 1 1
% 0 0 0 1
% 0 1 2 2
% 0 2 5 7
%
% 1 1 1 1
% 0 1 2 2
% 0 0 0 1
% 0 0 1 3
%
A = [0 0 0 1;
     1 1 1 1;
     3 4 5 5;
     4 6 9 11];
[B rk] = echolonForm(A);
expB = [1 1 1 1;
        0 1 2 2;
        0 0 1 3;
        0 0 0 1];
expRk = 4;
if !isequal(B, expB) || rk != expRk
  A
  B
  expB
  rk
  expRk
  error("echolonForm(A) = [B, rk] want expB, expRk");
end

fprintf("All tests passed\n");
