% Script to test lqPermutationForEcholon
%
% Ralf Poeppel, 2023-04-07
%
% tests
n = 3;
P = lqPermutationForEcholon(n);
expP = [ 1 2 3 5 6 4];
if !isequal(P, expP)
  n
  P
  expP
  error("lqPermutationForEcholon(n) = p want expp");
end

n = 4;
P = lqPermutationForEcholon(n);
expP = [ 1 2 3 4 6 7 8 5];
if !isequal(P, expP)
  n
  P
  expP
  error("lqPermutationForEcholon(n) = p want expp");
end

n = 5;
P = lqPermutationForEcholon(n);
expP = [ 1 2 3 4 5 7 8 9 10 6];
if !isequal(P, expP)
  n
  P
  expP
  error("lqPermutationForEcholon(n) = p want expp");
end

fprintf("All tests passed\n");