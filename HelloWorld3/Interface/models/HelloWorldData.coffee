

# Nouvel objet qui hérite de la classe Model 
class HelloWorldData extends Model
    constructor: ( params = {}) ->
        super()
        
        # Fonction de la classe Model pour ajouter des modèles
        @add_attr
            
            # nom : modèle (ici un modèle Text)
            txt : if params.txt? then params.txt else "Hello world !"
            
            # Autre manière :
#             txt : new Text(params.txt)
            

            
