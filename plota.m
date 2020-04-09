function plota(x,classes,colors)
    n = length(classes); % Pega a qtd de amostras
    hold on;
    for i = 1 : n
        p = plot(x(i,1), x(i,2),'d','LineWidth',4);
        set(p, 'color', colors(classes(i),:))
    end
end