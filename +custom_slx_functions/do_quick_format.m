function do_quick_format(~)
    % Searching for inport, outport, and constant blocks in current Simulink/Simscape level
    % Depth 1 = current level only

    
    search_depth = Simulink.FindOptions('SearchDepth', 1);

    inportBlocks = Simulink.findBlocks(gcs, 'BlockType', 'Inport', search_depth);
    outportBlocks = Simulink.findBlocks(gcs, 'BlockType', 'Outport', search_depth);
    constantBlocks = Simulink.findBlocks(gcs, 'BlockType', 'Constant', search_depth);
    connectPorts = Simulink.findBlocks(gcs, 'BlockType', 'PMIOPort', search_depth);

    for i = 1 : length(inportBlocks)
        set_param(inportBlocks(i), 'BackgroundColor', 'Yellow');
    end

    for i = 1 : length(outportBlocks)
        set_param(outportBlocks(i), 'BackgroundColor', 'Magenta');
    end
    
    for i = 1 : length(constantBlocks)
        set_param(constantBlocks(i), 'BackgroundColor', 'Green');
    end

    for i = 1 : length(connectPorts)
        set_param(connectPorts(i), 'BackgroundColor', 'Orange');
    end


end

