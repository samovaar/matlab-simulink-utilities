function sl_customization(cm)
% SL_CUSTOMIZATION - Customize Simulink's behavior programmatically. 
%   Run 'sl_refresh_customizations' in MATLAB cmd line after editing this file
 
    custom_slx_functions.add_icons();

    % Use either 'Simulink:MenuBar' or 'Simulink"ToolsMenu'
    cm.addCustomMenuFcn('Simulink:MenuBar', @get_my_menu_items); % To be removed

    cm.addCustomMenuFcn('Simulink:ContextMenu', @get_my_context_menu_items);
end

%% Menu Bar 

% Define custom menu that holds containers
function schemaFcns = get_my_menu_items(~)
    schemaFcns = {@menu_container, ...
                  @actions_container};
end  


% Define context menu
function schemaFcns = get_my_context_menu_items(~)
     schemaFcns = {@get_save_model, ...
                   @get_quick_format};
end

%%

% Define containers
function schema = menu_container(~)
    schema = sl_container_schema;

    % Required propertiees
    schema.label = 'Menu';
    schema.childrenFcns = {@get_save_model};

    % Optional properties
    schema.autoDisableWhen = 'Busy';
    schema.state = 'Enabled';
end



function schema = actions_container(~)
    schema = sl_container_schema;
    schema.label = 'Actions';
    schema.childrenFcns = {@get_quick_format};
    schema.autoDisableWhen = 'Busy';
    schema.state = 'Enabled';
end


%%


% Define actions
function schema = get_save_model(~)
    schema = sl_action_schema;
    schema.label = 'Save Model';
    schema.callback = @custom_slx_functions.save_model_callback;
    schema.accelerator = 'Ctrl+S';
    schema.tag = 'Studio:SaveModel';
    schema.icon = schema.tag;
end


function schema = get_quick_format(~)
    schema = sl_action_schema;
    schema.label = "Quick Format";
    schema.callback = @custom_slx_functions.quick_format_callback;
    schema.accelerator = 'Alt+Shift+F';
    schema.tag = 'Studio:Favorites';
    schema.icon = schema.tag;
end


