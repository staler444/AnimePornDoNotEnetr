% LU Factorization for strongly diagonal dominant Householders matrix
function [L, U] = LUFH(A)
    N = size(A, 1);
    % będziemy budować L i U "w miejscu"
    L = eye(N);
    U = A;

    for i = 1:(N-1)
        c = 1/U(i, i);
        % ustawiamy v1*c z opisu
        L(i+1, i) = U(i+1, i) * c;
        % zerujemy pierwszą kolumne pod diagonalą
        U(i+1, i) = 0;

        % wyliczamy A' - c .* v * transpose(w)
        for j = i+1:N
            U(i+1, j) -= c * U(i, j) * A(i+1, i);
        end
    end
end
