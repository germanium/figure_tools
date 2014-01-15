function caxisAll(CLIM, h)
% caxisAll([CLIM], [h])
% CLIM - Array of color limits [cmin cmax]. If missing it uses auto clim
% h    - Figure handle. Default: gcf
%
% Sets the clim for all of the axes in the figure.
% 
% gP 10/16/2013

if nargin < 1 || isempty(CLIM)
    autoCLIM = true;
else
    autoCLIM = false;
end

if nargin < 2 || isempty(h)
    h = gcf;
end

allAx = findobj(h, 'Type', 'axes');
ixFigAx = ~ismember(get(allAx,'Tag'), ...   % Find the axes of legend and
                    {'legend','Colorbar'}); %  colorbar and remove it from ix.
hAx = allAx(ixFigAx);

for i=1:length(hAx)
    
    if autoCLIM
        set(hAx(i), 'CLimMode', 'auto')
    else
        set(hAx(i), 'CLim', CLIM)
    end
    
end

