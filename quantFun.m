function output = quantFun(mtrx)
    mtrxQuant= [16	11	10	16	24	40	51	61;
            12	12	14	19	26	58	60	55;
            14	13	16	24	40	57	69	56;
            14	17	22	29	51	87	80	62;
            18	22	37	56	68	109	103	77;
            24	35	55	64	81	104	113	92;
            49	64	78	87	103	121	120	101;
            72	92	95	98	112	100	103	99];
    fun = @(block_struct) matrixDotDivision(block_struct.data, mtrxQuant);
    output = blockproc(mtrx, [8 8], fun);
end

function output = matrixDotDivision(m_a, m_b)
    [M_a, N_a] = size(m_a);
    [M_b, N_b] = size(m_b);
    if [M_a, N_a] == [M_b, N_b]
        output = m_a ./ m_b;
    else
        m_b = m_b(1:M_a, 1:N_a);
        output = m_a ./ m_b;
    end
end