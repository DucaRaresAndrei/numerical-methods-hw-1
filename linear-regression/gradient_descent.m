function [Theta] = gradient_descent(FeatureMatrix, Y, n, m, alpha, iter)
  % FeatureMatrix -> the matrix with all training examples
  % Y -> the vector with all actual values
  % n -> the number of predictors
  % m -> the number of trainings
  % alpha -> the learning rate
  % iter -> the number of iterations

  % Theta -> the vector of weights

  % TODO: gradient_descent implementation
  Theta = zeros(n + 1, 1);
  %pentru lucram cu inmultire, adunare sau scadere intre linii si coloane pentru
  %un timp de executie mai rapid, iar la fiecare astfel de linie sau coloana
  %vom pastra primul element = 0, valoare ce trebuie sa ramana la Theta(0)
  for x = 1 : iter
    jj = zeros(n + 1, 1);
    for z = 1 : n
      suma = 0;
      h = 0;
      for i = 1 : m
        l = zeros(1, n + 1);
        l(1, 2 : n + 1) = FeatureMatrix(i, :);
        h = l * Theta;

        h = h - Y(i);
        h = h * FeatureMatrix(i, z);
        suma = suma + h;
      endfor
      jj(z) = suma / m;
    endfor
    i = n + 1;
    while i > 1
      jj(i) = jj(i - 1);
      i--;
    endwhile
    jj(1) = 0;

    Theta = Theta - alpha * jj;
  endfor
endfunction
