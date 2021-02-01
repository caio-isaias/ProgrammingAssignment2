## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
# Comments:
# this function is similar to the test example "Caching the Mean of a Vector"
# but we have the following changes:
# 1. i use a matrix, not a vector
# 2. i use 'solve', not 'mean, so we can get the inverse
##
makeCacheMatrix <- function(x = matrix()) {
        sol <- NULL # initialize
        set <- function(y) { # set in cache
                x <<- y
                sol <<- NULL
        }
        
        get <- function() {x} # get the matrix
        setsolve <- function(solve) {sol <<- solve} # set solution in cache
        getsolve <- function() {sol} # get the solution
        
        list(set = set, get = get,
             setsolve = setsolve,
             getsolve = getsolve)
}

## Write a short comment describing this function
# Comments:
# Simmilar to makeCacheMatrix() i used as model the example
##
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        sol <- x$getsolve() # initialize sol getting the matrix
        
        if(!is.null(sol)) { # if the solution is cached return it
                message("getting cached data")
                return(sol)
        }
        # if the solution isnt cached
        # we can get it with the following
        data <- x$get()
        sol <- solve(data, ...)
        x$setsolve(sol)
        sol
}
