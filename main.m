close all
clear all

% Create sample figure
x=1:0.1:100;
y=sin(x);
plot(x,y);
ylim([-1.5 1.5]);

% Save the figure
saveas(gcf,'testFigure.png');

% open('NSGASpeedup.fig')

iminfo=saveImage4PLOS(gcf, 'testFigure');

% Calculate width and height in inches
width=iminfo.Width/iminfo.XResolution;
height=iminfo.Height/iminfo.YResolution;

% Check width
if width<2.63 || width>7.5
    disp('Width of image out of bounds!')
end
% Check height
if height>8.75
    disp('Height of image out of bounds!')
end

% Maximum: 7.5 in (19.05 cm) W x 8.75 in (22.23 cm) H
% Minimum: 2.63 in (6.68 cm) W