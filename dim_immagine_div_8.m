% L'algoritmo lavora con blocchi da 64 elementi 8 colonne per 8 righe.
% Questa funzione restituisce l'immagine originale con repliche delle ultime righe o
% colonne affinchè la dimensione sia divisibile per 8. Si è preferito
% aggiungere piuttosto che eliminare per evitare rimozione d'informazione. 
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
