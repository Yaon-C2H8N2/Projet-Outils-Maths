function resI = homemadeInverseFastFourier2D(I)
  [M,N] = size(I);
  tempResI = zeros(M,N);
  resI = zeros(M,N);
  for column=1:N
    tempResI(:,column) = ifft(I(:,column));
  endfor
  for line=1:M
    resI(line,:) = ifft(tempResI(line,:));
  endfor
endfunction