% Add this repo's folders to the MATLAB path
repo_root = fileparts(mfilename("fullpath"));
addpath(genpath(repo_root));

% Refresh Simulink to recognize the  customizations.
sl_refresh_customizations;


disp('[+] Simulink Customization repo setup complete.');
