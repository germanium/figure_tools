function H = hist2D(X, Y, xbins, ybins, normFlag)
% hist2D(X, Y, xbins, ybins)
% X         - x data, can be colum or row vector
% Y         - Y data.
% x/ybins   - x bin centers. If not inputed uses the data range 
% normFlag  - If true normalize distribution. Default false. 

% X = randn(2500,1);
% Y = randn(2500,1)*2;
% source http://stackoverflow.com/questions/6777609/fast-2dimensional-histograming-in-matlab

                                % Bin centers (integers)
if nargin < 3
    xbins = floor(min(X)):1:ceil(max(X));
    ybins = floor(min(Y)):1:ceil(max(Y));
end

if nargin < 4
    normFlag = false;
end

xNumBins = numel(xbins);
yNumBins = numel(ybins);

                                % Map X/Y values to bin indices
% Xi = round( interp1(xbins, 1:xNumBins, X, 'linear', 'extrap') );
% Yi = round( interp1(ybins, 1:yNumBins, Y, 'linear', 'extrap') );
                                % Better for the case where the dist has an
                                % edge on the left
Xi = floor( interp1(xbins, 1:xNumBins, X, 'linear', 'extrap') ); 
Yi = floor( interp1(ybins, 1:yNumBins, Y, 'linear', 'extrap') );

                                % Limit indices to the range [1,numBins]
Xi = max( min(Xi,xNumBins), 1);
Yi = max( min(Yi,yNumBins), 1);

                                % Count number of elements in each bin
H = accumarray([Yi(:) Xi(:)], 1, [yNumBins xNumBins]);
                                
if normFlag
    H = H./sum(H(:));
end

imagesc(xbins, ybins, H)        % Plot 2D histogram
axis on; axis xy
