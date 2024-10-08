function [G, c] = get_Jacobi_parameters (Link)
	% Link -> the link matrix (edge with probabilities matrix)

  % G -> iteration matrix
	% c -> iteration vector

  % TODO: get_Jacobi_parameters
  size_g = 1;
  size_c = 1;
  [rows, cols, ds] = find(Link);
  m = length(rows);
  nr = rows(m);

  for i =  1 : m
    row = rows(i);
    col = cols(i);
    d = ds(i);

    %verificam sa nu introducem starile de loose
    if (row != nr && col != nr)
      %daca o stare diferita de win este adiacenta cu win, introducem
      %relatia in c, iar daca nu, vom introduce relatia in G
      if (row == nr - 1 || col == nr - 1)
        if (row != col)
          r_c(size_c) = row;
          c_c(size_c) = 1;
          d_c(size_c) = d;
          size_c++;
        endif
      else
        r_g(size_g) = row;
        c_g(size_g) = col;
        d_g(size_g) = d;
        size_g++;
      endif
    endif
  endfor
  G = sparse(r_g, c_g, d_g, nr - 2, nr - 2);
  c = sparse(r_c, c_c, d_c, nr - 2, 1);
endfunction
