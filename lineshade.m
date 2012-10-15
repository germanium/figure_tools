function [shadeH plotH] = lineshade(x,y,ci,alpha,acolor)
% lineshade(x,y,ci,alpha,acolor)
% x      - x variable must be row vector
% y      - y variable must be row vector
% ci     - shade range, must be a 2xN matrix, where the first row defines the
%          top shading range and the second the lower.
% alpha  - Defines transparency of the shading (default is no shading and black 
%          mean line)
% acolor - Defines the used color (default is red)


if exist('acolor','var')==0 || isempty(acolor)
    acolor='r';
end

if exist('alpha','var')==0 || isempty(alpha)
    shadeH = fill([x fliplr(x)],[ci(1,:) fliplr(ci(2,:))],acolor,'linestyle','none');
    acolor='k';
else
    shadeH = fill([x fliplr(x)],[ci(1,:) fliplr(ci(2,:))],acolor, 'FaceAlpha', ...
        alpha,'linestyle','none');
end

if ishold==0
    check=true;
else
    check=false;
end

hold on;                                % change color or linewidth to adjust mean line
plotH = plot(x,y,'Color',acolor,'linewidth',1.5);

if check
    hold off;
end

end



