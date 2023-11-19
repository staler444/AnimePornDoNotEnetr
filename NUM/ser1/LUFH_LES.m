% LUFH - Linear Equations Solver
function [x] = LUFH_LES(A, b)
    % korzystamy z wcześniejszego algorytmu
    [L, U] = LUFH(A);
    N = size(b, 1);

    y = zeros(N, 1);
    % pierwszą zmienną wyliczamy ręcznie
    y(1) = b(1)/L(1, 1);
    for i = 2:N
        % podstawiamy już wyliczone zmienne i "przerzucamy" na drugą stronę równania
        for j = 1:(i-1)
            b(i) -= L(i,j)*y(j);
        end
        % wyliczamy kolejną zmienną
        y(i) = b(i)/L(i, i);
    end

    x = zeros(N, 1);
    % pierwszą zmienną wyliczamy ręcznie
    x(N) = y(N)/U(N,N);
    for i = (N-1):-1:1
        % podstawiamy już wyliczone zmienne i "przerzucamy" na drugą stronę równania
        for j = (i+1):N
            y(i) -= U(i, j)*x(j);
        end
        % wyliczamy kolejną zmienną
        x(i) = y(i)/U(i, i);
    end
end
