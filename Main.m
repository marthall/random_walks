
N_vertices = 1000;
N_steps = 50000;
C = 20;
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


B_inits = [0.1 1 10 100 1000 10000];
func_values = [5 6 7];

no_lines = length(B_inits) * length(func_values);

cost_arrays = zeros(no_lines, N_steps + 1);
resultColors = zeros(no_lines, N_vertices);

for i=1:length(B_inits)
    for j=1:length(func_values)
        [cost_arrays((i-1)*length(func_values)+j,:), resultColors((i-1)*length(func_values)+j,:)] = SimulatedAnnealing(A, C, Q, colors, N_vertices, N_steps, B_inits(i), func_values(j));
    end
end

figure(2);
plot(cost_arrays.');
% labels_int = [];
% label_no = 1;
% for i = 1:length(B_inits)
%     for j = 1:length(func_values)
% %         l = strcat('B: ' + num2str(B_inits(i)), ' F: ', num2str(func_values(j)));
%         labels_int = [labels num2str(label_no)];
%         label_no = label_no + 1;
%     end
% end
% labels = strtrim(cellstr(num2str(labels_int'))');
% legend(labels, 'Location','northeast')

% figure(3);
% finalColors = resultColors(end,:);
% G = graph(A);
% G.Nodes.Nodecolors = finalColors.';
% P = plot(G, 'MarkerSize', 12);
% P.NodeCData = G.Nodes.Nodecolors;
% 
% for i=1:length(B_inits)
%     for j=1:length(func_values)
%        B_inits(i), func_values(j), cost_arrays((i-1)*length(func_values)+j,end)
%     end
% end

reshape(cost_arrays(:,end), [length(func_values) length(B_inits)])


