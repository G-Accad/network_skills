

# minimal example


# nodes <- data.frame(
#   id = 1:5,
#   type = c("person", "skill", "person", "person", "skill"),
#   label = paste(ifelse(nodes$type == "person", "Person", "Skill"), nodes$id),
#   title = paste0("<p><b>", 1:5, "</b><br>Node </p>")
#   
# )
# Save nodes data as a separate dataframe
#write.csv(nodes, "nodes_data.csv", row.names = FALSE)

nodes<-read.csv("~/network_skills/nodes_data.csv")

edges <- data.frame(from = c(3,3,1,1,3), to = c(5,4,2,4,6))
