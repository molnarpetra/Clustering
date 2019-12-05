%% DATA LOADING, ORGANIZING
% load_data() % loads data into A matrix, comment out this line after first run to save time
sparseness = 100;
 cell_sparse_A = rarefy_cells(A, sparseness); % takes every 100th cell to save time

% I suggest organizing A to a structure from which the activations of one
% cell can be retrieved easily. Like an array of arrays, first dimension is
% cell ID. 
A_cells = convert_A_structure(cell_sparse_A);
  plot_basic_structure(cell_sparse_A)

%% COMPUTE FEATURES
% features are the number of activations in 0.1s time intervals: 
%   [0, 0.1), [0.1, 0.2), ..., [49.9, 50)
% implement get_features function!
% apply get_features to every cell and save the results
dt = 0.1;
end_time = 55; % maybe it isn't exact
feature_num = ceil(end_time/dt);
features_of_A = zeros(size(A_cells,2), feature_num);
for i=1:size(A_cells,2)
    features_of_A(i,:)=get_features(A_cells{i},dt,feature_num);
end

%% TRAINING PHASE
class_number = 4;
sample_per_class = 4;

% getting training sample cells - you may do it by hand, but this method is robust to
% sparseness changes
approx_borders = [1, 7401, 14601, 18601, 22801]; % checked on figure
training_samples = zeros(class_number, sample_per_class);
for i=1:class_number
    approx_class_cells = approx_borders(i):sparseness:approx_borders(i+1);
    class_length = length(approx_class_cells);
    middle_index = floor(class_length/2);
    training_samples(i, :) = approx_class_cells(middle_index:middle_index+sample_per_class-1);
end

% average sample cells' features in classes to create "class etalons"
class_etalons=zeros(class_number,feature_num);
for i=1:class_number
    class_etalons(i, :)=mean(features_of_A(training_samples(i,:),:),1);
end

%% CLUSTERING PHASE
% not so hard: 
% 1) compute the distance between the cells and the class etalons
% 2) choose the class with minimum distance
% +1) you may take into account the fact that clusters (seeems to) have 
% strict boundaries

current_cell_feature=zeros(1,feature_num);
classes=cell(1,class_number);
distances = zeros(size(A_cells,2),class_number);
j=1;
for i=1:size(A_cells,2)
    current_cell_feature=features_of_A(i,:);
    if sum(current_cell_feature(:))==0
        continue;
    end
    %distances=zeros(1,class_number);
    for k=1:class_number
        distance_vector = current_cell_feature(1,:)-class_etalons(k,:);
        distances(j,k)=sum((distance_vector).^2);
    end
    [~,min_index]=min(distances(j,:));
    classes{min_index}=[classes{min_index}, i];
    j=j+1;
end
for i=1:class_number
    figure(i)
    plot(classes{i})
end

