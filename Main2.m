NUM_VERTICES = 300;
C = 10;
Q = 6;
N_steps = 1000;
B = 0.3;

x = randi(Q, NUM_VERTICES, 1);

A = zeros(NUM_VERTICES);
A2 = zeros(NUM_VERTICES);
A3 = zeros(NUM_VERTICES);
A4 = zeros(NUM_VERTICES);
A5 = zeros(NUM_VERTICES);

for i = 1:NUM_VERTICES
    for j = i+1:NUM_VERTICES
        if rand() < C / NUM_VERTICES
            A(i, j) = 1;
            A(j, i) = 1;
        end
        
        if rand() < C / NUM_VERTICES
            A2(i, j) = 1;
            A2(j, i) = 1;
        end
        
        if rand() < C / NUM_VERTICES
            A3(i, j) = 1;
            A3(j, i) = 1;
        end
        
        if rand() < C / NUM_VERTICES
            A4(i, j) = 1;
            A4(j, i) = 1;
        end
        
        if rand() < C / NUM_VERTICES
            A5(i, j) = 1;
            A5(j, i) = 1;
        end
    end
   
end

cost_function(A, x);

%G = graph(A);

%G.Nodes.NodeColors = x;

%P = plot(G, 'MarkerSize', 12);

%P.NodeCData = G.Nodes.NodeColors;

divisor1 = 10;
divisor2 = 50;

cost_array = 1/5 * (cost_Array(N_steps,NUM_VERTICES,B,x,Q,A,1,divisor2) + cost_Array(N_steps,NUM_VERTICES,B,x,Q,A2,1,divisor2) +cost_Array(N_steps,NUM_VERTICES,B,x,Q,A3,1,divisor2) + cost_Array(N_steps,NUM_VERTICES,B,x,Q,A4,1,divisor2) + cost_Array(N_steps,NUM_VERTICES,B,x,Q,A5,1,divisor2));
cost_array1 = 1/5 * (cost_Array(N_steps,NUM_VERTICES,B,x,Q,A,1,divisor1) + cost_Array(N_steps,NUM_VERTICES,B,x,Q,A2,1,divisor1) +cost_Array(N_steps,NUM_VERTICES,B,x,Q,A3,1,divisor1) + cost_Array(N_steps,NUM_VERTICES,B,x,Q,A4,1,divisor1) + cost_Array(N_steps,NUM_VERTICES,B,x,Q,A5,1,divisor1));
cost_array2 = 1/5 * (cost_Array(N_steps,NUM_VERTICES,B,x,Q,A,2,divisor2) + cost_Array(N_steps,NUM_VERTICES,B,x,Q,A2,2,divisor2) +cost_Array(N_steps,NUM_VERTICES,B,x,Q,A3,2,divisor2) + cost_Array(N_steps,NUM_VERTICES,B,x,Q,A4,2,divisor2) + cost_Array(N_steps,NUM_VERTICES,B,x,Q,A5,2,divisor2));
cost_array3 = 1/5 * (cost_Array(N_steps,NUM_VERTICES,B,x,Q,A,2,divisor1) + cost_Array(N_steps,NUM_VERTICES,B,x,Q,A2,2,divisor1) +cost_Array(N_steps,NUM_VERTICES,B,x,Q,A3,2,divisor1) + cost_Array(N_steps,NUM_VERTICES,B,x,Q,A4,2,divisor1) + cost_Array(N_steps,NUM_VERTICES,B,x,Q,A5,2,divisor1));

plot(cost_array,'color', 'g');hold on ;
plot(cost_array1,'color', 'y');  hold on;
plot(cost_array2,'color', 'r'); hold on ;
plot(cost_array3,'color', 'b');
