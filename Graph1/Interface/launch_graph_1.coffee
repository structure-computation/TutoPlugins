

launch_graph_1 = ( main = document.body ) ->

    graph_data = new GraphData
        name : "Noeud 0"

    graph_view = new SimpleTreeView main, graph_data   


                