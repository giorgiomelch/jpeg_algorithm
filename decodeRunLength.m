function output = decodeRunLength(filename)
    Y_cell = load(filename).dati;
    [M, ~] = size(Y_cell);
    Y = [];
    
    for i=1:M
        a = cell2mat(Y_cell(i));
        [~, a_N] = size(a);
        tmp_dim = 0;    
        tmp_last_b = 1;
        tmp_vettore = [];
    
        for j=2:2:a_N
            tmp_dim = tmp_dim + a(j);
            if tmp_dim == 64 % sto considerando un blocchetto
                tmp_vettore = [tmp_vettore, irle(a(tmp_last_b: j))];
                tmp_last_b = j+1;
                tmp_dim = 0;
            end
            
        end
    
        Y(i,:) = tmp_vettore;
    end
    output = Y;
end