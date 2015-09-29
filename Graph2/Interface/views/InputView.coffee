
class InputView extends View
    constructor: ( @el, @model) ->
        super @model
                
    # Mise à jour de l'input quand le modèle est modifié 
    onchange: ->
        if @model.has_been_modified     
 
            # Bloc <input>  qui affiche le nom du noeud contenu dans current_node
            input = new_dom_element
                parentNode : @el                    
                nodeName  : "input"                 
                value     : @model.current_node[0].get() 
                txt       : @model.current_node[0].get()
                style     :
                    textAlign  : "center"
                    width : "100px"
                    position : "absolute"
                    left : "100px"
                    top : "100px"
                onchange  : =>
                    @model.current_node[0].set input.value  


        
        
        
        