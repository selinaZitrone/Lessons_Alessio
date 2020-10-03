# file (string): name of the tex file to render 
# outname (string): name of the rendered html file. If left empty, same name as tex file will be chosen
# filepath (string): path of file to render. Defaults to /Lessons
# outpath (string): path where rendered html files should be saved. Defaults to /HTML
# replace (bool): Should an existing HTML file be replaced if a new one is rendered with the same name? Defaults to FALSE

RenderHTML <- function(file, outname = "", filepath = here::here("Lessons"), outpath = here::here("HTML"), replace = FALSE){
  # If outname is not specified, the rendered html will have the same name as the input tex file
  if(outname == ""){
    outname = gsub(".tex", ".html", file)
  }
  # Check if the output file already exists 
  if (file.exists(paste0(outpath, "/", outname))){
    if(replace){
      "HI"
      print(paste0("Removed existing old file ", outname, " in ", outpath))
      file.remove(paste0(outpath, "/", outname))
    } else{
      stop("File already exists!")
    }
  }
  
  # execute the pandoc command
  command <- paste0("pandoc ", filepath, "/", file, " -o ", outpath, "/", outname, " -t html5")
  shell(command)
}
