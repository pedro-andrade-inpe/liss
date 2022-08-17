
require(dplyr)

sf::sf_use_s2(FALSE)

basePath <- "C:/Users/pedro/Dropbox/github/liss/baixoTocantins/"

shp <- sf::read_sf(paste0(basePath, "traj.shp"))

result <- sf::st_geometry(shp) %>%
  sf::st_coordinates() %>%
  .[, 1:2] %>%
  sf::st_linestring() %>%
  sf::st_sfc() %>%
  sf::st_sf()

sf::write_sf(result, "traj.shp")
