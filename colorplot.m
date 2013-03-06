function cMap = colorplot(Ti, begFLAG)
% cMap = colorplot(Ti, [begFLAG])
% T       - Sigle trajectory. It could be a 1D, 2D or 3D column vector
% begFLAG - Flag indicating if the beggining should be marked. Default false
%
% cMap ~ Color vector, of size [size(Ti,1), 3]
%
% gP 2010

if nargin <2
    begFLAG = 0;
end

Np = size(Ti,1);
color = jet(Np);

if size(Ti,2) == 1                          % only y data
    
    for i=1:(Np-1)
        line([i,i+1],[Ti(i),Ti(i+1)],'Color', color(i,:));
    end

elseif size(Ti,2) == 2                      % x,y data
    
    if begFLAG                              % Mark beggining with a star
        plot(Ti(1,1), Ti(1,2), 'Marker', 'p', ...     
            'MarkerSize', 12, 'MarkerFaceColor', 'b')
    end
    for i=1:(Np-1)
        line([Ti(i,1),Ti(i+1,1)], [Ti(i,2),Ti(i+1,2)],'Color', color(i,:));
    end
    
elseif size(Ti,2) == 3                      % x,y,z data
    
    if begFLAG
        plot3(Ti(1,1), Ti(1,2), Ti(1,3), 'Marker', 'p', ...     
            'MarkerSize', 12, 'MarkerFaceColor', 'b')
    end
    for i=1:(Np-1)
        line([Ti(i,1), Ti(i+1,1)], [Ti(i,2), Ti(i+1,2)], [Ti(i,3), Ti(i+1,3)],...
            'Color', color(i,:));
    end
    
end

if nargout > 0
    cMap = color;
end

% colormap(color)
% colorbar
