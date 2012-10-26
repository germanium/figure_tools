% Have figure opened already
%% x-axis tick marks
                                    % Minor tick marks
xg = [10^-1:10^-1:10^0 10^0:10^0:10^1 10^1:10^1:10^2 10^2:10^2:10^3 ...
    10^3:10^3:10^4 10^4:10^4:10^5 10^5:10^5:10^6];                        
yg = [10^-5 1.4*10^-5];             % Y-position and height of minor grids

xx = reshape([xg; xg; NaN(1,length(xg))],1,length(xg)*3);
yy = repmat([yg NaN],1,length(xg));
hold on
plot3(xx,yy,ones(1,length(yy)), 'Color',[.8 .8 .8], 'LineWidth', 1);

                                    % Mayor tick marks 
xg = xg(1:10:end);                        
yg = [10^-5 1.6*10^-5];             

xx = reshape([xg; xg; NaN(1,length(xg))],1,length(xg)*3);
yy = repmat([yg NaN],1,length(xg));
hold on
plot3(xx,yy,ones(1,length(yy)), 'Color',[.8 .8 .8], 'LineWidth', 1);

%% y-axis
                                    % Minor tick marks
xg = [10^-1 1.3*10^-1];
yg = [10^-5:10^-5:10^-4  10^-4:10^-4:10^-3  10^-3:10^-3:10^-2  10^-2:10^-2:10^-1 ...
    10^-1:10^-1:10^0  10^0:10^0:10^1  10^1:10^1:10^2 ];

xx = repmat([xg NaN],1,length(yg));
yy = reshape([yg; yg; NaN(1,length(yg))],1,length(yg)*3);
hold on
plot3(xx,yy,ones(1,length(yy)), 'Color',[.8 .8 .8], 'LineWidth', 1);

                                    % Mayor tick marks
xg = [10^-1 1.4*10^-1];
yg = yg(1:10:end);

xx = repmat([xg NaN],1,length(yg));
yy = reshape([yg; yg; NaN(1,length(yg))],1,length(yg)*3);
hold on
plot3(xx,yy,ones(1,length(yy)), 'Color',[.8 .8 .8], 'LineWidth', 1);
