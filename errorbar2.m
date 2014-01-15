function h = errorbar2(Y, E, varargin)
% h = errorbar2(Y, E, varargin)
% Y - Data should be as columns in array Y
% h - Returns handles arranged in the same order as the columns in Y
%
% Same as ERRORBAR but it interpolates the missing points (NaNs) in the input. 
% For now it only takes Y, E. Should accept X in the future.
%
% gP 5/15/2013

[Nr, Nc] = size(Y);
x = (1:Nr)';                
h = zeros(1, Nc);

hold all
for i=1:Nc
    
    ix = ~isnan(Y(:,i)) & ~isnan(E(:,i));
    
    if any(ix)                      % If all are nan it still plots a line
        h(i) = errorbar(x(ix), Y(ix,i), E(ix,i), varargin{:});
    else
        h(i) = errorbar(nan, nan, varargin{:});
    end
    
end

    
    
    
    