## These two functions will create a matrix which can have the inverse
## calculated of them and store them in the cache.

## The makeCacheMatrix() function first checks to see if a cached matrix
## exists and checks if it is square. However if no cached matrix exists
## it will check to see if the specified matrix is square and save this 
## in the cache. Otherwise it will return an error.

makeCacheMatrix <- function(x = matrix()) {
      
      if(exists("m_cache") && nrow(m_cache) == ncol(m_cache)) {
            return(message("Square matrix already in cache"))
      }
      
      m <- x
      
      if(nrow(m) == ncol(m)) {
            m_cache <<- m
            message("Matrix specified is square and is saved as \"m_cache\"")
            m_cache
      } else if(nrow(m) != ncol(m)) {
            return(message("Matrix is NOT square and thus the inverse cannot be calculated"))
      }

}

## The cacheSolve() function returns the inverse of the matrix specified 
## in the arguments UNLESS an existing inverse matrix has already been
## saved in the global environment.

cacheSolve <- function(x = m_cache, ...) {

      if(exists("m_inverse")) {
            message("Existing Inverse Matrix in cache, displaying this instead \nof specified Square Matrix. Saved as \"m_inverse\"")
            return(m_inverse)
      }
      
      m_inverse <<- solve(x)
      message("Matrix saved as \"m_inverse\"")
      m_inverse

}
