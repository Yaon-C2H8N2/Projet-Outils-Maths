close all;
clear all;

#generation image 1D de taille 2^N
n = 4;
I = rand(1,2**n);
startDFT = time();
DFI = homemadeDiscreteFourier1D(I);
endDFT = time();
startFFT = time();
FFI = homemadeFastFourier1D(I);
endFFT = time();

#affichage ft référence :
subplot(3,1,1);
imshow(I);
title("Image originale");
subplot(3,1,2);
imshow(fft(I));
title("FT Référence");
subplot(3,1,3);
imshow(ifft(fft2(I)));
Iref = ifft(fft2(I));
title("IFT Référence");
figure();

#affichage dft homemade :
subplot(3,1,1);
imshow(I);
title("Image originale");
subplot(3,1,2);
imshow(DFI);
title("Homemade DFT");
subplot(3,1,3);
imshow(homemadeInverseDiscreteFourier1D(DFI)/2**n);
title("Homemade IDFT");
figure();

#affichage fft homemade :
subplot(3,1,1);
imshow(I);
title("Image originale");
subplot(3,1,2);
imshow(FFI);
title("Homemade FFT");
subplot(3,1,3);
imshow(homemadeInverseFastFourier1D(FFI)/2**n); #recadrage sur la dimension de l'image
title("Homemade IFFT");

printf("Time to compute DFT : %d seconds\nTime to compute FFT : %d seconds\n",(endDFT-startDFT),(endFFT-startFFT));