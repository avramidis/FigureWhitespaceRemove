%EXAMPLE Example script that demonstrates how to call the figureWhitespaceRemove
%function.
%
% Syntax:  example
%
% Inputs:
%   none
%
% Outputs:
%    none
%
% Example:
%    example
%    This example script demonstrates how to call the figureWhitespaceRemove
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
% Date: 12/05/2018
% Version: 1.0
% Copyright: MIT License

close all
clear variables

%% Create and example figure
createTestFigure()

%% Process and save the figure
iminfo=figureWhitespaceRemove('testFigure');

%% Calculate width and height in inches
width=iminfo.Width/iminfo.XResolution;
height=iminfo.Height/iminfo.YResolution;

%% Check size
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
