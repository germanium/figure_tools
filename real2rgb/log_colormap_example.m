% Log colormap expample

[X Y Z] = peaks(50);
Z = abs(Z) * 100 + 1;
% Generate log-scale texture
T = real2rgb(log(Z), 'jet');
% Render the surface
surf(X, Y, Z, T);
set(gca,'Zscale','log','Clim',[min(Z(:)) max(Z(:))]);
% Generate the colorbar
colormap jet;
h=colorbar;
set(h,'YScale','log')