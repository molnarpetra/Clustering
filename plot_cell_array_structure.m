function plot_cell_array_structure(cells) 

figure
hold all
for c = 1:length(cells)
    ones(1,length(cells{c}))*c
    cells{c}
    plot(ones(1,length(cells{c}))*c, cells{c}, 'b.')
end
hold off
% 
% time_min = 0;
% time_max = 50;
% cell_max = 23000;
% 
% figure(1);
% plot(A(1, :), A(2, :), '.')
% title('Activations of neurons');
% xlim([0, cell_max]);
% ylim([time_min, time_max]);
% xlabel('Cell index');
% ylabel('Time (s)');
end

