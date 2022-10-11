function resI = homemadeInverseDiscreteFourier2D(I)
  [M,N] = size(I);
  resI = zeros(M,N);
  for x=0:M-1
    for y=0:N-1
      for u=0:M-1
        for v=0:N-1
          resI(x+1,y+1) = resI(x+1,y+1) + I(u+1,v+1)*exp(2*i*pi*(((u*x)/M)+((v*y)/N)));
        endfor
      endfor
    endfor
  endfor
endfunction