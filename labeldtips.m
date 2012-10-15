function output_txt = labeldtips(obj,event_obj)
% Display an observation's Y-xydata and label for a xydata tip
% obj          Currently not used (empty)
% event_obj    Handle to event object
% xydata       Entire xydata matrix
% labels       State names identifying matrix row
% xymean       Ratio of y to x mean (avg. for all obs.)
% output_txt   Datatip text (string or string cell array)
% This datacursor callback calculates a deviation from the
% expected value and displays it, Y, and a label taken
% from the cell array 'labels'; the xydata matrix is needed
% to determine the index of the x-value for looking up the
% label for that row. X values could be output, but are not.
% gP 6/20/2011

pos = get(event_obj,'Position');
x = pos(1); y = pos(2);

XData = get(findobj(gca,'Type','line'),'XData');
idx = find(XData == x,1);   % Find index to retrieve obs. name
% The find is reliable only if there are no duplicate x values
output_txt = {['X: ',num2str(x,4)],...
    ['Y: ',num2str(y,4)],...
    ['Index: ' ,num2str(idx)]};