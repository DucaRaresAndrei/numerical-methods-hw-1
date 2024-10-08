function [FeatureMatrix] = prepare_for_regression(InitialMatrix)
  % InitialMatrix -> the matrix that must be transformed

  % FeatureMatrix -> the matrix with all training examples

  % TODO: prepare_for_regression implementation
  [m, n] = size(InitialMatrix);
  FeatureMatrix = zeros(m, n + 1);
  for i = 1 : m
    %prin variabila ok se verifica daca am introdus coloana extra pentru
    %"semi-furnished", "unfurnished" sau "furnished"
    ok = 0;
    for j = 1 : n
      aux = InitialMatrix{i, j};
      %verificam daca valoarea e numar, iar daca da, doar o vom copia
      if (isnumeric(aux))
        if ok == 0
          FeatureMatrix(i, j) = InitialMatrix{i, j};
        else
          FeatureMatrix(i, j + 1) = InitialMatrix{i, j};
        endif

        continue;
      endif

      %se ajunge aici doar in cazul in care valoarea este char, pentru care
      %se aplica transformarile dorite
      if (strcmp(InitialMatrix{i, j}, "yes"))
        if ok == 0
          FeatureMatrix(i, j) =  1;
        else
          FeatureMatrix(i, j + 1) = 1;
        endif
      elseif (strcmp(InitialMatrix{i, j}, "no"))
        if ok == 0
          FeatureMatrix(i, j) =  0;
        else
          FeatureMatrix(i, j + 1) = 0;
        endif
      elseif (strcmp(InitialMatrix{i, j}, "semi-furnished"))
        FeatureMatrix(i, j) =  1;
        FeatureMatrix(i, j + 1) =  0;
        ok = 1;
      elseif (strcmp(InitialMatrix{i, j}, "unfurnished"))
        FeatureMatrix(i, j) =  0;
        FeatureMatrix(i, j + 1) =  1;
        ok = 1;
      elseif (strcmp(InitialMatrix{i, j}, "furnished"))
        FeatureMatrix(i, j) =  0;
        FeatureMatrix(i, j + 1) =  0;
        ok = 1;
      endif
    endfor
  endfor
endfunction
