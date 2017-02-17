## These two functions will create a matrix which can have the inverse
## calculated of them and store them in the cache.

## The makeCacheMatrix function checks the matrix object specified to
## verify that it is square and if no object is specified it will check
## to see if there is one in the cache

makeCacheMatrix <- function(x = matrix()) {

}


## The cacheSolve() function returns the inverse of the matrix specified 
## in the arguments UNLESS an existing inverse matrix has already been
## saved in the global environment.

cacheSolve <- function(x, ...) {

      if(exists("m_inverse")) {
            message("Existing Inverse Matrix in cache, displaying this instead \nof specified Square Matrix. Saved as \"m_inverse\"")
            return(m_inverse)
      }
      
      m_inverse <<- solve(x)
      message("Matrix saved as \"m_inverse\"")
      m_inverse

}
