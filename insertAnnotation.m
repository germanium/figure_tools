function insertAnnotation(h, text)
% insertAnnotation(h, text)
%
% h    - Figure handle. Default: current figure
% text - Annotation to include in figure's metadata.
%
% Inserts annotation into figure's metadata. 
%
% Usage:
% insertAnnotation(figureHandle, 'some text')
% insertAnnotation('some text')   % Inserts into current figure
%
% gP 8/20/2013

if nargin < 2
    text = h;
    h = gcf;
end

set(h, 'UserData', text)