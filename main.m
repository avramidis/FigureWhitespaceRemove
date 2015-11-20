close all
clear all

% Process and save the figure
iminfo=saveFigure4PLOS('testFigure');

% Calculate width and height in inches
width=iminfo.Width/iminfo.XResolution;
height=iminfo.Height/iminfo.YResolution;

% Check size
% Maximum: 7.5 in (19.05 cm) W x 8.75 in (22.23 cm) H
% Minimum: 2.63 in (6.68 cm) W
% Check width
if width<2.63 || width>7.5
    disp('Width of image out of bounds!')
end
% Check height
if height>8.75
    disp('Height of image out of bounds!')
end
