function save_model_callback(~)
    model_handle = gcs;
    save_system(model_handle);
    disp('* Model saved')  
end