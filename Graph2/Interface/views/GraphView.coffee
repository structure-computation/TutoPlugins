
class GraphView extends View
    constructor: ( @el, @model) ->
        super @model
    
    # Mise à jour du graphe quand le modèle est modifié -------------------------------------------------
    onchange: ->
        if @model.has_been_modified     
                        
            @pos_z = 1                                  # Initialisation
            @blocks = []                                # Initialisation liste des blocs (pour la suppression des blocs)
                        
            for block in @blocks
                @el.removeChild block                   # Suppression des blocs existants           
      
            @blocks_graph @model, 0                     # Création des nouveaux blocs
    
    
    # Création des blocks <div> correspondant aux noeuds du modèle -------------------------------------
    blocks_graph: (m, d) ->
    
        @add_block m.name, d                            # Ajout d'un bloc
        depth = d                                       # Profondeur du noeud
        @pos_z += 1                                     # Incrémentation de la position verticale du bloc
        
        if m.children.length != 0                       
            for child in m.children                     # Parcours de tous les noeuds enfants
                @blocks_graph child, depth+1            # Récursivité de la fonction


    # Création d'un bloc <div> associé à un noeud du modèle --------------------------------------------
    add_block: (name, d) ->

        pos_x = (d+1) * 40                              # Position horizontale du bloc (en fonction de la profondeur du noeud)
        pos_z = @pos_z * 20                             # Position verticale du bloc

        block = new_dom_element
            parentNode : @el                    
            nodeName  : "div"                 
            value     : name.get()        
            txt       : name.get()
            style     :
                background: if name in @model.current_node then "#1E90FF" else "#404040"        # En fonction du noeud actif (dans current_node)       
                color: "white"                 
                borderRadius: "5px"    
                paddingTop: "2.5px"           
                paddingBottom: "2.5px"      
                textAlign  : "center"
                width : "100px"
                position : "absolute"
                left : "#{pos_x}px"
                top : "#{pos_z}px"
            onchange  : =>
                name.set block.value    
            onclick : =>
                @model.current_node.pop()               # Suppression du noeud actif actuel
                @model.current_node.push name           # Le noeud du bloc devient le noeud actif sur un clic
        
        @blocks.push block                              # On ajoute le bloc à la liste


 
        


        
        
        
        