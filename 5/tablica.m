function [X1 Y1]=tablica()
podaci;
X1=X(find(mod(X,2)==0));
Y1=f(X1);
Y1=round(Y1);