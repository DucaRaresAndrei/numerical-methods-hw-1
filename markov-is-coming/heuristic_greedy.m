function [path] = heuristic_greedy (start_position, probabilities, Adj)
	% start_position -> the starting point in the labyrinth
	% probabilities -> vector of associated probabilities: including WIN and LOSE
	% Adj -> adjacency matrix

	% path -> the states chosen by the algorithm

  % TODO: heuristic_greedy implementation
  %disp(probabilities);

  [row, col, d] = find(Adj);
  n = length(row);
  nr = row(n);

  visited = zeros(nr, 1);
  start_poz = 1;
  end_poz = 1;
  path(end_poz) = start_position;
  end_poz++;
  visited(start_position) = 1;

  %am transformat algoritmul din pseudocod si l-am updatat conform problemei
  while ((end_poz - start_poz) > 0)
    poz = path(end_poz - 1);
    if poz == nr - 1
      break;
    endif
    neighbors = zeros(1, 4);
    i = 0;
    %aflu vecinii starii
    for j = 1 : nr
      if (Adj(poz, j))
        i++;
        neighbors(i) = j;
      endif
    endfor
    max_prob = 0;
    pos = 0;
    ok = 0;
    %verific veicinul nevizitat cu cea mai mare probabilitate de castig
    for j = 1 : i
      if (visited(neighbors(j)) == 0)
        if (probabilities(neighbors(j)) > max_prob)
          ok = 1;
          pos = j;
          max_prob = probabilities(neighbors(j));
        endif
      endif
    endfor
    %daca nu mai exista vecini de vizitat, scoatem din lista si sarim peste
    %partea de a adauga vecinul
    if (ok == 0)
      end_poz--;
      path(end_poz) = 0;
      continue;
    endif
    neigh = neighbors(pos);
    visited(neigh) = 1;
    path(end_poz) = neigh;
    end_poz++;
  endwhile
  path = path';
endfunction
