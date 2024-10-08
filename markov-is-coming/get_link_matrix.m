function [Link] = get_link_matrix (Labyrinth)
	% Labyrinth -> the matrix of all encodings

  % Link -> the link matrix associated to the given labyrinth

  % TODO: get_link_matrix implementation
  A = get_adjacency_matrix(Labyrinth);
  %matricea de adiacenta
  [m, n] = size(A);
  Link = A;

  for i = 1 : m
    nrval = 0;
    %calculam numarul de stari adiacente
    for j = 1 : n
      if (Link(i, j))
        nrval++;
      endif
    endfor

    %calculam matricea legaturilor labirintului
    for j = 1 : n
      if (Link(i, j))
        Link(i, j) = Link(i, j) / nrval;
      endif
    endfor
  endfor
endfunction
