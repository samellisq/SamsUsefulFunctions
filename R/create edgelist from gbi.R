#' Create edgelist from a group by individual matrix
#' @export
create_edgelist = function(gbi){
  num.mat = aninet::get_numerator(gbi, data_format = "GBI", return = "matrix")
  den.mat = aninet::get_denominator(gbi, data_format = "GBI", return = "matrix")

  R = ncol(gbi)
  edgelist = list()
  for(i in 1:R){
    edgelist[[i]] = list()
    for(j in 1:R){
      A = rownames(num.mat)[i]
      B = colnames(num.mat)[j]
      ids = sort(c(A,B))
      A = ids[1]
      B = ids[2]
      label = paste(A, B, sep = ".")
      num = num.mat[i,j]
      den = den.mat[i,j]
      sri = num/den
      edgelist[[i]][[j]] = data.frame(A,B,label, num,den,sri)
    }
    edgelist[[i]] = bind_rows(edgelist[[i]])
  }
  edgelist = dplyr::bind_rows(edgelist)
  edgelist = dplyr::as_tibble(edgelist)
  edgelist = dplyr::distinct(edgelist)
  edgelist = dplyr::filter(edgelist, A!=B)
  # edgelist = filter(edgelist, den >0)
  # edgelist = filter(edgelist, num >0)
  return(edgelist)

}
