tema_mapa <- function(){
  list(
    ggplot2::theme(
      panel.background = ggplot2::element_rect(color="black",fill = "white"),
      panel.grid.major = ggplot2::element_line(color="gray",linetype = 3)),
    ggspatial::annotation_scale(
      location="bl",
      height = ggplot2::unit(0.2,"cm")),
    ggspatial::annotation_north_arrow(
      location="tr",
      style = ggspatial::north_arrow_nautical,
      height = ggplot2::unit(1.5,"cm"),
      width =  ggplot2::unit(1.5,"cm"))
  )
}

library(patchwork)
composition <- function(col,df){
  var_histograma <- df %>%
    drop_na() %>%
    ggplot(aes(x={{col}}, y=..density..)) +
    geom_histogram(col="black",fill="gray") +
    geom_density(fill="blue",alpha=.08)+
    theme(axis.text.x=element_text(size=rel(2)),
          axis.text.y=element_text(size=rel(2)),
          axis.title.x = element_text(size=rel(2)),
          axis.title.y = element_text(size=rel(2)))
  var_boxplot <- df %>%
    drop_na() %>%
    ggplot(aes(x={{col}})) +
    geom_boxplot(fill="lightgray") +
    coord_cartesian(ylim=c(-.9,.9))+
    theme(axis.text.x=element_text(size=rel(2)),
          axis.text.y=element_text(size=rel(2)),
          axis.title.x = element_text(size=rel(2)),
          axis.title.y = element_text(size=rel(2)))
  var_qqplot <- df %>%
    drop_na() %>%
    ggplot(aes(sample={{col}})) +
    stat_qq(shape=1,size=3,color="black")+
    stat_qq_line(col="red") +
    theme(axis.text.x=element_text(size=rel(2)),
          axis.text.y=element_text(size=rel(2)),
          axis.title.x = element_text(size=rel(2)),
          axis.title.y = element_text(size=rel(2)))

  print(var_qqplot | (var_histograma)/(var_boxplot))

}

