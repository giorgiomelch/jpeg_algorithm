% Implementazione della codifica Run-Length
function output = rle(Input)
    L = length(Input);
    if L == 0
        output = [];
        return;
    end
    k = 1;
    i = 1;
    while i <= L
        count = 1;
        while i + count <= L && Input(i) == Input(i + count)
            count = count + 1;
        end
        output(k) = Input(i);
        output(k + 1) = count;
        k = k + 2;
        i = i + count;
    end
end
