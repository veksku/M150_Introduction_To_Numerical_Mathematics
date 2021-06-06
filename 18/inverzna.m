% primer: A = [7.05 0.11 0.13 0.15; 
%               0.17 7.41 0.75 0.80; 
%               0.97 1.02 8.11 0.11; 
%               0.13 0.20 0.29 8.42];

function inverzna = inverz(A)

% du�ina matrice A
[n, m] = size(A);

% E = jedini�na matrica dimenzije nxn
E = eye(n);   

inverzna = zeros(n);

for i = 1 : n
    % re�avamo n sistema: A*X(i) = E(i)
    % inverzna = [X(1) X(2) .. X(n)]
    % X(i) je i-ta kolona inverzne matrice 
    % E(i) je i-ta kolona jedini�ne matrice
    inverzna(:, i) = LUdekompozicija(A, E(:, i));
end