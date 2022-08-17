

require(dplyr)

sf::sf_use_s2(FALSE)


basePath <- "C:/Users/pedro/Dropbox/github/liss"

campos <-list.dirs(basePath, recursive = FALSE)[-c(1, 5, 6)]

result <- lapply(campos, function(mdir){
  msf <- sf::read_sf(paste0(mdir, "/points.shp")) %>%
    sf::st_bbox() %>%
#    sf::st_buffer(18000) %>%
#    sf::st_as_sfc() %>%
#    sf::st_as_sf() %>%
#    sf::st_union() %>%
    #  rbind(sf::read_sf())
    sf::st_as_sfc() %>%
    sf::st_as_sf()

  msf$app <- basename(mdir)

  return(msf)
})

result <- dplyr::bind_rows(result)

plot(result)

result$title <- c("Arapiuns", "Baixo Tocantins", "BR-230", "Santarém")

sf::write_sf(result, "fieldworks.shp")



