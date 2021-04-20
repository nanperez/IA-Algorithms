function [id] = fSeleccionTorneo(fitness)
  id = [];
  parejas = length(fitness)/2;
  b = length(fitness)/parejas;
  
  while b > 0
   
    r = randperm(length(fitness));
    r1=1:2:length(fitness);
    r2=2:2:length(fitness);
    for i = 1:parejas
        p1 = fitness(r(r1(i)));
        p2 = fitness(r(r2(i)));
        % comparación del torneo
        if p1>p2
          id = [id,r(r1(i))];
        else
          id = [id,r(r2(i))];
        endif
          
    endfor
   b = b-1;
  endwhile
  
endfunction
