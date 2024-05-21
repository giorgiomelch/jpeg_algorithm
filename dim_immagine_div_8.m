function immagineModificata = dim_immagine_div_8(immagine)
    [righe, colonne, ~] = size(immagine);
    
    righeDaAggiungere = 8 - mod(righe, 8);
    colonneDaAggiungere = 8 - mod(colonne, 8);
   
    ultimaRighe = immagine(end, :, :);
    immagine = cat(1, immagine, repmat(ultimaRighe, [righeDaAggiungere, 1, 1]));

    ultimaColonne = immagine(:, end, :);
    immagine = cat(2, immagine, repmat(ultimaColonne, [1, colonneDaAggiungere, 1]));

    immagineModificata = immagine;
end
