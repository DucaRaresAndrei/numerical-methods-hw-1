function [Error] = lasso_regression_cost_function(Theta, Y, FeatureMatrix, lambda)
  % Theta -> the vector of weights
  % Y -> the vector with all actual values
  % FeatureMatrix -> the matrix with all training examples
  % lambda -> regularization parameter that controls the amount of
  %           shrinkage applied to the regression coefficients

  % Error -> the error of the regularized cost function

  % TODO: lasso_regression_cost_function implementation
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
    h(i) = Y(i) - h(i);
    h(i) = h(i) * h(i);
    suma = suma + h(i);
  endfor

  %calculam eroarea si norma vectorului Theta
  Error = suma / m;
  suma = 0;
  for i = 1 : n
    suma = suma + Theta(i);
  endfor
  Error = Error + lambda * suma;
endfunction
