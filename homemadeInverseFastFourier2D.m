function resI = homemadeInverseFastFourier2D(I)
  [M,N] = size(I);
  tempResI = zeros(M,N);
  resI = zeros(M,N);
  for column=1:N
    tempResI(:,column) = homemadeInverseFastFourier1D(I(:,column));
  endfor
  for line=1:M
    resI(line,:) = homemadeInverseFastFourier1D(tempResI(line,:));
  endfor
endfunction