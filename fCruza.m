function [pop_hijos] = fCruza(pop,id,CR,D)
  %sub matrices de pop
  p1 = pop(id(1:2:end),:);
  p2 = pop(id(2:2:end),:);
  pop_hijos=[];
  for i=1:length(p1)
    r = rand();
    if r <= CR
      % aqui puedo cruzar a los padres
      p = randi(D,1,1);  % punto de corte
      h1 = [p1(i,1:p),p2(i,p+1:end)];
      h2 = [p2(i,1:p),p1(i,p+1:end)];
      pop_hijos = [pop_hijos;h1;h2];
    else
      h1 = p1(i,:);
      h2 = p2(i,:);
      pop_hijos = [pop_hijos;h1;h2];
    endif
  endfor
endfunction
