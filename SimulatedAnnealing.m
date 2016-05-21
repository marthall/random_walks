function [ costArray, colors ] = SimulatedAnnealing(A, C, Q, initialColors, N_vertices, N_steps, B )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

    colors = initialColors;
    B_delta = B / N_steps;

    costArray = zeros(N_steps + 1, 1);

    cost = cost_function(A, colors);

    costArray(1) = cost;

    % G = graph(A);
    % 
    % G.Nodes.Nodecolors = colors;
    % 
    % P = plot(G, 'MarkerSize', 12);
    % 
    % P.NodeCData = G.Nodes.Nodecolors;

    for t=1:N_steps
    %     Copy old colors list
        newColors = colors;

    %     Select random new vertecolors
        vertex = randi(N_vertices);

    %     Select new colors
        old_color = colors(vertex);
        while old_color == newColors(vertex)
            newColors(vertex) = randi(Q);
        end

        deltaCost = getDeltaCost(A, vertex, colors, newColors);

        if deltaCost <= 0 || rand() > exp(-B * deltaCost)
            colors = newColors;
            cost = cost + deltaCost;
        end

        B = B - B_delta;

        costArray(t+1) = cost;
        
        if cost == 0
            return
        end
    end

end

