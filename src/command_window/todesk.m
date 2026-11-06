function todesk
%TODESK Change current folder to the user's Desktop (windows only).


    home = getenv('USERPROFILE');
    desktop_dir = fullfile(home, 'Desktop');
    
    if isfolder(desktop_dir)
        cd(desktop_dir);
        return;
    end

    warning('Desktop folder not found.');

end