
## The functions below do: - cache the inverse of a matrix
## How to Use: The results of makeCacheMatrix are passes and then call to cacheSolve 

#creates matrix and the inverse
# x is invertable matrix, by assumption
#examples
#test_matrix = makeCacheMatrix(matrix(rnorm(16), 4, 4))

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) inv <<- inverse
  getinverse <- function() inv
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


# Compute and cache the inverse of a matrix
# x passed form makeCacheMatrix call
# ... additional arguments to pass to solve function
# examples
# test_matrix = makeCacheMatrix(matrix(rnorm(16), 4, 4))
#' cacheSolve(test_matrix)
cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  inv <- x$getinverse()
  if(!is.null(inv)) {
    message("getting cached matrix inverse")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data, ...)
  x$setinverse(inv)
  inv
}