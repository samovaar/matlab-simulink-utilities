% Add this repo's folders to the MATLAB path
customization_repo_root = fileparts(mfilename("fullpath"));
addpath(genpath(customization_repo_root));

% Refresh Simulink to recognize the  customizations.
sl_refresh_customizations;


disp([newline '[+] Simulink Customization setup complete.']);
