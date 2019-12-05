function features = get_features(cell_actions, dt, feature_num)

% dt = 0.1;
% end_time = 50; % maybe it isn't exact
% feature_num = ceil(end_time/dt);
features = zeros(feature_num, 1);

% count points in each interval...  
for i=1:length(cell_actions)
    features(ceil(cell_actions(i)/dt))=features(ceil(cell_actions(i)/dt))+1;
end
    

end

