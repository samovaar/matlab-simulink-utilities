function add_path(~)
%ADD_PATH add src contents to the matlab path and save in pathdef.m

dir_path = fileparts(mfilename("fullpath"));

addpath(genpath(dir_path));
savepath;
end