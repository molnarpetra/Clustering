function organized_A = convert_A_structure(A)
% To create array of arrays, use cell-arrays.

% Example:
% cela = {[1, 2, 4]}; % creates a 1x1 cell-array, with a simple array as an element
% cela{2} = [3]; % creates a second element for the cell array
% cela{1} = [cela{1}, 5]; % modifies the first element, attaches a new number
% cela{1} < 3 % logical indexing still works!

% For each row in A, put the activation time into the array defined by its ID!

maxi = max(A(1,:));
organized_A = cell(1,maxi);

for i=1:length(A(1,:))
    organized_A{A(1,i)}=[organized_A{A(1,i)},A(2,i)];
end
end

