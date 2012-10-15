function insertOffset(x,y)
% insertOffset(x,y)
% x - x offset in the current units
% y - y offset in the current units
%
% Have to have the desired object selected on the plot
%
% gP 9/17/2012

X = get(gco, 'XData');
Y = get(gco, 'YData');

set(gco, 'XData', X + x);
set(gco, 'YData', Y + y);