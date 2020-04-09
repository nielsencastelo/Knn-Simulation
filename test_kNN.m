%  Demonstrate nearest neighbour classifier.
%

clear; clc; close all;

% Generate the test data
ndata = 50;

[x, c] = dem2ddat(ndata);
kk = 3;
% Use dkmeans for clustering
[classes,center,it,mssc] = dkmeans(x,kk,2,1e-6,1);
k = 1;

colors = [0.9349      0.74643     0.029448
          0.13967     0.062225     0.043059
          0.11771      0.71425      0.18966];
plota(x,classes,colors);

[a,b] =  ginput(1); % select one register
regis = [a b];
net = kNN(x,classes,regis,k);


