function [matrix] = initialize_weights(L_prev, L_next)
  % L_prev -> the number of units in the previous layer
  % L_next -> the number of units in the next layer

  % matrix -> the matrix with random values

  % TODO: initialize_weights implementation
  e = sqrt(6) / sqrt(L_prev + L_next);
  lower = -e;
  upper = e;
  matrix = ones(L_prev + 1, L_next);
  for i = 1 : L_prev + 1
    for j = 1 : L_next
      random_val = lower + (upper - lower) * rand();
      matrix(i, j) = random_val;
    endfor
  endfor
endfunction
