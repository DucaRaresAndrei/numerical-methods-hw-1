function [x, err, steps] = perform_iterative (G, c, x0, tol, max_steps)
	% G -> iteration matrix
	% c -> iteration vector
	% x0 -> initial solution
	% tol -> accepted tolerance (norm of the difference between two solutions)
	% max_steps -> the maximum number of iterations

	% x -> final solution
	% err -> last calculated difference (as an euclidean norm)
	% steps -> actual number of steps performed

   % TODO: perform_iterative implementation
   steps = 0;
   ro = max(abs(eig(G)));
   if (1 - ro) <= tol
     return;
   endif
   prev_x = x0;
   %calculam x cu metoda Jacobi
   while (1)
     x = G * prev_x + c;
     steps++;
     err = norm(x - prev_x);
     if (err <= tol)
       return;
     endif
     prev_x = x;
   endwhile
endfunction
