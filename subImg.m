function varargout = subImg(hIi)
% [Io,[BW]] = subImg(hIi)
% hIi - handle to the axes where the image is. 
% Io  + Output image where the selected region is un-altered and the rest are NaN
% BW  + Binary mask of the selected region. (Optional)
%
% gP 9/1/2011


BW = createMask(impoly(hIi));

Ii = getimage(hIi);
Io = NaN(size(Ii));                 

[ii jj] = find(BW);

for i=1:length(ii)
    Io(ii(i), jj(i)) = Ii(ii(i), jj(i));
end

if nargout == 1
    varargout(1) = {Io};
elseif nargout == 2
    varargout(1) = {Io};
    varargout(2) = {BW};
else
    disp('Too many output arguments')
    return  
end

