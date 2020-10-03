# file (string): file to be copied to the clipboard (with fileending)
# filepath (string): path where file to be copied to clipboard is stored

CopyToClipboard <- function(file, filepath = here::here("HTML")){
  readLines(paste0(filepath, "/", file)) %>% clipr::write_clip()
  #xml2::read_html(paste0(filepath, "/", file)) %>% clipr::write_clip()
}
