


class GraphNode extends Model
    constructor: ( params = {}) ->
        super()

        @add_attr
            name : if params.name? then params.name else "Noeud"
            children  : []
        
            
    add_child: ( child ) ->
        @children.push child
