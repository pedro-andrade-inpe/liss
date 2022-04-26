
require(dplyr)

basePath <- "C:/Users/pedro/Dropbox/github/liss"

campos <-list.dirs(basePath, recursive = FALSE)

# santarem
mfile <- paste0(basePath, "/santarem/points.shp")
msf <- sf::read_sf(mfile) %>%
  dplyr::mutate(Foto_CMM = ifelse(is.na(Foto_CMM), "NO", Foto_CMM)) %>%
  dplyr::mutate(Foto_Uso = ifelse(is.na(Foto_Uso), "NO", Foto_Uso)) %>%
  dplyr::mutate(id = paste(id))

msf$micon = "home"
msf$micon2 = 1
sf::write_sf(msf, mfile)


# tocantins
mfile <- paste0(basePath, "/baixoTocantins/points.shp")

msf <- sf::read_sf(mfile) %>%
  dplyr::mutate(drone_path = ifelse(is.na(drone_path), "NO", drone_path)) %>%
  dplyr::mutate(Uso = ifelse(is.na(Uso), "NO", Uso)) %>%
  dplyr::mutate(pic_path = ifelse(is.na(pic_path), "NO", pic_path))

msf

msf$micon = "home"
msf$micon2 = 1
sf::write_sf(msf, mfile)
