% Avvia l'inversa della funzione zig-zag tenendo conto che in input  è data 
% una matrice che per ogni riga contiene i blocchi 8x8 adiacenti della
% matrice originale collassati in un vettore.
function output = startIzigzag(matrix)
    [M, N] = size(matrix);
    Y_mtrx = ones(M*8, N/8);
    s=1;
    for i=1:M
        k=1;
        for j=1:64:N
            Y_mtrx(s:s+7, k:k+7) = izigzag(matrix(i, j:j+63), 8, 8);
            k = k+8;
        end
        s = s+8;
    end
    output = Y_mtrx;
end

% Implementazione dell'inversa della zig-zag

function output = izigzag(in, vmax, hmax)
    h = 1; % Indice della colonna corrente
    v = 1; % Indice della riga corrente
    output = zeros(vmax, hmax);
    i = 1;
    while (v <= vmax) && (h <= hmax)
        output(v, h) = in(i);
        i = i + 1;

        if mod(h + v, 2) == 0 
            if h == hmax
                v = v + 1; % Muoviti sotto se all'ultima colonna
            elseif v == 1
                h = h + 1; % Muoviti sotto se all'ultima riga
            else
                h = h + 1; 
                v = v - 1;
            end
        else 
            if v == vmax
                h = h + 1;
            elseif h == 1
                v = v + 1;
            else
                h = h - 1; 
                v = v + 1;
            end
        end

        if (v == vmax) && (h == hmax)
            output(v, h) = in(i);
            break
        end
    end
end
