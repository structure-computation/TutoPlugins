# Copyright 2012 Structure Computation  www.structure-computation.com
# Copyright 2015 Jérémie Bellec


#
class HelloWorldData extends Model
    constructor: ( params = {}) ->
        super()
            
        @add_attr
            # tree
            txt : if params.txt? then params.txt else "Hello world !"
            lst : new Lst
            val : if params.val? then params.val else 10
                 
        @lst.push 3
        @lst.push 4
            
