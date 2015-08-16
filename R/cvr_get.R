
#' This function makes a request to the CVR API.
#'
#' @param search The seach will be made in the CVR-number, p-number or company name.
#' @param country Specify country to either 'dk' for Denmark or 'no' for Norway.
#' @param search_in Not required. Character value 'vat', 'name', 'produ' or 'phone'.
#' @export
cvr_get <- function(search, country, search_in = NULL){

  stopifnot(country == "dk" | country == "no")
  stopifnot(search_in == "vat" | search_in == "name" | search_in == "produ" | search_in == "phone")

  search <- as.character(search)

  # Create the url
  cvr_url <- "http://cvrapi.dk/api?"
  query <- paste0("country=", country, "&format=json")

  # Unless the user have suplied a search_in we just use the standard search
  if(!is.null(search_in)){
    query <- paste0(search_in, "=", cvr_correct_url(URLencode(search)), "&", query)
  } else {
    query <- paste0("search=", cvr_correct_url(URLencode(search)), "&", query)
  }

  # Finish the url
  cvr_url <- paste0(cvr_url, query)

  # makee the request and format the content
  cvr_response <- httr::GET(cvr_url, httr::add_headers("User-Agent" = "github.com/krose/cvrapi"))
  cvr_content <- httr::content(cvr_response, as = "text")
  cvr_content <- jsonlite::fromJSON(cvr_content)

  # if the API returns an error, then return an appropiate error message
  if(!is.null(cvr_content$error)){
    if(cvr_content$error == "NOT_FOUND"){
      stop(paste0(search, " Not Found"))
    } else if(cvr_content$error == "INVALID_VAT"){
      stop(cvr_content$message)
    } else {
      stop("Your IP has most likely been blocked.")
    }
  }

  return(cvr_content)
}


