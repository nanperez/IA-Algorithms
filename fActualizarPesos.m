function [w] = fActualizarPesos(w,yi,alfa,beta,datos,j)
  delta = zeros(1,3);
  % Calculo de delta (severidad castigo) a partir de la formula
  % deltaij = alfa * (yi*(dj-yj)), donde:
  % alfa : factor de aprendizaje
  % yi: valor de la variable de entrada xi
  % di: lo que debio aprender (variable clase)
  % yj: salida aprendida
  for i=1:length(w)
    delta(i) = alfa * (datos(j,1)*(datos(j,end)-yi));
  end
  % Actualización de los pesos
  % wij = wij +deltaij
  w = w+delta;
  
endfunction
