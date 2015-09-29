  
    
# Fonction coffee avec séparation modèle/vue, avec synchronisation serveur 
launch_hello_world_3 = ( main = document.body ) ->
    
    FileSystem._home_dir = "__helloworld3__"
    FileSystem._userid   = "644"        
    
    fs = new FileSystem

    fs.load_or_make_dir FileSystem._home_dir, ( current_dir, err ) ->
        
        hello_world_file = current_dir.detect ( x ) -> x.name.get() == "hello_world_file"
        
        if not hello_world_file?
            hello_world_data = new HelloWorldData
                txt         : "Hello world !"
            current_dir.add_file "hello_world_file", hello_world_data, model_type: "Config"
            hello_world_view = new HelloWorldView main, hello_world_data
            hello_world_input_view = new HelloWorldInputView main, hello_world_data
       
        else 
            hello_world_file.load ( hello_world_data, err ) =>
                hello_world_view = new HelloWorldView main, hello_world_data
                hello_world_input_view = new HelloWorldInputView main, hello_world_data
                
    