

# Modèle de base (noeud) pour faire des graphes/arbres
class GraphNode extends Model
    constructor: ( params = {}) ->
        super()

        @add_attr
            name : if params.name? then params.name else "Noeud"        # Nom du noeud
            children  : []                                              # Liste de noeuds enfants
        
    # Fonction qui ajoute un noeud enfant         
    add_child: ( child ) ->
        @children.push child
