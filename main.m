%%
clc
clear all
close all
%% Carico l'immagine
RGB = imread("girasole.jpg");

%% ENCODING
%% Modifico l'immagine affinchè abbia numero righe e colonne divisibile per 8
RGB = dim_immagine_div_8(RGB);
%% Converto in YCbCr
YCbCr = rgb2ycbcr(RGB);
Y = YCbCr(:,:,1);
Cb = YCbCr(:,:,2);
Cr = YCbCr(:,:,3);
%% Ridico la dimensione della crominanza
% Per i due canali di crominanza eseguo la media di 4 pixel in un unico pixel
dsfun = @(block_struct) ([block_struct.data(1,1) block_struct.data(1,1);
                        block_struct.data(1,1) block_struct.data(1,1)]);
Cb = blockproc(Cb,[2 2],dsfun);
Cr = blockproc(Cr,[2 2],dsfun);

%% Transformata discreta coseno
dctfun = @(block_struct) dct2(block_struct.data);
Y = blockproc(Y, [8 8], dctfun);
Cb = blockproc(Cb, [8 8], dctfun);
Cr = blockproc(Cr, [8 8], dctfun);

%% Quantizzazione dividendo elemento per elemento per la matrice definita dallo standard
Y = quantFun(Y);
Cb = quantFun(Cb);
Cr = quantFun(Cr);
%% Effettuo un a scansione zig zag per ogni blocco 8x8
zgzfun = @(block_struct) zigzag(block_struct.data);
Y = blockproc(Y, [8 8], zgzfun);
Cb = blockproc(Cb, [8 8], zgzfun);
Cr = blockproc(Cr, [8 8], zgzfun);

%% Effettuo la dpct
Y = dpcm(Y);
Cb = dpcm(Cb);
Cr = dpcm(Cr);

%% Effettuo la codifica Run Length salvando il risultato in un file mat (encoding concluso: questo codice non prevede la codifica Huffman)
saveRunLength(Y, "Y");
saveRunLength(Cb, "Cb");
saveRunLength(Cr, "Cr");
%% DECODING

%% Effttuo la decodifica della Run Length
Y = decodeRunLength("codingResult/imageCoded_Y.mat");
Cb = decodeRunLength("codingResult/imageCoded_Cb.mat");
Cr = decodeRunLength("codingResult/imageCoded_Cr.mat");
%% Effettuo l'inversa della dpct
Y = idpcm(Y);
Cb = idpcm(Cb);
Cr = idpcm(Cr);

%% Effettuo l'inversa della zigzag
Y = startIzigzag(Y);
Cb = startIzigzag(Cb);
Cr = startIzigzag(Cr);

%% Inversa della quantizzazione
Y = iquantFun(Y);
Cb = iquantFun(Cb);
Cr = iquantFun(Cr);

%% Transformata inversa discreta coseno
idctfun = @(block_struct) idct2(block_struct.data);
Y = blockproc(Y, [8 8], idctfun);
Cb = blockproc(Cb, [8 8], idctfun);
Cr = blockproc(Cr, [8 8], idctfun);


%%
Y = uint8(Y) + 0;
Cb = uint8(Cb) + 0;
Cr = uint8(Cr) + 0;
%% Converto in YCbCr
RGBFINALE = ycbcr2rgb(cat(3, Y, Cb, Cr));
figure(1);
imshowpair(RGB, RGBFINALE, 'montage')

