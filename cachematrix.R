## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## assign matrix to variable z 

z <- makeCacheMatrix()
## Set matrix to specific, easly testable example
z$set(matrix(1:4, 2, 2))
## retreave the matrix
z$getmatrix
## Create the function that starts with null matrix argument
makeCacheMatrix <- function(x = matrix()) {
  ## Set matrix inverse to NULL
  m<-NULL
  ## Cache matrix
  set<-function(y){
    x<<-y
    ## Set inversion to NULL
    m<<-NULL

}
## Get values for inverse
get<-function() x
## calculate inverse
setmatrix<-function(solve) m<<- solve
##retrive inverse
getmatrix<-function() m
## Assigns the inverse values to makeCacheMatrix
list(set=set, get=get,
     setmatrix=setmatrix,
     getmatrix=getmatrix)
}
## retrive the matrix from cache
cacheSolve <- function(x, ...) {
  m<-x$getmatrix()
## if inverse exists, get cache data
  if(!is.null(m)){
    message("getting cached data")
    return(m)
  }
## If the inverse does not exist, get the data and calculete inverse before retriving
  matrix<-x$get()
  m<-solve(matrix, ...)
  x$setmatrix(m)
  m
}

cacheSolve(z)

cacheSolve(makeCacheMatrix(matrix(rnorm(4), 2, 2)))
