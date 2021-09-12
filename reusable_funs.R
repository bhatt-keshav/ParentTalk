make_pregnancy_progress <- function(completed) {
  # Calc. delivery date from weeks pregnant
  # 40 weeks of total pregnancy minus completed weeks of pregnancy x 7 days 
  # Plus Date from now
  del_date <- ((40 - completed) * 7) + Sys.Date()  
  
  p <- ggplot() +
    geom_col(aes("", 40), width  = 1.2, fill = 'lightpink1') +
    geom_col(aes("", completed), width = 1.2, fill = "palegreen3") +
    geom_col(aes("", 40), width  = 1.2,
             fill = NA,
             colour = 'black') +
    annotate(
      'text',
      x = 1,
      y = 3,
      label = '%',
      colour = 'white',
      fontface = "bold"
    ) + 
  annotate(
    'text',
    x = 1,
    y = 35,
    label = del_date,
    colour = 'red',
    fontface = 'bold'
  )+ coord_flip() + 
    theme(
      axis.title = element_blank(),
      axis.text = element_blank(),
      axis.ticks = element_blank(),
      panel.grid.major = element_blank(),
      panel.grid.minor = element_blank(),
      panel.background = element_blank(),
      aspect.ratio=0.1)

  return(p)
}

make_pregnancy_progress(22)
# aspect.ratio=0.2