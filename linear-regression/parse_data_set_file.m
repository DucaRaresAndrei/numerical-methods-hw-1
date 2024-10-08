function [Y, InitialMatrix] = parse_data_set_file(file_path)
  % path -> a relative path to the .txt file

  % Y -> the vector with all actual values
  % InitialMatrix -> the matrix that must be transformed

  % TODO: parse_data_set_file implementation
  fisier = fopen(file_path, 'r');
  m = fscanf(fisier, "%d", 1);
  n = fscanf(fisier, "%d", 1);
  %initializam matricea cell si vectorul y
  InitialMatrix = cell(m, n);
  Y = zeros(m, 1);
  for i = 1 : m
    %se citeste valoarea de pe coloana 1 si se asigneaza vectorului
    Y(i) = fscanf(fisier, "%d", 1);

    %se citesc si se transforma in numere, daca e nevoie, sau se lasa in format
    %char, valorile matricei
    for j = 1 : n
      variable = fscanf(fisier, "%s", 1);
      aux = variable;
      aux = str2double(aux);
      if (!isnan(aux))
        InitialMatrix{i, j} = aux;
      else
        InitialMatrix{i, j} = variable;
      endif
    endfor
  endfor
  fclose(fisier);
endfunction
