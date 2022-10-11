close all
clear all
pkg load image;

#generation image 2D de taille 2^N
n = 4;
I = rand(2**n,2**n);
startDFT = time();
DFI = homemadeDiscreteFourier2D(I);
endDFT = time();
startFFT = time();
FFI = homemadeFastFourier2D(I);
endFFT = time();

#affichage ft référence :
subplot(3,1,1);
imshow(I);
title("Image originale");
subplot(3,1,2);
imshow(fft2(I));
title("FT2 Référence");
subplot(3,1,3);
imshow(ifft2(fft2(I)));
title("IFT2 Référence");
figure();

#affichage dft2 homemade :
subplot(3,1,1);
imshow(I);
title("Image originale");
subplot(3,1,2);
imshow(DFI);
title("Homemade DFT2");
subplot(3,1,3);
imshow(homemadeInverseDiscreteFourier2D(DFI)/2**(2*n));
title("Homemade IDFT2");
figure();

#affichage fft2 homemade :
subplot(3,1,1);
imshow(I);
title("Image originale");
subplot(3,1,2);
imshow(FFI);
title("Homemade FFT2");
subplot(3,1,3);
imshow(homemadeInverseFastFourier2D(FFI)/2**(2*n));
title("Homemade IFFT2");

printf("Time to compute DFT : %d seconds\nTime to compute FFT : %d seconds\n",(endDFT-startDFT),(endFFT-startFFT));