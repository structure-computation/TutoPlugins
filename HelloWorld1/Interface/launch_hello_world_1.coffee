# Fonction coffeescript
launch_hello_world_1 = () ->

    # On crée une variable textuelle
    v = "Hello World !"
    
    # On peut l'afficher dans la console javascript
    console.log v
    
    # On crée un conteneur dans la page web (bloc <div>)
    div1 = new_dom_element                 # Fonction de la librairie Soja DomHelper
        nodeName : "div"                   # Type de conteneur
        parentNode: document.body          # Conteneur parent (ici, le corps de la page)
        txt: v                             # Texte contenu dans le bloc
    
    # On peut créer un bloc personnalisé
    div2 = new_dom_element
        nodeName : "div"
        parentNode: div1
        txt: v
        style:                             # Personnalisation graphique
            background: "#404040"          # Couleur de fond
            color: "white"                 # Couleur du texte
            border: "1px solid #666"       # Bordure du bloc
            width: "300px"                 # Longueur
            margin: "auto"                 # Centrage du bloc
            textAlign: "center"            # Centrage du texte
            paddingTop: "50px"             # Décalage vertical du texte
            paddingBottom: "50px"          # Décalage vertical du texte
            fontSize: "20"                 # Taille de police
            fontWeight: "bold"             # Type de police (gras)
            borderRadius: "5px"            # Arrondissement du bord


