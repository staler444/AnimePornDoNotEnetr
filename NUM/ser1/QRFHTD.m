% QR Factorization by Householder reflections for strongly Tri Diagonal matrix
function [Q, R] = QRFHTD(A)
    N = size(A, 1);
    Q = eye(N);
    R = A;
    
    % zapominamy już o rekurencji, żeby łatwiej się implementowało
    % wsztsytkie przekształcenia wyliczamy odrazu w pełnym wymiarze
    % w komentarzach nomenklatura z opisu algorytmu, żeby było widać co się dzieje
    for i = 1:(N-1)
        % wyliczenie wektora v
        alf = -sqrt(R(i, i).^2 + R(i+1, i).^2)*sign(R(i,i));
        uii = R(i, i) - alf;
        uji = R(i+1, i);
        nrm_u = sqrt(uii.^2 + uji.^2);
        uii = uii/nrm_u; % pierwsza współżędna wektora v
        uji = uji/nrm_u; % druga współżędna wektora v

        % zmieniają nam się tylko cztery komórki w tym tylko jedna macierzy P' (z opisu algorytmu)
        for j = i:(i+1)
            % zmiana komórek wierszy 
            ch1 = -2 * (R(i, j)*uii*uii + R(i+1, j)*uii*uji);
            ch2 = -2 * (R(i, j)*uji*uii + R(i+1, j)*uji*uji);
            R(i, j) += ch1;
            R(i+1, j) += ch2;
        end

        % to samo tylko tym razem domnażamy przekształcenie Householdera z drugiej strony macierzy
        % czyli zmieniają nam się kolumny
        % tym razem może zmieniać się więcej komórek ale nie więcej niż O(N)
        for k = 1:N
            ch1 = -2 * (Q(k, i)*uii*uii + Q(k, i+1)*uji*uii);
            ch2 = -2 * (Q(k, i)*uii*uji + Q(k, i+1)*uji*uji);
            Q(k, i) += ch1;
            Q(k, i+1) += ch2;
        end
    end
end
