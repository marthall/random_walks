function [ cost ] = cost_function(A, x)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

cost = 0;
[h,w] = size(A);

for vertex = 1:h
    color = x(vertex);
    row = A(vertex, :);
    matching_colors = x(logical(row));
    
    cost = cost + nnz(matching_colors==color);

end

cost = cost / 2;