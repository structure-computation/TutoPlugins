
class SimpleTreeView extends View
    constructor: ( @el, @model) ->
        super @model

    # Mise à jour quand le modèle est modifié -----------------------------------------------------------------------------
    onchange: ->
        if @model.has_been_modified   
        
            data = []
            @tojson data, @model
            
            root = data[0]
            @update_tree root



    # Conversion du modèle GraphNode en liste JSON -----------------------------------------------------------------------
    tojson: (d, m) ->
        if m.children.length !=0
            d.push
                "name": m.name.get()
                "children": []
            for child in m.children
                @tojson d[d.length-1]["children"], child
        else
            d.push 
                "name": m.name.get()    
                
    

    # Création de l'arbre et mise à jour ----------------------------------------------------------------------------
    update_tree: (root) ->   
    
        margin = 
            top: 20
            right: 120
            bottom: 20
            left: 120
        width = 800 - (margin.right) - (margin.left)
        height = 500 - (margin.top) - (margin.bottom)
  
        @canvas = d3.select('svg').remove()
        @canvas = d3.select('body').append('svg').attr('width', width + margin.right + margin.left).attr('height', height + margin.top + margin.bottom).append('g').attr('transform', 'translate(' + margin.left + ',' + margin.top + ')')

        @tree = d3.layout.tree().size([
            height
            width
        ])
    
        nodes = @tree.nodes(root)
        links = @tree.links(nodes)
        
        node = @canvas.selectAll('node').data(nodes).enter().append('g').attr('class', 'node').attr('transform', (d) ->
            'translate(' + d.y + ',' + d.x + ')'
            )
        
        node.append('circle').attr('r', 5).attr 'fill', 'steelblue'
        node.append('text').attr('dy', '20px').text (d) ->
            d.name
            
        diagonal = d3.svg.diagonal().projection((d) ->
            [
                d.y
                d.x
            ]
            )
            
        @canvas.selectAll('.link').data(links).enter().append('path').attr('class', 'link').attr('fill', 'none').attr('stroke', '#ADADAD').attr 'd', diagonal
        


        
        
        
        