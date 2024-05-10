function mtrx = dpcm(mtrx)
    [M, ~] = size(mtrx);
    sottraendo = mtrx(1, 1);
    for i = 1:M
        sottraendo_tmp = mtrx(i, 1);
        mtrx(i, 1) = mtrx(i, 1) - sottraendo;
        sottraendo = sottraendo_tmp;
    end
end