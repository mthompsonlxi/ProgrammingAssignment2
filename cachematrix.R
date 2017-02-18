## These two functions will create a matrix which can have the inverse
## calculated of them and store them in the cache.
## mthompsonlxi (18/02/2017)


## The makeCacheMatrix() will create an inverse matrix if called upon
## by cacheSolve() otherwise it sets calls for makeCacheMatrix() and
## it's functions.

makeCacheMatrix <- function(x = matrix()) {
      # Through out this the inverse matrix will be referred to as "im"
      im <- NULL
      # If the matrix has not been created and/or has been changed create
      # a new object for this and clear the existing object
      set <- function(y) {
            x <<- y
            im <<- NULL
      }
      # Retrieve the new matrix to be solved
      get <- function() x
      # Solve the matrix and store in cache
      setim <- function(solve) im <<- solve
      # Gets the inverse if it is already stored in the cache
      getim <- function() im
      # These values are passed to makeCacheMatrix()
      list(set = set, get = get,
           setim = setim,
           getim = getim)

}

## The cacheSolve() function checks to see if an existing inverse 
## matrix exists and if so will return this. Otherwise it calls
## makeCacheMatrix() to create the inverse matrix.

cacheSolve <- function(x, ...) {
      # Checks to see if an existing inverse matrix exists and if it 
      # does returns this
      im <- x$getim()
      if(!is.null(im)) {
            message("getting cached matrix")
            return(im)
      }
      # If no inverse matrix exists, then solves for this and sets it
      # in the cache before returning this
      im <- solve(x$get(), ...)
      x$setim(im)
      im
}
