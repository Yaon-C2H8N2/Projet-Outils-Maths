function resI = homemadeDiscreteFourier1D(I)
  [M,N] = size(I);
  #si vecteur I sous forme de colonne alors N=1 et M=taille de I donc stockage de M dans N.
  if M>N
    N=M;
  endif
  resI = zeros(1,N);
  for u=0:N-1
    for x=0:N-1
      resI(u+1) = resI(u+1) + I(x+1)*exp((-2*i*pi*u*x)/N);
    endfor
  endfor
endfunction