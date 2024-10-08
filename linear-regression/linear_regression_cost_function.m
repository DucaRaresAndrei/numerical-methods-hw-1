function [Error] = linear_regression_cost_function(Theta, Y, FeatureMatrix)
  % Theta -> the vector of weights
  % Y -> the vector with all actual values
  % FeatureMatrix -> the matrix with all training examples

  % Error -> the error of the regularized cost function

  % TODO: linear_regression_cost_function implementation
  [m, n] = size(FeatureMatrix);
  for i = 1 : n
    Theta(i) = Theta(i + 1);
  endfor

  h = zeros(m, 1);

  suma = 0;
  %se calculeaza suma conform formulei
  for i = 1 : m
    for j = 1 : n
      h(i) = h(i) + Theta(j) * FeatureMatrix(i, j);
    endfor
    h(i) = h(i) - Y(i);
    h(i) = h(i) * h(i);
    suma = suma + h(i);
  endfor
  Error = suma / (2 * m);
endfunction
