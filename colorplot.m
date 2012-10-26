function color = colorplot(X, Y, Z, begFLAG)
% color = colorplot(X, Y, Z, begFLAG)
% X,Y,Z   - Colum or row vectors 
% begFLAG - Flag indicating if the beggining should be marked. Default false
%
% color ~ Color vector, of size [length(X) x 3]
%
% gP 2010

if nargin <4
    begFLAG = 0;
end

Np = length(X);
color = jet(Np);

if nargin == 1                              % only y data
    
    for i=1:(Np-1)
        line([i,i+1],[X(i),X(i+1)],'Color', color(i,:));
    end

elseif nargin == 2                          % x,y data
    
    if begFLAG
        plot(X(1), Y(1), 'Marker', 'p', ...     % Mark beggining with a star
            'MarkerSize', 12, 'MarkerFaceColor', 'b')
    end
    for i=1:(Np-1)
        line([X(i),X(i+1)], [Y(i),Y(i+1)],'Color', color(i,:));
    end
    
elseif nargin == 3                          % x,y,z data
    
    if begFLAG
        plot3(X(1), Y(1), Z(1), 'Marker', 'p', ...     % Mark beggining with a star
            'MarkerSize', 12, 'MarkerFaceColor', 'b')
    end
    for i=1:(Np-1)
        line([X(i),X(i+1)], [Y(i),Y(i+1)], [Z(i),Z(i+1)],'Color', color(i,:));
    end
    
end

% colormap(color)
% colorbar