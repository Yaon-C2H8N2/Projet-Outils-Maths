function resI = homemadeFastFourier1D(I)
  [M,N] = size(I);
  #si vecteur I sous forme de colonne alors N=1 et M=taille de I donc stockage de M dans N.
  if M>N
    N=M;
  endif
  
  #init du vecteur resultat
  resI = zeros(1,N);
  if N==1
    resI(1) = I(1); #si N=1 alors transformée discrète 1D
  else
    Ieven=zeros(1,N/2); #initialisation du tableau des indices pairs
    Iodd=zeros(1,N/2);  #initialisation du tableau des indices impairs
    
    #tri entre les indices pairs/impairs
    for j=0:(N/2)-1
      Ieven(j+1) = I(2*j+1);  #stockage des indices pairs dans un tableau dédié
      Iodd(j+1) = I(2*j+2);   #stockage des indices impairs dans un tableau dédié
    endfor
    Ieven = homemadeFastFourier1D(Ieven); #fft des indices pairs
    Iodd = homemadeFastFourier1D(Iodd); #fft des indices impairs
    
    #dft des indices impairs comme démontré 
    for j=0:(N/2)-1
      Iodd(j+1) = Iodd(j+1)*exp((-2*i*pi*j)/N);
    endfor
    
    #réunification des indices pairs et impairs
    for j=1:(N/2)
      resI(j) = Ieven(j)+Iodd(j);
      #périodicité de l'exponentiel complexe (merci Wikipedia)
      resI(j+(N/2)) = Ieven(j)-Iodd(j);
    endfor
  endif
endfunction