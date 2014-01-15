function P = hist2D(X, bins, normFlag, w)
% P = hist2D(X, bins, normFlag)
% X         - Data, each colum corresponds to one dimension. The dimensionality
%             of the data d is given by the number of columns
% bins      - 1xd cell array where each cell contains a vector with the bin 
%             centers. If not inputed uses the data range
% normFlag  - If true normalize distribution. Default false. 
% w         - Weights for the probability calculated from trajWeight(). If empty
%             it doesn't use weights. Default: emtpy
%
% P         ~ Array with the count/pdf of data X
%
% Plot if there is no output argument 
%
% X = randn(2500,1);
% Y = randn(2500,1)*2;
% source http://stackoverflow.com/questions/6777609/fast-2dimensional-histograming-in-matlab

d = size(X,2);                  % Dimensions of the input data
                            
if nargin < 2 || isempty(bins)  % Calculate bins automatically 
    bins = cell(1, d);      
    
    for i=1:d                   % Bin centers (integers)
        bins{i} = floor(min(X(:,i))):1:ceil(max(X(:,i)));
    end
end

if nargin < 3 || isempty(normFlag)
    normFlag = false;
end

if nargin < 4 || isempty(w)
    w = [];
end

numBins = cellfun(@length, bins);

                                % Map X/Y values to bin indices
% Xi = round( interp1(xbins, 1:xNumBins, X, 'linear', 'extrap') );
% Better for the case where the dist has an edge on the left

Xi = zeros(size(X,1), d);
for i=1:d                                
    Xi(:,i) = floor( interp1(bins{i}, 1:numBins(i), X(:,i), 'linear', 'extrap') ); 
                                % Limit indices to the range [1,numBins]
    Xi(:,i) = max( min(Xi(:,i), numBins(i)), 1);
    
end
                                % Count number of elements in each bin
if isempty(w)                   % Not weighed
    P = accumarray(fliplr(Xi), 1, fliplr(numBins));
else                            % Weighed
    P = accumarray(fliplr(Xi), w(:), fliplr(numBins));
end

if normFlag
    P = P./sum(P(:));
end

if nargout >= 1                 % If there is output argument don't plot anything
    return
end
    
if d == 2                       % Plot 2D histogram
    imagesc(bins{1}, bins{2}, P)        
    axis on xy
                                % Plot 3D volume
elseif d == 3
    patch(isosurface(bins{1}, bins{2}, bins{3}, P, 0.002))
end

