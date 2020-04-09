% k Nearest Neighbour algorithm
% Based on Article Nearest Neighbor Pattern Classification by T. M. Cover
% and P. E. Hart in 1967.
% Data: 10/05/2016
% Autor: Nielsen C. Damasceno
% Entrada:      x - data (n,d) (d is the dimension of the data)
%               classes - (n,1) training pattern
%               s - (1,d) registration to classify
%               k - ith nearest neighbor s
% Saída:        ganhador - which class the 's' record belongs

function [ganhador] = kNN(x,classes,s,k)
       
    kk = max(classes); % Number of classes to classify
   
    [lin,~] = size(x);
    dist = zeros(lin,1);
    for i  = 1 : lin
        dist(i) = sqrt((x(i,:)- s)*(x(i,:)- s)');
    end
    plotaCentroide(s,'red');
    
    % Now we find the k nearest s
    ele = zeros(1,k);
    if length(dist)== k
        elemento = 1 : k;
        return;
    end
    for i = 1 : k
        pos = find(dist ~= 0);       % Takes the different elements of zero
        if isempty(dist)
            disp('Empty');
        end
        [~,ele(i)] = min(dist(pos)); % Get the lower and returns its position
        [ele(i)] = pos(ele(i));
        dist(ele(i)) = 0;            % It was located now it will be reset
    end
    
    % Now we will tell who is the winner
   vencedor = zeros(kk,1); 
   for j = 1 : kk % Number of Classes
        vencedor(j) = sum(classes(ele,:) == j);
   end
   
   [~,ganhador] = max(vencedor);
    
    plotaCentroide(x(ele,:),'yellow');
    plota_linhas(x(ele,:),ones(1,k),s,'black');
        
    title(['O registro pertence a classe ' num2str(ganhador)]);    
end