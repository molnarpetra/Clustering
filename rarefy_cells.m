function cell_sparse_A = rarefy_cells(A,sparseness)
% getting every 100th row of A is NOT good
% logical arrays, indexing
% ismember()
chosen_neurons_ids = 1:sparseness:length(A(1,:));
A_sparse_inds = ismember(A(1,:), chosen_neurons_ids);
cell_sparse_A = A(:, A_sparse_inds);
end








% SOLUTION
% chosen_neurons_ids = 1:sparseness:length(A(1,:));
% A_sparse_inds = ismember(A(1,:), chosen_neurons_ids);
% cell_sparse_A = A(:, A_sparse_inds);