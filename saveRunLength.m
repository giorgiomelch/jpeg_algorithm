function saveRunLength(matrice, type)
    nomeFile = "codingResult/imageCoded_" + type + ".mat";
    if exist(nomeFile, 'file')
        delete(nomeFile);
    end

    [M,N] = size(matrice);
    dati = cell(M, 1);
    for i = 1:M
        dati{i} = [];
        for j = 1:64:N % 64 è il passo in quanto della Run Length, ovvero i 64 elementi che rappresentano un blocchetto
            endIdx = min(j+64-1, N);
            blocco = matrice(i, j:endIdx);
            dati{i} = [dati{i}, rle(blocco)];
        end
    end

    save(nomeFile, 'dati');
end
