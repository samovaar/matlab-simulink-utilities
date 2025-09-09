function sl_customization(cm)
% SL_CUSTOMIZATION - Customize Simulink's behavior programmatically. 
%   Run 'sl_refresh_customizations' in MATLAB cmd line after editing this file
 

    

    % Register custom menu to the main menu bar  cm - customization manager obj
    % Use either 'Simulink:MenuBar' or 'Simulink"ToolsMenu'
    cm.addCustomMenuFcn('Simulink:MenuBar', @my_custom_menu);
end


% Define custom menu that holds containers
function schemaFcns = my_custom_menu(~)
    schemaFcns = {@menu_container_1, ...
                  @menu_container_2};
end  


% Define menu container 1. Work in progress, disabled for now
function schema = menu_container_1(~)
    schema = sl_container_schema;

    % Required propertiees
    schema.label = 'Menu';
    schema.childrenFcns = {@help};

    % Optional properties
    schema.state = 'Disabled';
end




% Define menu container 2
function schema = menu_container_2(~)
    schema = sl_container_schema;
    
    schema.label = 'Actions';
    schema.childrenFcns = {@quick_format};

    schema.autoDisableWhen = 'Busy';
    
    
end




% Define action that menu container 1 is calling
function schema = help(~)
    schema = sl_action_schema;

    schema.label = 'Help';
    schema.callback = @get_help;
end





% Define action that menu container 2 is calling
function schema = quick_format(~)
    
    schema = sl_action_schema;

    schema.label = 'Quick Format';
    schema.callback = @custom_slx_functions.do_quick_format;

    schema.accelerator = 'Alt+Shift+F';
    schema.statustip = 'Formats colors of all ports and constant blocks in current subsystem';

end






