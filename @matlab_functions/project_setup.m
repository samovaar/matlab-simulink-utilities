function project = project_setup()
%PROJECT_SETUP creates project obj and creates simulink coder generation and cache directories

    project = matlab.project.rootProject;    
  
    build_dir = fullfile(project.RootFolder, 'build');
    sim_cache = fullfile(build_dir, 'simulink_cache');

    if ~isfolder(build_dir)
        try
            mkdir(build_dir);           
            mkdir(sim_cache);
        catch
            error('[-] Cannot create Simulink code generation folders. Check if paths are valid')
        end
    end   

    project.SimulinkCacheFolder = sim_cache;
    project.SimulinkCodeGenFolder = build_dir;

    disp('[+] Project setup complete');
end

