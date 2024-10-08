function [Theta] = normal_equation(FeatureMatrix, Y, tol, iter)
  % FeatureMatrix -> the matrix with all training examples
  % Y -> the vector with all actual values
  % tol -> the learning rate
  % iter -> the number of iterations
  % tol -> the tolerance level for convergence of the conjugate gradient method

  % Theta -> the vector of weights

  % TODO: normal_equation implementation
  A = FeatureMatrix' * FeatureMatrix;
  B = FeatureMatrix' * Y;

  [m, n] = size(FeatureMatrix);
  aux_theta = zeros(n, 1);

  %transpunem pseudocodul
  r = B - A * aux_theta;
  v = r;
  x = aux_theta;
  toler = tol * tol;
  k = 1;

  while k <= iter && r' * r > toler
    t = (r' * r) / (v' * A * v);
    x = x + t * v;
    r1 = r - t * A * v;
    s = (r1' * r1) / (r' * r);
    r = r1;
    v = r + s * v;
    k++;
  endwhile

  %salvam theta(0) cu 0, iar restul elementelor le copiem de la auxiliar
  Theta = zeros(n + 1, 1);
  for i = 2 : n + 1
    Theta(i) = x(i - 1);
  endfor
endfunction
