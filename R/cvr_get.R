
#' This function makes a request to the CVR API.
#'
#' @param search The seach will be made in the CVR-number, p-number or company name.
#' @param country Specify country to either 'dk' for Denmark or 'no' for Norway.
#' @param search_in Not required. Character value 'vat', 'name', 'produ' or 'phone'.
#' @export
cvr_get <- function(search, country, search_in = NULL){


  cvr_url <- "http://cvrapi.dk/api?"

  query <- paste0("country=", country, "&format=json")

  if(!is.null(search_in)){
    query <- paste0(search_in, "=", cvr_correct_url(URLencode(search)), "&", query)
  } else {
    query <- paste0("search=", cvr_correct_url(URLencode(search)), "&", query)
  }

  cvr_url <- paste0(cvr_url, query)

  cvr_response <- httr::GET(cvr_url, httr::add_headers("User-Agent" = "github.com/krose/cvrapi"), httr::verbose())

  cvr_content <- httr::content(cvr_response, as = "raw")

  return(list(cvr_url, cvr_response, cvr_content))
}


