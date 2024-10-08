function [decoded_path] = decode_path (path, lines, cols)
	% path -> vector containing the order of the states that arrived
	% 		 to a winning position
	% lines -> numeber of lines
	% cols -> number of columns

	% decoded_path -> vector of pairs (line_index, column_index)
  %                 corresponding to path states
  % hint: decoded_path does not contain indices for the WIN state

  % TODO: decode_path implementation

  n = length(path);
  n--;
  for x = 1 : n
    nr = path(x);
    %se calculeaza coordonata j a starii din path
    j = mod(nr, cols);

    if (j == 0)
      j = cols;
    endif

    %se calculeaza coordonata i a starii din path
    i = nr - j;
    i = i / cols + 1;

    decoded_path(x, 1) = i;
    decoded_path(x, 2) = j;
  endfor
endfunction
