% Tabla de datos de entrebamiento
datos = [0,0,0;
          0,1,0;
          1,0,0;
          1,1,1];
          
% Parámetros de la red
alfa = 0.8;
beta = 1;
epocas = 10;
w = [0.2,0.5,0.3];

[f,c]=size(datos);
i = 1;

while i<= epocas
  correctas = 0;
  for j=1:f
     % comienzo a revisar patron por patron
     patron = datos(j,1:2);
     patron = [patron,beta];
     % Calculo de función de activación
     fNet = sum(patron.*w);
     % Función de Transferencia
     yi = fTransferencia(fNet);
     % Proceso de aprendizaje (severidad del castigo)
     w = fActualizarPesos(w,yi,alfa,beta,datos,j);
     if yi == datos(j,end)
       correctas++;
     endif   
  endfor
  % Error de la red perceptron
  error = (f-correctas)/f;
  e = 'Epoca No.';
  S = sprintf('%s %d - Error: %d',e,i,error);
  disp(S);
  
  i++;
endwhile




