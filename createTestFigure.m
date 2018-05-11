function createTestFigure()

% Change default axes fonts.
set(0,'DefaultAxesFontName', 'Arial')
set(0,'DefaultAxesFontSize', 10)
% Change default text fonts.
set(0,'DefaultTextFontname', 'Arial')
set(0,'DefaultTextFontSize', 10)

% Create sample figure
x=1:0.1:100;
y=sin(x);
plot(x,y);
ylim([-1.5 1.5]);
title('Test figure')
xlabel('x')
ylabel('y')

% Save the figure
saveas(gcf,'testFigure.fig');