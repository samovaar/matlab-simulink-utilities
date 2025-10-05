function add_icons(~)
    im = DAStudio.IconManager;
    
    root =  [matlabroot '/toolbox/shared/dastudio/resources/'];

    im.addFileToIcon('Studio:SaveModel', [root 'SLEditor/Save.svg']);
    im.addFileToIcon('Studio:Favorites', [root 'yellow_star.svg']);    
end