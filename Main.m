
%% Import from file

A = importdata('matrix.mat');
[N_vertices,~] = size(A);
C = 20;

colors = randi(Q, N_vertices, 1);

%% Create Erdos-Renyi matrix

N_vertices = 1000;
N_steps = 100000;
C = 20;
Q = 3;

colors = randi(Q, N_vertices, 1);

A = ErdosRenyiMatrix(N_vertices, C);


%% Test different functions
% B_inits = [100];
% func_values = [8 9 10 11];

N_steps = 100000;
Q = 5;
[~,~, bCost, bColors] = SimulatedAnnealing(A, C, Q, colors, N_vertices, N_steps, 100, 11);

% 
% no_lines = length(B_inits) * length(func_values);
% cost_arrays = zeros(no_lines, N_steps + 1);
% resultColors = zeros(no_lines, N_vertices);
% 
% bestColors2 = zeros(length(func_values), length(N_vertices));
% bestCost2 = zeros(length(func_values));
% 
% for j=1:length(func_values)
%    
% %     bestColors2(j,:) = bColors;
%     bestCost2(j) = bCost;
% end

% figure(2);
% plot(cost_arrays.');
% labels = strtrim(cellstr(num2str(func_values'))');
% legend(labels, 'Location','northeast');
% xlabel('$c \in \{1, N \}$','Interpreter','LaTex');
% ylabel('$H(x^t)$', 'Interpreter', 'LaTex');
% 
% % labels_int = [];
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

% reshape(cost_arrays(:,end), [length(func_values) length(B_inits)])


%% Test different values of Q as a function of C

Qs = [3 4 5];
Cs = linspace(1, N_vertices, 20);

colors = zeros(N_vertices, 1);

QC = zeros(length(Qs), length(Cs));
bestColors = zeros(length(Qs), length(Cs));

for q = 1:length(Qs)
    colors = randi(Q, N_vertices, 1);
    for c = 1:length(Cs)
        A = ErdosRenyiMatrix(N_vertices, Cs(c));
        
        [~, ~, bestCost, bColors] = SimulatedAnnealing(A, Cs(c), Qs(q), colors, N_vertices, N_steps, 0, 11);
        QC(q, c) = bestCost;
%         bestColors(q, c) = bColors;
    end
end

figure(3);

for q=1:length(Qs)
    plot(Cs, QC(q,:)); hold on;
end
hold off;
labels = strtrim(cellstr(num2str(Qs'))');
legend(labels, 'Location','northeast');
title('Erdos-Renyi random graph, $N = 1000$' ,'Interpreter','LaTex');
xlabel('$c \in \{1, N \}$','Interpreter','LaTex');
ylabel('$H{min}$','Interpreter','LaTex');

