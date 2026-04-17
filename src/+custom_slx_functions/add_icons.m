function add_icons(~)
    im = DAStudio.IconManager;
    
    root =  [matlabroot '/toolbox/shared/dastudio/resources/'];

    % Check if icons haven't been registered yet.
    if ~im.hasIcon('Studio:SaveModel')
        im.addFileToIcon('Studio:SaveModel', [root 'SLEditor/Save.svg']);
    end
    
    if ~im.hasIcon('Studio:Favorites')
        im.addFileToIcon('Studio:Favorites', [root 'FormatPainterCursor.png']);
    end
end