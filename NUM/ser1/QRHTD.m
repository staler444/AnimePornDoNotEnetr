% QR Factorization by Householder reflections for strongly Tri Diagonal matrix
function [Q, R] = QRFHTD(A)
    N = size(A, 1);
    Q = eye(N);
    R = A;
    
    for i = 1:(N-1)
        alf = -sqrt(R(i, i).^2 + R(i+1, i).^2)*sign(R(i,i));
        uii = R(i, i) - alf;
        uji = R(i+1, i);
        nrm_u = sqrt(uii.^2 + uji.^2);
        uii = uii/nrm_u;
        uji = uji/nrm_u;

        for j = 1:N
            ch1 = -2 * (R(i, j)*uii*uii + R(i+1, j)*uii*uji);
            ch2 = -2 * (R(i, j)*uji*uii + R(i+1, j)*uji*uji);
            R(i, j) += ch1;
            R(i+1, j) += ch2;
        end

        for k = 1:N
            ch1 = -2 * (Q(k, i)*uii*uii + Q(k, i+1)*uji*uii);
            ch2 = -2 * (Q(k, i)*uii*uji + Q(k, i+1)*uji*uji);
            Q(k, i) += ch1;
            Q(k, i+1) += ch2;
        end
    end
end
