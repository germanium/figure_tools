function text = getAnnotation(h)
% text = getAnnotation(h)
%
% h    - Figure handle. Default: current figure
% text ~ Annotation extracted from figure metadata
%
% Extracts annotation from figure's metadata
%
% Usage:
% text = getAnnotation(figureHandle)    % Returns metadata from figureHandle
% text = insertAnnotation('some text')  % Returns metadata from current figure
%
% gP 8/20/2013

if nargin < 1
    h = gcf;
end

text = get(h, 'UserData');