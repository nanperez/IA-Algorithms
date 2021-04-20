%% Parámetros del Algoritmo Genético
P = 20;  % Tamaño de la población
G = 500;  % Generaciones o iteraciones
CR = 0.9; % Porcentaje de cruza
MR = 0.15 % Porcentaje de mutación
D = 10;   % Dimensión de las soluciones
lim_min = -5.12;
lim_max = 5.12;

best = [];
% Generar la población inicial
pop = unifrnd(lim_min,lim_max,[P,D]);
% Evaluar cada individuo de la población
fit_pop = [];
for i=1:P
  fit = fEvaluacion(pop(i,:));
  fit_pop = [fit_pop,fit;];
endfor
%%%%%%%%%%%%% Inicia iteraciones
for g=1:G
  
%Seleccionar padres
[padres_select] = fSeleccionTorneo(fit_pop);
% Operador de cruza
[pop_hijos] = fCruza(pop,padres_select,CR,D);

%Operador de mutación
[pop_hijos] = fMutacion(pop_hijos,MR,lim_min,lim_max);
% Evaluar a nuestra de hijos
fit_hijos = [];
  for i=1:size(pop_hijos,1)
    fith = fEvaluacion(pop_hijos(i,:));
    fit_hijos = [fit_hijos,fith];
  endfor

% Reeemplazo generacional

t_soluciones = [pop;pop_hijos];
f_soluciones = [fit_pop,fit_hijos];

[f_o,i] = sort(f_soluciones);

f_select = f_o(1,1:P);
i2 = i(1,1:P);
individuos = t_soluciones(i2,:);

fit_pop = f_select;
pop = individuos;

best = [best,fit_pop(1)];
 disp(['Generación ' num2str(g) ': Mejor Fitness = ' num2str(fit_pop(1))]);

endfor

% Gráfica de convergencia
plot(best,'LineWidth', 2);
xlabel('Generaciones');
ylabel('Mejor Fitness');
grid on;


