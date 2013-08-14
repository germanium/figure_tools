function output_txt = datacursorLabel(~,event_obj)
% output_txt = datacursorLabel(~,event_obj)
% obj       - Currently not used (empty)
% event_obj - Handle to event object
%
% Display the position and array index (time) of data cursor.
% Index is only reliable if there are no duplicate x values and is a line  
% object.
% To set update function to this use:
% hdt = datacursormode;
% set(hdt,'UpdateFcn',@datacursorLabel);
%
% gP 6/20/2011

pos = get(event_obj,'Position');
x = pos(1); y = pos(2);

XData = get(findobj(gca,'Type','line'),'XData');
idx = find(XData == x,1);   % Find index to retrieve obs. name
% The find is reliable only if there are no duplicate x values
output_txt = {['X: ', num2str(x,4)],...
              ['Y: ', num2str(y,4)],...
              ['Index: ' ,num2str(idx)]};