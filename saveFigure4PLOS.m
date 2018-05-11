function iminfo=saveFigure4PLOS(figname)
%SAVEIMAGE4PLOS Stores the figure in tiff and png files and remove the 
%extra whitespace around the figure.
%
% Syntax:  saveImage4PLOS(figname)
%
% Inputs:
%   figname - Figure filename without the file expension
%
% Outputs:
%    none
%
% Example:
%    saveImage4PLOS('testFigure')
%    This example removes the whitespace around the figure and store it in
%    png and tif files.
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
% Version: 1.1
% Copyright: MIT License

%% Open test figure
fig=open([figname '.fig']);

%% Size of paper and position as in fig
set(fig,'PaperPositionMode', 'auto');

%% Print tiff image in 600 pixels/inch
% print(fig, '-dtiff', [figname '.tif'], '-r600', '-opengl');
print(fig, '-dtiff', [figname '.tif'], '-r600', '-painters');
% print(fig, '-depsc2', [figname '.eps']);

%% Get the margin sizes

RGB = imread([figname '.tif']);
I = rgb2gray(RGB);
imsize=size(I);

% Left margin size
for i=1:imsize(2)
    if(find(I(:,i)<255))
        left=i-1;
        break;
    end
end

% right margin size
for i=imsize(2):-1:1
    if(find(I(:,i)<255))
        right=i+1;
        break;
    end
end

% Top margin size
for i=1:imsize(1)
    if(find(I(i,:)<255))
        top=i-1;
        break;
    end
end

% Down margin size
for i=imsize(1):-1:1
    if(find(I(i,:)<255))
        down=i+1;
        break;
    end
end

%% Remove margins
I2=RGB(top:down,left:right,:);

%% Save files without margins
imwrite(I2, [figname '.tif'],'TIFF','Resolution',[600 600]);
imwrite(I2, [figname '.png'],'PNG','XResolution', 600);

%% Get tiff file information
iminfo=imfinfo([figname '.tif']);
end

