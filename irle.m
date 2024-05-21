%DA MODIFICARE CON CICLI FOR
function output=irle(vettore)
    L=length(vettore);
    s=1;
    k=1;
    i=1;
    output = ones(1, 64);
    while i<=L
        while s<=vettore(i+1)
            output(k)=vettore(i);
            s=s+1;
            k=k+1;
        end
        i=i+2;
        s=1;
    end
end