function [iter, x] = sistem2(A, b, tol)

% Prekidamo izvr�avanje programa ukoliko matrica nije dijagonalno dominantna
if dominantna(A)==0
    error('Matrica nije dijagonalno dominantna');  
end

n = length(A);
A1 = zeros(n);
b1 = zeros(n, 1);


for i = 1:n
    A1(i, :) = -A(i, :) / A(i, i);
    A1(i, i) = 0;
    b1(i) = b(i) / A(i, i);
end

q = norm(A1, inf); % uniformna norma matrice  
tol = tol * (1-q) / q;

x0 = b1; % po�etna aproksimacija re�enja
x = x0;
iter = 1;

while 1 
     % za nala�enje nove apoksimacije koordinate x_i ta�nog re�enja
     % koristimo vrednosti koordianta x_j, j=1,...i-1 dobijenih iz iste iteracije
     % zbog toga moramo koristiti for petlju i u njenom i-tom prolasku 
     % ra�unati vrednost koordinate x_i (razlika u odnosu na metodu proste iteracije) 
     for i = 1:n
         x(i) = A1(i, :) * x + b1(i); 
     end
     iter = iter + 1;
     if all(abs(x - x0) <= tol) % kriterijum zaustavljanja
       break 
     end
     x0 = x;
end

% Provera:
% disp('Tacno resenje:');
% disp(A\b);