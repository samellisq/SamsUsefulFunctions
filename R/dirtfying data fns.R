#' Unclean a string column of a dataframe by adding some random errors
#'
#' Developed with J Wilde for ASAB Spring 2024
#'
#' @export
break.my_string = function(data.frame.column){ # e.g. df$a.string
  for(i in 1:length(data.frame.column)){
    if(runif(1) < 0.3){
      if(runif(1)<0.5){
        data.frame.column[i] = toupper(data.frame.column[i])
      } else {
        data.frame.column[i] = stringr::str_replace_all(data.frame.column[i], "e", "E")
        data.frame.column[i] = stringr::str_replace_all(data.frame.column[i], "E", "e")
      }
    }
  }
  return(data.frame.column)

}

#' Unclean a string column of a dataframe by adding some random errors
#'
#' Developed with J Wilde for ASAB Spring 2024
#'
#' @export
break.my_numbers = function(data.frame.column) {
  for(i in 1:length(data.frame.column)){
    if(runif(1) < 0.3){
      if(runif(1)<0.5){
        data.frame.column[i] = as.character(data.frame.column[i])
      } else {
        data.frame.column[i] = paste0(data.frame.column[i], ",")
      }
    }
    if(runif(1) > 0.95){
      data.frame.column[i] = NA
    }
  }
  return(data.frame.column)
}


#' Unclean a string column of a dataframe by adding some random errors
#'
#' Developed with J Wilde for ASAB Spring 2024
#'
#' @export
break.my_factor = function(data.frame.column){
  levs = levels(data.frame.column)
  data.frame.column = factor(data.frame.column, levels = c(levs, "SAM&JOES_SECRET_LEVEL"))
  return(data.frame.column)
}



#' Unclean a string column of a dataframe by adding some random errors
#'
#' Developed with J Wilde for ASAB Spring 2024
#'
#' @export
data_dirtifier = function(data_frame) {
  classes = sapply(data_frame, class)
  for(c in 1:ncol(data_frame)) {
    #print(classes[c] )
    if(classes[c]  == "character" ) {
      data_frame[, c] = break.my_string(data_frame[, c])
    } else if(classes[c] == "integer" | classes[c] == "numeric" ) {
      data_frame[, c] = break.my_numbers(data_frame[, c])
    } else if(classes[c] == "factor" ) {
      data_frame[, c] = break.my_factor(data_frame[, c])
    }
  }

  return(data_frame)
}
