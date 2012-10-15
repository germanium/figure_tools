function scale_subplots(factorW, factorH, h) 
% scale_subplots(factorW, factorH, h) 
% factorW - Width scale factor
% factorH - Heigth scale factor
% h       - Figure handle
% Scales each axes object in the current figure by 'factor' 
% Useful for trimming the white space created by 
% subplot with a large number of sub axes 
% 
% Operates on the current figure - easily modifed for 
% arbitrary figures 
% 
% Loop through each axis on a figure, and scale it by factor 'f' 
% Get handles to all axes in the figure 

H_axes = findobj(h,'type','axes'); 
for i=1:length(H_axes); 
  H=H_axes(i); 
  % Get the position and size of the axes 
  pos = get(H,'position'); 
  x=pos(1);y=pos(2); 
  w=pos(3);h=pos(4); 
  % Compute the centre of the axes 
  cx=x+w/2; 
  cy=y+h/2; 
  % scale the width and height 
  w=w*factorW; 
  h=h*factorH; 
  % Compute the new x and y positions for the scaled axes 
  x=cx-w/2; 
  y=cy-h/2; 
  % And update the axes information to 
  % effect the change 
  pos=[x y w h]; 
  set(H,'position',pos); 
end 
