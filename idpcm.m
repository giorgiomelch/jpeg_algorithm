% Implementazione della decodifica idpcm: data una matrice per ogni blocco
% 8x8 il valore del primo elemento è addizionato con qullo del blocco 
% precedente, a eccezione del primo blocco. Si tenga in considerazione che
% la matrice passata in input è in numero di righe 8 volte minore rispetto
% alla matrice orininale nelle righe mentre 8 volte maggiore nelle colonne
% in quanto i blocchi 8x8 sono collassati in un vettore a seguito della decisione intrapresa nella RLE.

function mtrx = idpcm(mtrx)
    [M, N] = size(mtrx);
    addendo = mtrx(1, 1);
    for i = 1:M
        for j=1:64:N
            if i ~= 1 && j ~= 1
                mtrx(i, j) = mtrx(i, j) + addendo;
                addendo = mtrx(i, j);
            end
        end
    end
end