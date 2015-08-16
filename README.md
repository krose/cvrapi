This is a quick and dirty introduction to the CVR API.

Installation
------------

You can only install the development version from github, using Hadley Wickham's [devtools](http://cran.r-project.org/web/packages/devtools/index.html) package:

    if(!require("devtools")) install.packages("devtools")
    library("devtools")
    install_github("rOpenGov/dkstat")

Examples
--------

``` r
library(cvrapi)
```

This is how you use the search function. The result is a list with a nested data.frame in 'productionunits'.

``` r
cvr_get(search = "RK Foto ApS", country = "dk")
```

    ## $vat
    ## [1] 36890266
    ## 
    ## $name
    ## [1] "RK Foto ApS"
    ## 
    ## $address
    ## [1] "Mejerivej 15"
    ## 
    ## $zipcode
    ## [1] "4700"
    ## 
    ## $city
    ## [1] "Næstved"
    ## 
    ## $protected
    ## [1] TRUE
    ## 
    ## $phone
    ## [1] "61331031"
    ## 
    ## $email
    ## [1] "rk@kongsgaardfoto.dk"
    ## 
    ## $fax
    ## NULL
    ## 
    ## $startdate
    ## [1] "04/05 - 2015"
    ## 
    ## $enddate
    ## NULL
    ## 
    ## $employees
    ## NULL
    ## 
    ## $addressco
    ## NULL
    ## 
    ## $industrycode
    ## [1] 742000
    ## 
    ## $industrydesc
    ## [1] "Fotografisk virksomhed"
    ## 
    ## $companycode
    ## [1] 80
    ## 
    ## $companydesc
    ## [1] "Anpartsselskab"
    ## 
    ## $creditstartdate
    ## NULL
    ## 
    ## $creditbankrupt
    ## [1] FALSE
    ## 
    ## $owners
    ## NULL
    ## 
    ## $productionunits
    ##          pno main        name      address zipcode    city protected
    ## 1 1020390138 TRUE RK Foto ApS Mejerivej 15    4700 Næstved      TRUE
    ##      phone                email fax    startdate enddate employees
    ## 1 61331031 rk@kongsgaardfoto.dk  NA 04/05 - 2015      NA        NA
    ##   addressco industrycode           industrydesc
    ## 1        NA       742000 Fotografisk virksomhed
    ## 
    ## $t
    ## [1] 100
    ## 
    ## $version
    ## [1] 6

You can also search directly in the names of companies.

``` r
cvr_get(search = "RK Foto ApS", country = "dk", search_in = "name")
```

    ## $vat
    ## [1] 36890266
    ## 
    ## $name
    ## [1] "RK Foto ApS"
    ## 
    ## $address
    ## [1] "Mejerivej 15"
    ## 
    ## $zipcode
    ## [1] "4700"
    ## 
    ## $city
    ## [1] "Næstved"
    ## 
    ## $protected
    ## [1] TRUE
    ## 
    ## $phone
    ## [1] "61331031"
    ## 
    ## $email
    ## [1] "rk@kongsgaardfoto.dk"
    ## 
    ## $fax
    ## NULL
    ## 
    ## $startdate
    ## [1] "04/05 - 2015"
    ## 
    ## $enddate
    ## NULL
    ## 
    ## $employees
    ## NULL
    ## 
    ## $addressco
    ## NULL
    ## 
    ## $industrycode
    ## [1] 742000
    ## 
    ## $industrydesc
    ## [1] "Fotografisk virksomhed"
    ## 
    ## $companycode
    ## [1] 80
    ## 
    ## $companydesc
    ## [1] "Anpartsselskab"
    ## 
    ## $creditstartdate
    ## NULL
    ## 
    ## $creditbankrupt
    ## [1] FALSE
    ## 
    ## $owners
    ## NULL
    ## 
    ## $productionunits
    ##          pno main        name      address zipcode    city protected
    ## 1 1020390138 TRUE RK Foto ApS Mejerivej 15    4700 Næstved      TRUE
    ##      phone                email fax    startdate enddate employees
    ## 1 61331031 rk@kongsgaardfoto.dk  NA 04/05 - 2015      NA        NA
    ##   addressco industrycode           industrydesc
    ## 1        NA       742000 Fotografisk virksomhed
    ## 
    ## $t
    ## [1] 100
    ## 
    ## $version
    ## [1] 6
