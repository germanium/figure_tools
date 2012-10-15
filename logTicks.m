% STOP MAKING THE TICK POSITION A PERCENTAGE OF THE AXIS
function logTicks(h_axis,axis)
% logTicks(h_axis,axis)
% h_axis - Axis handle. To do it on all axis in the figure use findobj(gcf,'type','axes')
%   or findobj('-regexp','Tag','ax\d') if they are labeld ax#
% axis   - A sting containing the axis to convert to log scale. 'x', 'y', or 'xy'
%
% It converts the axis to log scale, but it has to be logarithmic already, meaning it just
%   adds 10^ to the tick label.
%
% gP 9/26/2011

for i=1:length(h_axis)
    
        tick2text(h_axis(i),'axis',axis,'xformat', @(x)sprintf('10^{%.2g}',x),...
            'yformat', @(y)sprintf('10^{%.2g}',y), 'ytickoffset', 0.12, ...
                     'xtickoffset', 0.13)
        
        hx = getappdata(h_axis(i), 'XTickText');
        set(hx,'FontSize',get(h_axis(i),'FontSize'));
        hy = getappdata(h_axis(i), 'YTickText');
        set(hy,'FontSize',get(h_axis(i),'FontSize'));

end






















% for i=1:length(h_axis)
%     if strcmp(axis,'x')  || strcmp(axis,'xy')   % Add 10^ to x axis
%         tempx = get(h_axis(i),'XTickLabel');
%         tickx = cell(1,size(tempx,1));
%         for j=1:size(tempx,1)
%             tickx{j} = ['10^{' strtrim(tempx(j,:)) '}'];
%         end
%     else
%         tickx = [];                             % Leave x axis unmodified
%     end
%     
%     
%     if strcmp(axis,'y')  || strcmp(axis,'xy')   % Add 10^ to y axis
%         tempy = get(h_axis(i),'YTickLabel');
%         ticky = cell(1,size(tempy,1));
%         for j=1:size(tempy,1)
%             ticky{j} = ['10^{' strtrim(tempy(j,:)) '}'];
%         end
%     else
%         ticky = [];                             % Leave y axis unmodified
%     end
%     
%     format_ticks(h_axis(i),tickx,ticky);
% end