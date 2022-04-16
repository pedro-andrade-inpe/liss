

basePath <- "C:/Users/pedro/Dropbox/github/liss"

campos <-list.dirs(basePath, recursive = FALSE)
mfile <- paste0(campos[5], "/points.shp")
msf <- sf::read_sf(mfile)

msf$micon = "home"
sf::write_sf(msf, mfile)
