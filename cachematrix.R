## Put comments here that give an overall description of what your
## functions do

## I simply copied the code from the two example functions and changed the 
## "mean" function to "solve". I also changed variable names to make it more readable

## the makeCachMatrix function "adds functionality" (cacheing) to a matrix. The function 
## returns a list with the methods that can be accessed thru the funtion

makeCacheMatrix <- function(x = matrix()) {
      i <- NULL
      set <- function(y) {
            x <<- y
            i <<- NULL
      }
      get <- function() x
      setinverse <- function(solve) i <<- solve
      getinverse <- function() i
      list(set = set, get = get,
           setinverse = setinverse,
           getinverse = getinverse)
}


## cacheSolve does the actual computation of the inverse matrix if it is not already
## available in the cache

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
      i <- x$getinverse()
      if(!is.null(i)) {
            message("getting cached data")
            return(i)
      }
      data <- x$get()
      i <- solve(data, ...)
      x$setinverse(i)
      i
}
