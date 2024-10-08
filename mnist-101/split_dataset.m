function [X_train, y_train, X_test, y_test] = split_dataset(X, y, percent)
  % X -> the loaded dataset with all training examples
  % y -> the corresponding labels
  % percent -> fraction of training examples to be put in training dataset

  % X_[train|test] -> the datasets for training and test respectively
  % y_[train|test] -> the corresponding labels

  % Example: [X, y] has 1000 training examples with labels and percent = 0.85
  %           -> X_train will have 850 examples
  %           -> X_test will have the other 150 examples

  % TODO: split_dataset implementation
  [m, n] = size(X);
  %realizez permutarea liniilor
  perms = randperm(m);
  x_perm = X(perms, :);
  y_perm = y(perms);

  %calculez procentul in valoare integer
  percent = percent * m;

  X_train = zeros(percent, n);
  X_test = zeros(m - percent, n);
  y_train = zeros(percent, 1);
  y_test = zeros(m - percent, 1);

  %copiez primele percent linii in X_train si y_train
  for i = 1 : percent
    y_train(i) = y_perm(i);
    for j = 1 : n
      X_train(i, j) = x_perm(i, j);
    endfor
  endfor

  %variabila ajutatoare pentru a introduce elementele cum trebuie
  k = 1;

  %copiez ultimele linii, de la percent + 1 la final in X_test si y_test
  for i = percent + 1 : m
    y_test(k) = y_perm(i);
    for j = 1 : n
      X_test(k, j) = x_perm(i, j);
    endfor
    k++;
  endfor
endfunction
