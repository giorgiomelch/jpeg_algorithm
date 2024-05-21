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