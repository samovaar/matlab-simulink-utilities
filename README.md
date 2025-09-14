# matlab-simulink-utilities
Repo contains useful utilities for MATLAB/Simulink environment.

# How to Use

* If you are using Git to manage your MATLAB project, add this repo as a submodule. 
* For Simulink functions, it is important to check box that says something similar to 'Refresh Simulink customizations after openning or closing this project' in your project settings.
* For MATLAB functions, call the function that you want to use. 


For example:

Let's say I want to setup my project the way it is defined in `+matlab_functions/project_setup.m`
then I will call `matlab_functions.project_setup;` in project startup file 

In Simulink, I like to format background colors of inport and outport blocks. Instead of manually formating 
each block, sl_customization will let me color all inport and outport blocks in current level with `Alt+Shift+F` 
