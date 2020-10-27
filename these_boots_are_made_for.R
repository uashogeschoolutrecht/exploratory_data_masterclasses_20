#' A self-written Bootstrap function
#' @import magrittr
#' @param x A vector of type nummeric (the sample data)
#' @param iter Number of bootstrapped samples to generate
#' @param mode Which statistic do you want to return - 
#' currently implemented are "mean", "median" and "sd"

bootstrap <- function(x, 
                      iter, 
                      mode = "mean", 
                      trim = 1,
                      as_tbl = FALSE){

  boots <- function(x){
    
    s <- sample(x = x, 
                size = (length(x)*trim), 
                replace = TRUE)
    
    if(mode == "mean"){
      mean_s <- mean(s)
    }
    
    if(mode == "median"){
      mean_s <- median(s)
    }
    return(mean_s)
    
    }
    result <- replicate(n = iter, boots(x)) 
    
    if(as_tbl == TRUE){
      return(tibble::as_tibble(result))
    }
    if(as_tbl == FALSE){
      return(result)
    }
}

