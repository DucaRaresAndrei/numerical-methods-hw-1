function [Y, InitialMatrix] = parse_csv_file(file_path)
  % path -> a relative path to the .csv file

  % Y -> the vector with all actual values
  % InitialMatrix -> the matrix that must be transformed

  % TODO: parse_csv_file implementation
  fisier = fopen(file_path, 'r');

  linie = fgetl(fisier);
  delimiter = ",";
  words = strsplit(linie, delimiter);
  n = length(words);

  %se citeste prima linie pentru a avea de ce lipi urmatoarele si a putea
  %forma o matrice
  linie = fgetl(fisier);
  words = strsplit(linie, delimiter);
  aux_mat = words;

  %se citesc celelalte linii pana la finalul fisierului
  while !feof(fisier)
    linie = fgetl(fisier);
    words = strsplit(linie, delimiter);
    aux_mat = vertcat(aux_mat, words);

  endwhile

  fclose(fisier);
  [m, n] = size(aux_mat);

  Y = zeros(m, 1);
  InitialMatrix = cell(m, n - 1);

  for i = 1 : m
    %se transforma in integer valoarea de pe coloana 1 si se introduce in Y
    auxy = aux_mat{i, 1};
    auxy = str2double(auxy);
    Y(i) = auxy;

    %se executa acelasi algoritm ca la parse_data_set si se salveaza elementele
    %in matricea dorita
    for j = 2 : n
      aux = aux_mat{i, j};
      aux = str2double(aux);
      if (!isnan(aux))
        InitialMatrix{i, j - 1} = aux;
      else
        InitialMatrix{i, j - 1} = aux_mat{i, j};
      endif
    endfor
  endfor
endfunction
