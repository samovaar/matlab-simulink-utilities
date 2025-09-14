# General

In MATLAB, the `sl_customization` function is a powerful tool for customizing Simulink's behavior beyond just adding custom menus. 
It allows you to modify various aspects of the Simulink environment programmatically. For example, you can add custom command that 
formats simulink blocks like inports and outports.
 

Here are some of the key things you can do with sl_customization:
<details>


1.  **Customize the Simulink Toolstrip (Menu & Toolbar)**

    * Add custom menus, buttons, or toolstrip tabs.
    * Modify existing menus or toolstrip tabs.
    * Define callbacks for your custom UI elements.

2.  **Custom Block Library Browser**

    * Add or modify libraries in the Simulink Library Browser.
    * Organize custom blocks into custom categories.

3.  **Context Menu Customizations**

    * Add or modify context (right-click) menus for blocks, signals, or other Simulink elements.
    * Define dynamic context menus that change based on selection.

4.  **Model and Block Callbacks**

    * Define custom pre-load, post-save, or close callbacks for models.
    * Add custom block callbacks (e.g., when a block is opened, copied, or deleted).

5.  **Custom Block Properties & Dialogs**

    * Modify the block parameters dialog (e.g., add custom tabs or controls).
    * Define custom block properties (similar to `get_param`/`set_param` but more structured).

6.  **Custom Code Generation (ERT/GRT Targets)**

    * Modify code generation settings for Embedded Coder.
    * Define custom storage classes for data objects.

7.  **Custom Data Types & Code Replacement**

    * Register custom data types for use in Simulink.
    * Define code replacement libraries for optimized code generation.

8.  **Custom Constraints & Checks (Model Advisor)**
    
    * Add custom checks to the Model Advisor for enforcing modeling standards.
    * Define custom guidelines for model validation.

9.  **Simulation & Debugging Hooks**

    * Add custom behavior before/after simulation starts/stops.
    * Modify breakpoint or debugging behavior.

10. **Custom Block Icons & Appearance**

    * Define dynamic block icons (e.g., showing state information).
    * Modify block port labels dynamically.


</details>


# Customize the Simulink Toolstrip (Menu & Toolbar)

#### addCustomMenuFcn 
`addCustomMenuFcn` is a method of the Simulink customization manager (cm) that allows yout to inject
custom menu items into various parts of the Simulink interface.

**Basic Syntax:** `cm.addCustomMenuFcn(menu_location, callback_function)`

* `cm`: Cumstomization manager object passed to `sl_customization.m`
* `menu_location`: String specifying where to add the menu
* `callback_function`: Function handle that defines the menu structure

**Primary Locations:**

1. `Simulink:MenuBar' - Main menu bar
* Requires returning a single `sl_container_schema`
* Example: Adding "Actions" next to "Menu" 

Add example1.png

2. `Simulink:ToolsMenu` - Under the "Tools" menu
* Can return multiple items directly
* Example: Adding 'Help' under Tools


#### Schema Functions
These schema functions are the building blocks for Simulink menu customization, 
allowing you to create both hierarchical menu structures (`sl_container_schema`) 
and executable actions (`sl_action_schema`).

| Feature          | `sl_container_schema`               | `sl_action_schema`                 |
|------------------|-------------------------------------|------------------------------------|
| **Purpose**      | Menu container (holds children)     | Executable action                  |
| **Children**     | Yes (via `childrenFcns`)            | No                                 |
| **Callback**     | No direct action                    | Yes (`callback` property)          |
| **Visual Role**  | Organizes menu structure            | Performs concrete operations       |
| **Return Type**  | Returns container object            | Returns action object              |

**Core properties of a container***
```matlab
function schema = myContainer(callbackInfo)
    schema = sl_container_schema;
    
    % Required properties
    schema.label = 'My Menu';               % Display text
    schema.childrenFcns = {@item1, @item2}; % Child items (actions/submenus)
    
    % Optional properties
    schema.tag = 'MyMenuContainer';       % Unique identifier for programmatic access
    schema.state = 'Enabled';             % Controls menu availability: Enabled/Disabled/Hidden
    schema.autoDisableWhen = 'Busy';      % accepts: 'Busy': during sim/code gen, 'Locked': for locked libs, 'Never': always enabled
    schema.statustip = 'My menu tooltip'; % Help text shown in status bar
    schema.userdata = struct();           % Custom data storage
end
```



**Core properties of an action**

```matlab
function schema = myAction(callbackInfo)
    schema = sl_action_schema;
    
    % Required properties
    schema.label = 'Run Analysis';             % Display text
    schema.callback = @analysisCallback;       % Function handle
    
    % Optional properties
    schema.icon = 'analysis_icon.png';         % Custom icon
    schema.accelerator = 'Ctrl+Shift+A';       % Keyboard shortcut
    schema.tag = 'MyAnalysisAction';           % Unique identifier for programmatic access
    schema.userdata = struct('param',42);      % Custom data
    schema.statustip = 'Runs custom analysis'; % Tooltip
end
```
