source(here::here("R/RenderHTML.R"))
source(here::here("R/CopyToClipboard.R"))

# infiles (string): vector of filenames to be rendered and copied to the clipboard step by step (defaults to all files in the folder)
# inpath (string): direcotry where the files are lying (defaults to /Lessons)
# outfiles (string): vector of filenames for html files (defaults to filenames of tex files)
# overwrite (bool): Should an Html file be overwritten if a new one with the same name is generated? Defaults to TRUE
# outpath (string): path where converted html files are saved. Defaults to /HTML

Workflow <- function(infiles = list.files(here::here("Lessons"), pattern = ".tex"), inpath = here::here("Lessons"),
                     outfiles = "", outpath = here::here("HTML"), overwrite = TRUE){
  
  # if outfiles not specified call them the same as infiles
  if(length(outfiles < 1)){
    outfiles <- gsub(".tex", ".html", infiles)
  }
  
  # first remove old version and then copy a current version of the images folder to outpath
  #otherwise the html files don't find the images
  #shell(paste0("rm -r ", outpath, "/images"))
  #shell(paste0("cp -r ", here::here("images"), " ", outpath, "/images"))
  
  # Do the actual work of rendering and copying to clipboard
  for(i in 1:length(infiles)){
    if(i > 1){
    # Wait for user input to move to the next file
    invisible(readline(prompt="Press [enter] to continue"))
    }
    # Render tex file to HTML
    RenderHTML(file = infiles[i], filepath = inpath, outname = outfiles[i], outputpath = outpath, replace = overwrite)
    CopyToClipboard(file = outfiles[i], filepath = outpath)
    print(paste0("Content of file ", outfiles[i], " copied to clipboard!"))
  }
}

# call the function

Workflow()
