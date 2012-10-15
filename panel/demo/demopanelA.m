
%% Panel builds image files, not just on-screen figures.

% (a) Use demopanel1 to create a layout.
% (b) Export the result to file.



%% (a)

% delegate
demopanel1



%% (b)

% do a default export
p.export('export_default');

% export() has plenty of options - see help panel/export or
% doc panel for more info. let's do a publication-quality
% export of the same figure
p.export('export_publication', '-rp/2')




