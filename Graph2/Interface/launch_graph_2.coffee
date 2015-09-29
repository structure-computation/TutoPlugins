
     
# Fonction de la vue SimpleTreeView ---------------------------------------------------------  
launch_graph_2_tree = ( main = document.body ) ->

    FileSystem._home_dir = "__graph2__"
    FileSystem._userid   = "644"

    fs = new FileSystem

    fs.load_or_make_dir FileSystem._home_dir, ( current_dir, err ) ->
        graph_file = current_dir.detect ( x ) -> x.name.get() == "graph_file"
        if not graph_file?
            graph_data = new GraphData 
                name : "Noeud 0"
            current_dir.add_file "graph_file", graph_data, model_type: "Config"
            graph_view = new SimpleTreeView document.body, graph_data   

        else
            graph_file.load ( graph_data, err ) =>
                graph_view = new SimpleTreeView document.body, graph_data   
      
      
# Fonction des vues GraphView et InputView ---------------------------------------------------  
launch_graph_2_input = ( main = document.body ) ->

    FileSystem._home_dir = "__graph2__"
    FileSystem._userid   = "644"
    
    # Séparation de la fenêtre en deux <div>
    div1 = new_dom_element
        nodeName : "div"                  
        parentNode: document.body      
        style :
            border: "3px solid #666"
            position: "fixed"
            top: "0px"
            left: "0px"
            bottom: "0px"
            right: "50%"
                
    div2 = new_dom_element
        nodeName : "div"                  
        parentNode: document.body      
        style :
            border: "3px solid #666"
            position: "fixed"
            top: "0px"
            left: "50%"
            bottom: "0px"
            right: "0px"    
 
    fs = new FileSystem

    fs.load_or_make_dir FileSystem._home_dir, ( current_dir, err ) ->
        graph_file = current_dir.detect ( x ) -> x.name.get() == "graph_file"
        if not graph_file?
            graph_data = new GraphData 
                name : "Noeud 0"
            current_dir.add_file "graph_file", graph_data, model_type: "Config"
            graph_view = new GraphView div1, graph_data   
            input_view = new InputView div2, graph_data
            
        else
            graph_file.load ( graph_data, err ) =>
                graph_view = new GraphView div1, graph_data                
                input_view = new InputView div2, graph_data

                