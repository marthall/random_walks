function [ costArray, colors ] = SimulatedAnnealing(A, C, Q, initialColors, N_vertices, N_steps, B_0, temp_func )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

    colors = initialColors;
%     B_delta = B / N_steps;
    B = B_0

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

        if deltaCost <= 0 || rand() < exp(-B * deltaCost)
            colors = newColors;
            cost = cost + deltaCost;
        end

        
        
        if temp_func == 1
            B = B_0 * exp(t)^3;
        elseif temp_func == 2
            B = B_0 * t;
        elseif temp_func == 3
            B = B_0 * log(t);
        elseif temp_func == 4
            B = B_0 + 1000*t;
        elseif temp_func == 5
            B = B_0 * t^2;
        elseif temp_func == 6
            B = B_0 * t*log(t);
        elseif temp_func == 7
            B = B_0 * t^4;
        end

        costArray(t+1) = cost;
        
        if cost == 0
            return
        end
    end

end

