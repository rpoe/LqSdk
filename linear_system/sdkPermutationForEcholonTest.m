% Script to test sdkPermutationForEcholon
%
% Ralf Poeppel, 2023-04-09
%
% tests
n = 4;
l = 2;
P = sdkPermutationForEcholon(n, l);
expP = [ 1 2 3 4 6 7 8 12 5 9 10 11];
if !isequal(P, expP)
  fprintf("\nerror\n");
  n
  l
  P
  expP
%  error("lqPermutationForEcholon(n) = p want expp");
end

n = 6;
l = 2;
P = sdkPermutationForEcholon(n, l);
expP = [ 1 2 3 4 5 6 8 9 10 11 12 16 18 7 13 14 15 17];
if !isequal(P, expP)
  fprintf("\nerror\n");
  n
  l
  P
  expP
  error("lqPermutationForEcholon(n) = p want expp");
end

fprintf("All tests passed\n");