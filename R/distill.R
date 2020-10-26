
# adapted from https://github.com/rstudio/distill/blob/master/R/create.R
# So that we can easily create new distill pages with uio themeing.
create_uio_distill_website <- function(dir,
                                       title,
                                       gh_pages = FALSE,
                                       edit = interactive()){

  tmp <- distill:::do_create_website(dir = dir,
                                 title = title,
                                 gh_pages = gh_pages,
                                 type = "website",
                                 edit = FALSE) # dont open before adapting files


  # copy template files
  css <- system.file(file.path("rmarkdown", "templates","project", "uio-distill.css"),
                          package = "uiothemes")
  k <- file.copy(css, file.path(dir, "uio-distill.css"))

  render_website_template <- function(file, data = list()) {
    uiothemes_render_template(file, type = "distill-uio-website", dir, data)
  }
  render_website_template("_site.yml", data = list(
    name = basename(dir),
    title = title,
    output_dir = if (gh_pages) "docs" else "_site"
  ))
  render_website_template("index.Rmd", data = list(title = title, gh_pages = gh_pages))
  render_website_template("about.Rmd")

  if (edit)
    distill:::edit_file(file.path(dir, "index.Rmd"))

  distill:::render_website(dir, "distill-uio-website")
}


new_project_create_website <- function(dir, ...) {
  params <- list(...)
  create_uio_distill_website(dir,
                             params$title,
                             params$gh_pages,
                             edit = FALSE)
}



uiothemes_render_template <- function(file, type, target_path, data = list()) {
  template <- system.file(file.path("rmarkdown", "templates", "project", type, file),
                          package = "uiothemes")
  template <- paste(readLines(template, encoding = "UTF-8"), collapse = "\n")
  output <- whisker::whisker.render(template, data)
  writeLines(output, file.path(target_path, file), useBytes = TRUE)
}
