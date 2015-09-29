

# Modèle de graphe/arbre
class GraphData extends GraphNode
    constructor: ( params = {}) ->
        super()
            
        @name.set( if params.name? then params.name else "Noeud")       # Nom du noeud racine
        
        @add_attr                                                       # Liste du noeud actif (noeud racine par défaut)
            current_node : [this.name]
        
        # Ajout de noeuds
        node_11 = new GraphNode 
            name : "Noeud 11"
        node_12 = new GraphNode 
            name : "Noeud 12"
        node_13 = new GraphNode 
            name : "Noeud 13"
        node_21 = new GraphNode 
            name : "Noeud 21"
        node_22 = new GraphNode 
            name : "Noeud 22"
        node_23 = new GraphNode 
            name : "Noeud 23"                
        node_24 = new GraphNode 
            name : "Noeud 24"        
        node_31 = new GraphNode 
            name : "Noeud 31"
        node_32 = new GraphNode 
            name : "Noeud 32"                
        node_33 = new GraphNode 
            name : "Noeud 33"                
                
        # Ajout des liens de parenté entre les noeuds        
        @add_child node_11
        @add_child node_12
        @add_child node_13
        node_11.add_child node_21
        node_11.add_child node_22
        node_11.add_child node_23
        node_13.add_child node_24
        node_22.add_child node_31
        node_23.add_child node_32
        node_23.add_child node_33


    
    

           
               
    