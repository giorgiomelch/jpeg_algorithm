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