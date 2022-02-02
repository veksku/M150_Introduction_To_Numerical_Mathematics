function C=cebisev_poly(n)
C{1} = 1;
C{2} = [1 0];
for i=2:n
  C{i+1}=[2*C{i} 0]-[0 0 C{i-1}];
end
X=linspace(-1,1)
hold on
for i=1:n+1
  p
  lot(X,polyval(C{i},X));
end
hold off
celldisp(C);