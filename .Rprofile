options(
  conflicts.policy = FALSE,    # 不提示包之间的冲突
  max.print = 1000)


options(repos = c(CRAN = "https://mirrors.tuna.tsinghua.edu.cn/CRAN/"))
options(useFancyQuotes = FALSE)
options(error = function() {
  calls <- sys.calls()
  if (length(calls) >= 2L) {
    sink(stderr())
    on.exit(sink(NULL))
    cat("Backtrace:\n")
    calls <- rev(calls[-length(calls)])
    for (i in seq_along(calls)) {
      cat(i, ": ", deparse(calls[[i]], nlines = 1L), "\n", sep = "")
    }
  }
  if (!interactive()) {
    message("Exiting on error")
    q(status = 1)
  }
})

options(languageserver.formatting_style = function(options) {
  styler::tidyverse_style(scope = "indention", indent_by = options$tabSize)
})

options(
  datatable.quiet = TRUE,
  datatable.print.class = TRUE,
  datatable.print.keys = TRUE)

options(future.rng.onMisuse = "ignore")


if (interactive() && Sys.getenv("RSTUDIO") == "") {
  Sys.setenv(TERM_PROGRAM = "vscode")
  options(vsc.rstudioapi = TRUE)
  if ("httpgd" %in% .packages(all.available = TRUE)) {
    options(vsc.plot = FALSE)
    options(device = function(...) {
      httpgd::hgd(silent = TRUE)
      .vsc.browser(httpgd::hgd_url(history = FALSE), viewer = "Beside")
    })
  }
  source(file.path(Sys.getenv(if (.Platform$OS.type == "windows") "USERPROFILE" else "HOME"), ".vscode-R", "init.R"))
}
