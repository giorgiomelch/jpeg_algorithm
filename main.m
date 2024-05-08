%%
clc
clear all
close all
%% Carico l'immagine
immRGB = imread("image.jpeg");
%% Converto in YCbCr
immYCbCr = rgb2ycbcr(immRGB);
%% Ridico la dimensione della crominanza
% Per i due canali di crominanza eseguo la media di 4 pixel in un unico pixel
Y = immYCbCr(:,:,1);
Cb = immYCbCr(:,:,2);
Cr = immYCbCr(:,:,3);
dsfun = @(block_struct) mean(block_struct.data(:));
dsCb = blockproc(Cb,[2 2],dsfun);
dsCr = blockproc(Cr,[2 2],dsfun);
%% shift dei valori di 128
Y = Y-128;
dsCb = dsCb-128;
dsCr = dsCr-128;
%% transformata discreta coseno
dctfun = @(block_struct) dct2(block_struct.data);
dctY = blockproc(Y, [8 8], dctfun);
dctCb = blockproc(dsCb, [8 8], dctfun);
dctCr = blockproc(dsCr, [8 8], dctfun);
%% quantizzazione dividendo elemento per elemento per la matrice definita dallo standard
quantY = quantFun(dctY);
quantCb = quantFun(dctCb);
quantCr = quantFun(dctCr);
%% effettuo un a scansione zig zag per ogni blocco 8x8
zgzfun = @(block_struct) zigzag(block_struct.data);
zgzY = blockproc(quantY, [8 8], zgzfun, PadPartialBlocks= true);
zgzCb = blockproc(quantCb, [8 8], zgzfun, PadPartialBlocks= true);
zgzCr = blockproc(quantCr, [8 8], zgzfun, PadPartialBlocks= true);
reshape(B, 1, []);
%% Effettuate la codifica Run Length dei coefficienti AC 
rlY = rle(reshape(zgzY, 1, []));
rlCb = rle(reshape(zgzCb, 1, []));
rlCr = rle(reshape(zgzCr, 1, []));

%% effettuo


