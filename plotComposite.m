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

h = zeros(1,numel(fileNames));          % Create temporary subplots as template
for i=1:length(h), 
    h(i) = subplot(size(fileNames,1),size(fileNames,2),i); 
end       

pos = get(h, 'Position');               % Record their positions
delete(h)                               % Delete them                           
                                        % From mat indexing to linear 
fileNames = reshape(fileNames',1,numel(fileNames));
titleStr = reshape(titleStr',1,numel(titleStr));
                                        % Load the .fig files inside the new figure
for i=1:length(h)
    
    hFigFile = hgload( fileNames{i} );  % Load fig
                                        % Move/copy axis from old fig to new fig
%     hAx = get(hFigFile, 'Child');     % These get legend handles too
%     hAx = findall(hFigFile,'type','axes')    
    hAx = gca;
    set(hAx, 'Parent',hFig)

    set(hAx, 'Position',pos{i});        % Resize it to match subplot position
    xlabel(hAx,''); ylabel(hAx,'')      % Looks better without
    title(hAx, titleStr{i})
    
    delete(hFigFile)                    % Delete old fig
end

set(hFig,'Visible','on')