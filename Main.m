
NUM_VERTICES = 50;
C = 10;
Q = 4;
N_steps = 1000;
B = 0.1;



cost_array = zeros(N_steps, 1);

x = randi(Q, NUM_VERTICES, 1);

A = zeros(NUM_VERTICES);

for i = 1:NUM_VERTICES
    for j = i+1:NUM_VERTICES
        if rand() < C / NUM_VERTICES
            A(i, j) = 1;
            A(j, i) = 1;
        end
    end
end

cost_function(A, x)

% G = graph(A);

% G.Nodes.NodeColors = x;

% P = plot(G, 'MarkerSize', 12);

% P.NodeCData = G.Nodes.NodeColors;

for t=1:N_steps
%     Copy old color list
    new_x = x;
    vertex = randi(NUM_VERTICES);
    
%     Select new color
    old_color = x(vertex);
    while old_color == new_x(vertex)
        new_x(vertex) = randi(Q);
    end
    
    cost = cost_function(A, x);
    new_cost = cost_function(A, new_x);
    
    cost_array(t) = cost;
    
    delta_H = new_cost - cost;
    
    if delta_H <= 0 || rand() > exp(-B * delta_H)
        x = new_x;
    end
end

plot(cost_array);

