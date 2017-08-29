function signal=ecorrige50(signal,F_LINEA,F_ECH)

% Esta funcion elimina la se�al de la corriente alterna. Funciona bien cuando
% la frecuencia de la linea y la frecuencia de muestreo son multiplos exactos.
% 
% En entrada recibe:
%			signal: un vector fila que contiene la se�al
% 			F_LINEA: La frecuencia de la linea en Hz ej: 50
%			F_ECH: La frecuencia de muestreo en Hz ej: 3012
%
% El output es la se�al sin efecto de la corriente alterna
%
%    Ej:  signal =  ecorrige50(signal, 50, 3012);
%
			

pts_par_per50 = fix(F_ECH/F_LINEA)



	[trash,lll]=size(signal);
   indices=[1:lll,1:lll,1:lll,1:lll];%duplique le signal. Il faut que la taille de signal
   %soit sup�rieure � 1 seconde.(50*20ms) car on d�place le signal 50 fois de 20 ms.
                                    
  mat_ind_ind=repmat(1:lll,60,1)+lll+repmat((-29:30)'*pts_par_per50,1,lll);
   %on calcule une matrice de 50 lignes et de LLL colonnes. Dans chaque ligne d�calage de 10 indices                                 
	mat_ind=indices(mat_ind_ind);
	mean_sig=mean(signal(mat_ind));
	
	signal=signal-mean_sig;



