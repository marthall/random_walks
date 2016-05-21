
N_vertices = 1000;
N_steps = 50000;
C = 100;
Q = 5;

colors = randi(Q, N_vertices, 1);

A = zeros(N_vertices);

for i = 1:N_vertices
    for j = i+1:N_vertices
        if rand() < C / N_vertices
            A(i, j) = 1;
            A(j, i) = 1;
        end
    end
end

% figure(1);
% G = graph(A);
% G.Nodes.Nodecolors = colors;
% P = plot(G, 'MarkerSize', 12);
% P.NodeCData = G.Nodes.Nodecolors;


B_inits = [0.01 0.001 0.0001 0.00001 0.000001];

cost_arrays = zeros(length(B_inits), N_steps + 1);
resultColors = zeros(length(B_inits), N_vertices);

for i=1:length(B_inits)
    [cost_arrays(i,:), resultColors(i,:)] = SimulatedAnnealing(A, C, Q, colors, N_vertices, N_steps, B_inits(i));
end

figure(2);
plot(cost_arrays.');
labels = strtrim(cellstr(num2str(B_inits'))');
legend(labels, 'Location','northeast')

% figure(3);
% finalColors = resultColors(end,:);
% G = graph(A);
% G.Nodes.Nodecolors = finalColors.';
% P = plot(G, 'MarkerSize', 12);
% P.NodeCData = G.Nodes.Nodecolors;

cost_arrays(:,end);


