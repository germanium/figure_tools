
%% 2D colorbar 

c = linspace(0,1,512);              % Color range
[R, B] = meshgrid(c);
RGB = zeros(512,512,3);
RGB(:,:,1) = R;
RGB(:,:,2) = zeros(512);
RGB(:,:,3) = B;


figure, image(RGB)
