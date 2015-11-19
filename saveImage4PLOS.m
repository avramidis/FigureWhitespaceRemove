function iminfo=saveImage4PLOS( fig, figname )
%SAVEIMAGE4PLOS Save the figure 
%
%   SAVEIMAGE4PLOS(figname) calculates figures ppi.
%
% Syntax:  saveImage4PLOS(input1)
%
% Inputs:
%    input1 - Figure name
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
% $Date: 2015/05/09 $    
% $Revision: 0.1 $
% Copyright: MIT License

% print(fig, '-depsc2', [figname '.eps']);
print(fig, '-dtiff', [figname '.tif'], '-r600', '-opengl');

RGB = imread([figname '.tif']);

I = rgb2gray(RGB);
imsize=size(I);

%% Get the margin sizes

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


I2=RGB(top:down,left:right,:);

imwrite(I2, [figname '.tif'],'TIFF','Resolution',[600 600])
iminfo=imfinfo([figname '.tif']);
end

