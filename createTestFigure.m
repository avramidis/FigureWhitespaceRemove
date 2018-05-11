function createTestFigure()
%CREATETESTFIGURE Creates a test figure and stores it in a file named
%testFigure.fig.
%
% Syntax:  createTestFigure()
%
% Inputs:
%   none
%
% Outputs:
%    none
%
% Example:
%    createTestFigure()
%    This example creates and stores a figure with a plot of the sin
%    function.
%
% Other m-files required: none
% Subfunctions: none
% MAT-files required: none
%
% See also: none
%
% Author: Eleftherios Avramidis $
% Email: el.avramidis@gmail.com $
% Date: 11/05/2018
% Version: 1.0
% Copyright: MIT License

%% Change default axes fonts.
set(0,'DefaultAxesFontName', 'Arial')
set(0,'DefaultAxesFontSize', 10)
% Change default text fonts.
set(0,'DefaultTextFontname', 'Arial')
set(0,'DefaultTextFontSize', 10)

%% Create sample figure
x=1:0.1:100;
y=sin(x);
plot(x,y);
ylim([-1.5 1.5]);
title('Test figure')
xlabel('x')
ylabel('y')

%% Store the figure
saveas(gcf,'testFigure.fig');