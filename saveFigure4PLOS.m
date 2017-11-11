function iminfo=saveFigure4PLOS(figname)
%SAVEIMAGE4PLOS Save the figure in tiff and png files.
%
%   SAVEIMAGE4PLOS(figname) Save the figure in tiff and png files.
%
% Syntax:  saveImage4PLOS(figname)
%
% Inputs:
%   figurename - Figure name
%
% Outputs:
%    nan
%
% Example:
%    saveImage4PLOS('figure1')
%
% Other m-files required: none
% Subfunctions: none
% MAT-files required: none
%
% See also: nan
%
% $Author: Eleftherios Avramidis $
% $Email: el.avramidis@gmail.com $
% $Date: 2015/11/20 $
% $Revision: 1.0 $
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

