function [ cost_array ] = cost_Array( N_steps,NUM_VERTICES,B,x,Q,A, alt,divisor)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
s=0;

for t=1:N_steps
    s= s+1;
  % if t>= N_steps/2
    %    divisor = divisor^2;
   % end
    
   
    if mod(s,divisor) == 0
        if alt == 1
            B = B*(1/exp(s))^3;
        elseif alt == 2
            B = B*(1/s^3)^3;
        end
    end
    
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

