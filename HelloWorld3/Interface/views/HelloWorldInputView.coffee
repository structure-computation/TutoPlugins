
# Nouvel objet qui hérite de la classe View
class HelloWorldInputView extends View
    constructor: ( @el, @model ) ->
        super @model
        
        # Bloc <input>
        @input = new_dom_element
            parentNode : @el                    
            nodeName  : "input"                 
            value     : @model.txt.get()        
            txt       : @model.txt.get()
            style     :
                textAlign  : "center"
                width : "200px"
            onchange  : =>
                @model.txt.set @input.value     
    
    onchange: ->
        if @model.has_been_modified     
            @input.value = @model.txt.get()
              
        
        
        

                
    
    
    