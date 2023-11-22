require(shiny)
require(visNetwork)

server <- function(input, output) {
  output$mynetworkid <- renderVisNetwork({
    selected_node <- input$selectedNode
    
    if (selected_node == "All") {
      # Show the entire graph
      visNetwork(nodes, edges)
    } else {
      # Filter edges connected to the selected node
      filtered_edges <- edges[edges$from == selected_node | edges$to == selected_node, ]
      
      # Extract all unique nodes involved in the filtered edges
      connected_nodes <- unique(c(filtered_edges$from, filtered_edges$to))
      
      # Filter nodes based on the connected nodes
      filtered_nodes <- nodes[nodes$id %in% connected_nodes, ]
      
      visNetwork(filtered_nodes, filtered_edges)
    }
  })
}


ui <- fluidPage(
  selectInput("selectedNode", "Select Person or Skill", c("All", unique(nodes$id))),
  visNetworkOutput("mynetworkid")
)



shinyApp(ui = ui, server = server)