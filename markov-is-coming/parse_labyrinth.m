function [Labyrinth] = parse_labyrinth(file_path)
	% file_path -> the relative path to a file that needs to
  %              be loaded_graphics_toolkits

  % Labyrinth -> the matrix of all encodings for the labyrinth's walls

  % TODO: parse_labyrinth implementation
  fisier = fopen(file_path, 'r');
  m = fscanf(fisier, "%d", 1);
  n = fscanf(fisier, "%d", 1);
  %se citesc din fisier dimensiunile labirintului
  A = fscanf(fisier, "%d", [n, m]);
  %se citeste labirintul
  fclose(fisier);
  Labyrinth = A';
endfunction
