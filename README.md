Duca Andrei-Rares
311CA

                Implementare:

            1. Markov is coming ...


        Functia parse_labyrinth primeste fisierul din care se vor citi coordonatele si matricea labirint.

        Functia get_adjacency_matrix primeste matricea codificata. Se parcurg intai prima si ultima linie pentru a adauga in matricea de adiacenta atat starile vecine, cat si relatiile pentru starile de win. Apoi se parcurg prima si ultima coloana, avand grija sa nu verificam de 2 ori aceeasi vecini ai starilor din colturi, introducand de altfel si starile de loose.

        Functia get_link_matrix primeste labirintul, ii obtine matricea de de adiacenta in format de matrice rara, apoi calculeaza pentru fiecare stare numarul de vecini si calculeaza matricea legaturilor impartind linia la numarul veicinilor.

        Functia get_Jacobi_parameters extrage matricea de adiacenta si formeaza matricea coloana c si matricea G, verificand ce stari sunt adiacente cu win, iar restul care nu sunt nici cu win si nici cu loose, se vor introduce in matricea G.

        Functia perform_iterative va rula prin metoda Jacobi si va calcula  vectorul coloana al probabilitatilor.

        Functia heuristic_greedy creaza un vector de vizited si o stiva. Se introduce in stiva elementul de pe pozitia de start, dupa care Se cauta primul vecin nevizitat cu probabilitatea de castig cea mai mare. Se repeta algoritmul pentru fiecare element din varful stivei, pana se ajunge la o stiva goala sau la castig. Daca avem vecin nevizitat, il introducem in coada, iar daca nu mai are niciun vecin nevizitat, scoatem starea din varful stivei.

        Functia decode_path va primi drumul spre castig si va returna pentru fiecare stare din drum, abscisa si ordonata sa.

            2. Linear Regression

        Functia parse_data_set_file primeste fisierul din care se citesc dimensiunile matricei de forma cell, apoi se citeste matricea si vectorul Y al valorilor actuale.

        Functia prepare_for_regression introduce un rand nou in matrice, pdeoarece pozitiile ce contin 'semi-furnished', 'unfurnished' sau 'furnished' se vor reprezenta pe 2 coloane, in cifre de 0 sau 1. La fel daca avem 'yes', vom introduce 1, iar la 'no' vom introduce 0. Valorile reale se vor pastra la fel.

        Functia linear_regression_cost_function calculeaza eroarea folosind formulele din enuntul problemei, updatate in limbaj octave.

        Functia parse_csv_file lucreaza cu un fisier excel din care extrage prima linie, astfel afland numarul de coloane. Se citesc apoi linii, pana la finalul fisierului, linii care despart cuvintele intre ele, si se concateneaza facand o matrice. Parcurgem apoi aceasta matrice pentru a scoate matricea de formal cell si vectorul valorilor reale.

        Functia gradient_descent calculeaza conform formulelor date, vectorul theta de atatea ori cate iteratii avem.

        Functia normal_equation calculeaza vectorul Theta conform formulelor si a algoritmului dat in pseudocod, transpus in limbaj Octave. In realizarea sa se foloseste metoda gradientului conjugat.

        Functia lasso_regression_cost_function se realizeaza asemanator functiei linear_regression_cost_function, modificandu-se conform formulei, astfel incat sa poata elimina chiar si definitiv dependenta de anumiti predictori.

        Functia ridge_regression_cost_function se realizeaza asemanator functiilor linear_regression_cost_function si lasso_regression_cost_function, modificandu-se conform formulei, astfel incat iesirile de ordin i sa depinda mai putin de predictori.

            3. MNIST 101

        Functia load_dataset primeste fisierul din care se vor incarca in memorie matricea X si vectorul y.

        Functia split_dataset realizeaza permutarile liniilor din matricea X si din vectorul y, apoi calculeaza procentul actual. In continuare, liniile de la 1 la procent vor fi transmise lui X_train, respectiv y_train iar liniile de la (procent + 1) la final vor fi transmise lui X_test, respectiv lui y_test.

        Functia initialize_weights calculeaza e si -e, respectiv matricea ce va primi pe fiecare pozitie valori random din intervalul (-e, e).
