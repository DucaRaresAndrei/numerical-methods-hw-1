function [Adj] = get_adjacency_matrix (Labyrinth)
	% Labyrinth -> the matrix of all encodings

  % Adj -> the adjacency matrix associated to the given labyrinth

  % TODO: get_adjacency_matrix implementation
  [m, n] = size(Labyrinth);
  nr = 1;
  A = zeros(m, n);
  for i = 1 : m
    for j = 1 : n
      A(i, j) = nr;
      nr++;
    endfor
  endfor
  %A este matricea starilor

  nr++;
  size_mat = 1;

  %se completeaza 'matricea de adiacenta' pentu prima si ultima linie
  for j = 1 : n
    elem_up = Labyrinth(1, j);

    if (!(bitand(elem_up, 8)))
      r(size_mat) = A(1, j);
      c(size_mat) = nr - 1;
      d(size_mat) = 1;
      size_mat++;
    endif
    if (!(bitand(elem_up, 4)))
      r(size_mat) = A(1, j);
      c(size_mat) = A(2, j);
      d(size_mat) = 1;
      size_mat++;
    endif

    elem_down = Labyrinth(m, j);

    if (!(bitand(elem_down, 4)))
      r(size_mat) = A(m, j);
      c(size_mat) = nr - 1;
      d(size_mat) = 1;
      size_mat++;
    endif
    if (!(bitand(elem_down, 8)))
      r(size_mat) = A(m, j);
      c(size_mat) = A(m - 1, j);
      d(size_mat) = 1;
      size_mat++;
    endif

    if (j > 1)
      if (!(bitand(elem_up, 1)))
        r(size_mat) = A(1, j);
        c(size_mat) = A(1, j - 1);
        d(size_mat) = 1;
        size_mat++;
      endif
      if (!(bitand(elem_down, 1)))
        r(size_mat) = A(m, j);
        c(size_mat) = A(m, j - 1);
        d(size_mat) = 1;
        size_mat++;
      endif
    endif

    if (j < n)
      if (!(bitand(elem_up, 2)))
        r(size_mat) = A(1, j);
        c(size_mat) = A(1, j + 1);
        d(size_mat) = 1;
        size_mat++;
      endif
      if (!(bitand(elem_down, 2)))
        r(size_mat) = A(m, j);
        c(size_mat) = A(m, j + 1);
        d(size_mat) = 1;
        size_mat++;
      endif
    endif
  endfor

  %se completeaza 'matricea de adiacenta' pentru prima si ultima coloana
  %avem grija sa nu repetam pozitiile
  for i = 1 : m
    elem_left = Labyrinth(i, 1);

    if (!(bitand(elem_left, 1)))
      r(size_mat) = A(i, 1);
      c(size_mat) = nr;
      d(size_mat) = 1;
      size_mat++;
    endif
    if (i != 1 && i != m)
      if (!(bitand(elem_left, 2)))
        r(size_mat) = A(i, 1);
        c(size_mat) = A(i, 2);
        d(size_mat) = 1;
        size_mat++;
      endif
    endif

    elem_right = Labyrinth(i, n);

    if (!(bitand(elem_right, 2)))
      r(size_mat) = A(i, n);
      c(size_mat) = nr;
      d(size_mat) = 1;
      size_mat++;
    endif
    if (i != 1 && i != m)
      if (!(bitand(elem_right, 1)))
        r(size_mat) = A(i, n);
        c(size_mat) = A(i, n - 1);
        d(size_mat) = 1;
        size_mat++;
      endif
    endif

    if (i > 1 && i < m)
      if (!(bitand(elem_left, 8)))
        r(size_mat) = A(i, 1);
        c(size_mat) = A(i - 1, 1);
        d(size_mat) = 1;
        size_mat++;
      endif
      if (!(bitand(elem_right, 8)))
        r(size_mat) = A(i, n);
        c(size_mat) = A(i - 1, n);
        d(size_mat) = 1;
        size_mat++;
      endif

      if (!(bitand(elem_left, 4)))
        r(size_mat) = A(i, 1);
        c(size_mat) = A(i + 1, 1);
        d(size_mat) = 1;
        size_mat++;
      endif
      if (!(bitand(elem_right, 4)))
        r(size_mat) = A(i, n);
        c(size_mat) = A(i + 1, n);
        d(size_mat) = 1;
        size_mat++;
      endif
    endif
  endfor

  %se completeaza 'matricea de adiacenta' pentru restul starilor
  for i = 2 : m - 1
    for j = 2 : n - 1
      elem = Labyrinth(i, j);
      if (!(bitand(elem, 1)))
        r(size_mat) = A(i, j);
        c(size_mat) = A(i, j - 1);
        d(size_mat) = 1;
        size_mat++;
      endif

      if (!(bitand(elem, 2)))
        r(size_mat) = A(i, j);
        c(size_mat) = A(i, j + 1);
        d(size_mat) = 1;
        size_mat++;
      endif

      if (!(bitand(elem, 4)))
        r(size_mat) = A(i, j);
        c(size_mat) = A(i + 1, j);
        d(size_mat) = 1;
        size_mat++;
      endif

      if (!(bitand(elem, 8)))
        r(size_mat) = A(i, j);
        c(size_mat) = A(i - 1, j);
        d(size_mat) = 1;
        size_mat++;
      endif
    endfor
  endfor

  r(size_mat) = nr;
  c(size_mat) = nr;
  d(size_mat) = 1;
  size_mat++;

  r(size_mat) = nr - 1;
  c(size_mat) = nr - 1;
  d(size_mat) = 1;
  size_mat++;

  %se concateneaza vectorii coloana in matricea sparse
  Adj = sparse(r, c, d, nr, nr);
endfunction
