
# Nouvel objet qui hérite de la classe View
class HelloWorldView extends View
    constructor: ( @el, @model ) ->
        super @model
        
        # bloc <div>
        @txt = new_dom_element
            parentNode : @el                    # Bloc parent (ici, un paramètre de la vue)
            nodeName  : "div"                   # Type de bloc
            txt       : @model.txt.get()        # On assigne l'attribut nommé 'txt' du modèle paramètre
            style      :                        # Personnalisation graphique
                textAlign  : "center"
                width : "200px"
                  
    onchange: ->
        if @model.has_been_modified             # Fonction de Model qui renvoie true quand le modèle est modifié
            @txt.innerHTML = @model.txt.get()   # On réassigne l'attribut nommé 'txt' du modèle paramètre
        
              
        
        
        

                
    
    
    