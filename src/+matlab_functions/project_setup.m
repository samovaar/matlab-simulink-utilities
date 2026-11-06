function project = project_setup()
%PROJECT_SETUP creates project obj and creates simulink coder generation and cache directories
    
    disp([newline '*** STARTING PROJECT ***']);

    project = matlab.project.rootProject;    
  
    build_dir = fullfile(project.RootFolder, 'build');
    sim_cache = fullfile(build_dir, 'simulink_cache');

    if ~isfolder(build_dir)
        try
            mkdir(build_dir);           
            mkdir(sim_cache);

            project.SimulinkCacheFolder = sim_cache;
            project.SimulinkCodeGenFolder = build_dir;
        catch
            error('[-] Cannot create Simulink code generation folders. Check if paths are valid')
        end
    end   



    
    disp(['[+] Simulink CodeGen Dir: ' char(project.SimulinkCodeGenFolder)]);
    disp(['[+] Simulink Cache Dir: ' char(project.SimulinkCacheFolder)]);
    disp('[+] Project setup complete');


    % Refactor this
    local_variables = who;

    % Putting local variables to the workspace
    for i = 1 : length(local_variables)
        assignin('base', local_variables{i}, eval(local_variables{i}));
    end
    

    % Check if workspace is empty
    workspace_vars = evalin('base', 'who');

    if isempty(workspace_vars)
        error([newline '[-] Base workspace is empty. Project files not loaded']);       
    else
        disp(['[+] STARTUP: Base workspace contains ' num2str(length(workspace_vars)) ' variables']);
        disp(['[+] STARTUP: Project path: ', char(project.RootFolder)]);
        disp([newline '*** PROJECT FILES LOADED ***' newline]);
    end 
end

