function immagineModificata = aggiungiRigheColonne(immagine)
    [righe, colonne, ~] = size(immagine);
    
    righeDaAggiungere = mod(8 - mod(righe, 8), 8);
    colonneDaAggiungere = mod(8 - mod(colonne, 8), 8);
   
    ultimeRighe = immagine(end-righeDaAggiungere+1:end, :, :);
    immagine = cat(1, immagine, repmat(ultimeRighe, [righeDaAggiungere, 1, 1]));

    ultimeColonne = immagine(:, end-colonneDaAggiungere+1:end, :);
    immagine = cat(2, immagine, repmat(ultimeColonne, [1, colonneDaAggiungere, 1]));

    immagineModificata = immagine;
end
