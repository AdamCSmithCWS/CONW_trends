
## function to apply the bbsBayes2 colour palette to trend values

trend_colour_breaks <- function(trends,
                                trend_col = "trend"){
# trends is a dataframe produced by the generate_trends() function in bbsBayes2
  # but can be any df with column that includes %/year values of trends
breaks <- c(-7, -4, -2, -1, -0.5, 0.5, 1, 2, 4, 7)
labls <- c(paste0("< ", breaks[1]),
           paste0(breaks[-c(length(breaks))],":", breaks[-c(1)]),
           paste0("> ",breaks[length(breaks)]))
labls <- paste0(labls, " %")


trends$t_plot <- as.numeric(as.character(trends[[trend_col]]))
trends$t_plot <- cut(trends$t_plot, breaks = c(-Inf, breaks, Inf),
                     labels = labls)

pal <- stats::setNames(
  c("#a50026", "#d73027", "#f46d43", "#fdae61", "#fee090", "#ffffbf",
    "#e0f3f8", "#abd9e9", "#74add1", "#4575b4", "#313695"),
  labls)


out<-vector("list",2)
names(out) <- c("trends_plot_cats","pal")
out[["trends_plot_cats"]] <- trends$t_plot
out[["pal"]] <- pal
return(out)
}






