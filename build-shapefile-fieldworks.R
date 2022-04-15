


basePath <- "C:/Users/pedro/Dropbox/pesquisa/2022/publish-artigo-trabalhos-campo"

campos <-list.dirs(basePath, recursive = FALSE)

result <- lapply(campos, function(mdir){
  msf <- sf::read_sf(paste0(mdir, "/points.shp")) %>%
    sf::st_bbox() %>%
    sf::st_as_sfc() %>%
    sf::st_as_sf()

  msf$app <- basename(mdir)

  return(msf)
})

result <- dplyr::bind_rows(result)

plot(result)

sf::write_sf(result, "fieldworks.shp")
