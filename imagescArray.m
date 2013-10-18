function imagescArray(A, XYaxis, CLIM)
% imagescArray(A, [XYaxis], [CLIM])
%
% A      - Cell array of matrices. It  will get plotted in the same order they 
%          are in the cell array. They should all be the same size since they 
%          use the same XYaxis
% XYaxis - Cell array containing the axis such that XYaxis{1} is the x-axis and 
%          XYaxis{2} is the y-axis. Default: index
% CLIM   - Array of color limits [cmin cmax]. If empty it uses automatic
%          range based on the data. Default: automatic
%
% It plots an array of imagesc with axis xy tight
%
% gP 10/16/2013

if nargin < 2 || isempty(XYaxis)
    XYaxis = {1:size(A,2), 1:size(A,1)};
end

if nargin < 3 || isempty(CLIM)
    autoCLIM = true;
else
    autoCLIM = false;
end
    
[Nr, Nc] = size(A);

for i=1:Nr
    for j=1:Nc
        
        subplotrc(Nr,Nc, i,j)
        imagesc(XYaxis{1}, XYaxis{2}, A{i,j})
        
        if ~autoCLIM
            caxis(CLIM)
        end
        
        axis xy tight
        
    end
end

