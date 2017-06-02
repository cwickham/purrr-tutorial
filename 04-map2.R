library(repurrrsive)
gap_split_small <- gap_split[1:10]
countries <- names(gap_split_small)

# For each country create a ggplot of Life Expectancy through time 
# with a title

# For one country
ggplot(gap_split_small[[1]], aes(year, lifeExp)) +
  geom_line() +
  labs(title = countries[[1]])

# For all countries
plots <- map2(gap_split_small, countries, 
  ~ ggplot(.x, aes(year, lifeExp)) + 
      geom_line() +
      labs(title = .y))

plots[[1]]
# Display all plots
walk(plots, print) # this might take awhile

# Save all plots
walk2(.x = plots, .y = countries, 
  ~ ggsave(filename = paste0(.y, ".pdf"), plot = .x))

# Argh! I didn't want all those pictures in this directory,
# remove them all
file.remove(paste0(countries, ".pdf"))


