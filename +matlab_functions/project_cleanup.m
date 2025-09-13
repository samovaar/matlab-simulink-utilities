function project_cleanup(full_clean)

   
    [python_detected, python_processes_count] = matlab_functions.chk_py3();

    if python_detected && full_clean
        [status, ~] = system('taskkill /f /im python3.exe');
        
     % if status is non-zero integer, the command failed
         if status
             error('[-] Unable to terminate python processes');
         else
            disp(['[+] PYTHON LOCK CHECK: Terminated python processes: ' num2str(python_processes_count)]); 
         end 
    end

end