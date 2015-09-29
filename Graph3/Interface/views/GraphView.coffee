
class GraphView extends View
    constructor: ( @el, @model) ->
        super @model
    

    onchange: ->
        if @model.has_been_modified     
                        
            @pos_z = 1                  
            @blocks = []                
                        
            for block in @blocks
                @el.removeChild block                  
      
            @blocks_graph @model, 0     
        
    
    blocks_graph: (m, d) ->
    
        @add_block m.name, d
        depth = d
        @pos_z += 1
        
        if m.children.length != 0
            for child in m.children
                @blocks_graph child, depth+1


    add_block: (name, d) ->

        pos_x = (d+1) * 40
        pos_z = @pos_z * 20

        block = new_dom_element
            parentNode : @el                    
            nodeName  : "div"                 
            value     : name.get()        
            txt       : name.get()
            style     :
                background: if name in @model.current_node then "#1E90FF" else "#404040"        
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
                @model.current_node.pop()
                @model.current_node.push name
        
        @blocks.push block


 
        


        
        
        
        