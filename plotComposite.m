function plotComposite(fileNames, titleStr)
% plotComposite(fileNames, titleStr)
% fileNames - Cell array with the paths to the .fig files to use in the
%             plot. The size of the array should  match the size of the
%             desired subplot plot.
% titleStr  - Cell array with the titles of each plot. Same size as
%             fileNames
%
% http://stackoverflow.com/questions/4008880/producing-subplots-and-then-combine-them-into-a-figure-later-in-matlab
%
% gP 11/16/2012

if nargin<2 || isempty(titleStr)
    titleStr = cell(size(fileNames));
end

hFig = figure('Visible','off');

hSub = zeros(1, numel(fileNames));     	% Create temporary subplots as template
for i=1:length(hSub), 
    hSub(i) = subplot(size(fileNames,1), size(fileNames,2), i); 
end       

pos = get(hSub, 'Position');           	% Record their positions
delete(hSub)                           	% Delete them                           
                                        % From mat indexing to linear 
fileNames = reshape(fileNames', 1, numel(fileNames));
titleStr = reshape(titleStr', 1, numel(titleStr));
                                        % Load the .fig files inside the new figure
for i=1:length(hSub)
    
    if exist(fileNames{i}, 'file') == 2
        hFigFile = hgload( fileNames{i} );  % Load fig                                
    else
        hFigFile = figure;              % If file doesn't exist replace with 
        axes                            %  empty fig with axes for consistency
    end
                                        % Find the figure axes 
    allAx = findobj(hFigFile, 'Type', 'axes');
    ixFigAx = ~ismember(get(allAx,'Tag'), ...   % Find the axes of legend and 
                        {'legend','Colorbar'}); %  colorbar and remove it from ix.
    hAx = allAx(ixFigAx);
    
    set(hAx, 'Parent', hFig)                

    set(hAx, 'Position', pos{i});      	% Resize it to match subplot position
    xlabel(hAx,'');     ylabel(hAx,'') 	% Looks better without
    title(hAx, titleStr{i})
    
    delete(hFigFile)                    % Delete old fig
end

set(hFig,'Visible','on')

