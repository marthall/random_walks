function [ deltaCost ] = getDeltaCost(aMatrix, vertex, colors, newColors)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

neighbors = logical(aMatrix(vertex, :));

% conflictingNeighbors = logical(colors(vertex) == colors(neighbors))

oldPartialCost = sum(colors(vertex) == colors(neighbors));
newPartialCost = sum(newColors(vertex) == newColors(neighbors));

deltaCost = newPartialCost - oldPartialCost;

end

