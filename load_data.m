% use fscanf (check documentation)
% note: close the file in the end!

% SOULTION
file_path = 'spikes.spk';
fileID = fopen(file_path,'r');
formatSpec = '%d %f';
sizeA = [2 Inf];
A = fscanf(fileID,formatSpec,sizeA);
fclose(fileID);