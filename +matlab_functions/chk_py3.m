function [is_python_process_running, python_processes_count] = chk_py3(~)
%CHK_PY3 identifies Python3 processes that lock matlab files
%
% Simulink coder generates micromouse_ert_rtw folder. Python locks this
% folder and all its content. If lock is not released, cleanup.m will fail.
%
% Syntax:
%   [output1, output2] = check_python3_processes()
%
% Outputs:
%   output1 - It is logical 1 (true), if there is at least 1 python3.exe process running
%   output2 - The number of python3.exe processes that are
%             currently running.

    
    python_processes_count = 0; 

    [cmd_status, cmd_output] = system('tasklist /FI "IMAGENAME eq python3.exe');

    if cmd_status ~= 0
        error(['[-] PYTHON LOCK CHECK: Failed to check Python processes: %s', cmd_output]);
    end
    

    is_python_process_running = contains(cmd_output, 'python3.exe');
    
    if is_python_process_running
        python_processes_count = count_python_processes(cmd_output);
        disp(['[ ] PYTHON LOCK CHECK: Python process(es) detected: ' python_processes_count]);
    else
        disp('[+] PYTHON LOCK CHECK: Python process(es) NOT detected');
    end     
end
     
% Helper function

function count = count_python_processes(input)
% COUNT_PYTHON_PROCESSES returns the number of running python3.exe processes 
    
    lines = splitlines(strtrim(input));
    count = numel(lines) - 2;
    count = max(0, count);
    

end