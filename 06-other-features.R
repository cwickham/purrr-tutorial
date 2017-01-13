library(purrr)
library(readr)

# safely() and transpose() -------------------------------------------------

urls <- list(
  example = "http://example.org",
  asdf = "http://asdfasdasdkfjlda"
)

map(urls, read_lines)

safe_readLines <- safely(readLines)
safe_readlines

# Use the safe_readLines() function with map(): html
html <- map(urls, safe_readLines)

# Call str() on html
str(html)

# Extract the result from the element that was successful
html[["example"]][["result"]]

# Extract the error from the element that was unsuccessful
html[["asdf"]][["error"]]

str(transpose(html))

# Extract the results: res
res <- transpose(html)[["result"]]

# Extract the errors: errs
errs <- transpose(html)[["error"]]

