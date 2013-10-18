function makeVisible(fileName)
% makeVisible(fileName)
% Changes the visible parameter on a saved .fig file, thus make a fig file 
% saved invisible open as visible.
% Call makevisible('figure.fig'). Note that the .fig extension is necessary. 
%
% Tor Inge Birkenes 2012

f = load(fileName,'-mat');
n = fieldnames(f);

f.(n{1}).properties.Visible = 'on';

save(fileName,'-struct','f')