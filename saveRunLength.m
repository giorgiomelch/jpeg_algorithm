function saveRunLength(matrice, type)
    nomeFile= "codingResult/imageCoded" + type + ".txt";
    if exist(nomeFile, 'file')
        delete(nomeFile);
    end
    fileID = fopen(nomeFile, 'w');

    [M, ~] = size(matrice);  
    for i = 1:M
        tmp = rle(matrice(i, :));
        L = length(tmp);
        for j = 1:L
            fprintf(fileID, '%d', tmp(j));
            if j < L
                fprintf(fileID, ',');
            end
        end
        if i < M
            fprintf(fileID, '\n');
        end
    end
    
    fclose(fileID);
end
