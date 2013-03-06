
%%
FILES = uipickfiles;                    % Folders
fname = 'P(dt,r^2)_pooled';

for i=1:length(FILES)
    
    cd(FILES{i})
    hF = hgload('P(dt,r^2)_pooled');
    
    hA = findall(hF,'type','axes');     % List of axes 
    xtick =[1 10];                      % Log ticks
    ytick = [1e-5 1e-3 1e-1 1e1 1e3];
    
    for j=1:length(hA)
        set(hA(j),'xtick',xtick); set(gca,'xticklabelMode','auto');
        set(hA(j),'ytick',ytick); set(gca,'yticklabelMode','auto');
        set(hA(j), 'TickLength', [0.03;0.04])
    end
    
    [~,name] = fileparts(FILES{i});
    annotation('textbox', [0.47 0.9 0.22 0.09], 'String',name,...
        'interpreter','none','linestyle','none','FontSize',16)
    
    saveas(hF,fname,'png')
    saveas(hF,fname,'fig')
    close(hF)
end