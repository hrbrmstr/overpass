#' List recognized features in OSM Overpass
#'
#' @return character vector of all known features
#' @note requires internet access
#' @references \url{http://wiki.openstreetmap.org/wiki/Map_Features}
#' @export
#' @examples
#' available_features()
available_features <- function() {

  pg <- xml2::read_html("http://wiki.openstreetmap.org/wiki/Map_Features")
  keys <- xml2::html_attr(rvest::html_nodes(pg, "a[href^='/wiki/Key']"), "title")
  unique(sort(gsub("^Key:", "", keys)))

}

#' List tags associated with a feature
#'
#' @return character vector of all known tags for a feature
#' @note requires internet access
#' @param feature feature to retrieve
#' @references \url{http://wiki.openstreetmap.org/wiki/Map_Features}
#' @export
#' @examples
#' available_tags("aerialway")
available_tags <- function(feature) {
  pg <- xml2::read_html("http://wiki.openstreetmap.org/wiki/Map_Features")
  tags <- xml2::html_attr(rvest::html_nodes(pg, sprintf("a[title^='Tag:%s']", feature)), "title")
  unique(sort(gsub(sprintf("Tag:%s=", feature), "", tags, fixed=TRUE)))
}


