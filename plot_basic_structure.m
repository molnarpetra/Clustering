function plot_basic_structure(A) % can plot A, or sparse A

time_min = 0;
time_max = 50;
cell_max = 23000;

figure
plot(A(1, :), A(2, :), '.')
title('Activations of neurons', 'FontSize', 24);
xlim([0, cell_max]);
ylim([time_min, time_max]);
xlabel('Cell index', 'FontSize', 24);
ylabel('Time (s)', 'FontSize', 24);
xline(7309, 'r');
xline(14619, 'r');
xline(18750, 'r');

end



