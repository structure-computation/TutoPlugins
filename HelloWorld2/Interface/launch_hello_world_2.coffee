
#--------------------------------------------------------------------------------------------------------------------------------------------------------
#Fonction coffee sans séparation modèle/vue, sans synchronisation serveur    

launch_hello_world_1 = ( main = document.body ) ->
    
    #On crée une variable contenant le texte
    txt = "Hello World !"
    
    #On crée un bloc <div> affichant le texte à l'aide de la fonction new_dom_element de la librairie DomHelper (librairie Soja)
    div1 = new_dom_element
        parentNode : document.body
        nodeName  : "div"
        txt       : txt
        style      :
            textAlign  : "center"
            width : "200px"
                
    #On crée un autre bloc
    div2 = new_dom_element
        parentNode : div1
        nodeName  : "input"
        value     : txt
        txt       : txt
        style      :
            textAlign  : "center"
            width : "200px"
        
#--------------------------------------------------------------------------------------------------------------------------------------------------------



#--------------------------------------------------------------------------------------------------------------------------------------------------------
#Fonction coffee avec séparation modèle/vue, sans synchronisation serveur    

launch_hello_world_2 = ( main = document.body ) ->
   
    #On crée un modèle (donnée texte) à partir de la classe HelloWorldData (dans le dossier models)
    hello_world_data = new HelloWorldData
        txt         : "Hello world !"
            
    #On crée deux vues utilisant le modèle à partir des classes HelloWorldView et HelloWorldInputView (dans le dossier views)       
    hello_world_view = new HelloWorldView main, hello_world_data
    hello_world_input_view = new HelloWorldInputView main, hello_world_data

#--------------------------------------------------------------------------------------------------------------------------------------------------------
    
    
    
#--------------------------------------------------------------------------------------------------------------------------------------------------------  
#Fonction coffee avec séparation modèle/vue, avec synchronisation serveur 

launch_hello_world_3 = ( main = document.body ) ->
    
    
    #On crée un répertoire (côté client)
    FileSystem._home_dir = "__test__"
    FileSystem._userid   = "644" #A préciser pour pouvoir se connecter au serveur

    #On crée un Système de fichiers synchronisé automatiquement avec le serveur via FileSystem (librairie Soja)
    fs = new FileSystem

    #On se place dans le répertoire créé
    fs.load_or_make_dir FileSystem._home_dir, ( current_dir, err ) ->
        
        #On cherche le fichier nommé "hello_world_file" dans le répertoire (boucle dans la fonction detect)
        hello_world_file = current_dir.detect ( x ) -> x.name.get() == "hello_world_file"
        
        #Si pas de fichier "hello_world_file",
        if not hello_world_file?
            #On crée un modèle (donnée textuelle)
            hello_world_data = new HelloWorldData
                txt         : "Hello world !"
            #On crée le fichier "hello_world_file" dans le répertoire contenant le modèle        
            current_dir.add_file "hello_world_file", hello_world_data, model_type: "Config"
            #Et on ajoute les vues utilisant le modèle    
            hello_world_view = new HelloWorldView main, hello_world_data
            hello_world_input_view = new HelloWorldInputView main, hello_world_data
       
        #Si il y a le fichier "hello_world_file",
        else 
            #On le charge et on récupère le modèle
            hello_world_file.load ( hello_world_data, err ) =>
                #Et on ajoute les vues utilisant le modèle
                hello_world_view = new HelloWorldView main, hello_world_data
                hello_world_input_view = new HelloWorldInputView main, hello_world_data
                
#--------------------------------------------------------------------------------------------------------------------------------------------------------
    