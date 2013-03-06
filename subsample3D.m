function subsample3D(hA, xFactor, yFactor)
% subsample3D(hA, xFactor, yFactor)
% hA      - Object handle of the desired 3D surface plot.
% xFactor, yFactor - Factor to use in the subsample, must be an integer.
%   
% Subsamples a 3D plot such as dispDist. Useful to reduce memory usage.


X = get(hA,'XData');
Y = get(hA,'YData');
Z = get(hA,'ZData');
C = get(hA,'CData');

Xs = X(1:yFactor:end, 1:xFactor:end);
Ys = Y(1:yFactor:end, 1:xFactor:end);
Zs = Z(1:yFactor:end, 1:xFactor:end);
Cs = C(1:yFactor:end, 1:xFactor:end);

set(hA,'XData', Xs)
set(hA,'YData', Ys)
set(hA,'ZData', Zs)
set(hA,'CData', Cs)

