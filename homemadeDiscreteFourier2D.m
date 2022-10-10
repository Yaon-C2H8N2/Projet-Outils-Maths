function resI = homemadeDiscreteFourier2D(I)
  [M,N] = size(I);
  resI = zeros(M,N);
  for u=0:M-1
    for v=0:N-1
      for x=0:M-1
        for y=0:N-1
          resI(u+1,v+1) = resI(u+1,v+1) + I(x+1,y+1)*exp(-2*i*pi*(((u*x)/M)+((v*y)/N)));
        endfor
      endfor
    endfor
  endfor
endfunction