## Put comments here that give an overall description of what your
## functions do
## 
## We are tasked with creating 2 functions that are capable, in tandem, of cacheing the inverse of a matrix and retrieving this cached
## inverted matrix when the second function is called if the cached matrix exists (i.e.) if the first function has been called.

## Write a short comment describing this function
## 
## The functions that we are tasked to write do the exact same thing as the mean function we are given as an example (cache the
## value of object and make it retrievable if a certain function is called) except
## in this case we are looking for thethe inverse of a matrix.
## As such, our 2 functions will look very similar to makeVector and cachemean (the functions from the example)
## 
## the makeCacheMatrix function in particular creates a list of functions that when called by cacheSolve either calculate
## the inverse of some matrix or retrieve the inversion of this matrix from the makeCacheMatrix environment

makeCacheMatrix <- function(x = matrix()) { ## creates a function with a matrix as its argument, default value of said matrix
    ## is set empty
    inv <- NULL                             ## this initialized the inv (inverse, ie, what we want to be returned at the end) to null
    set <- function(y) {                    ## this function is a set function which assign new 
        x <<- y                             ## argument matrix in the parent environment (makeCacheMatrix environment) when called.
        inv <<- NULL                        ## it also resets inv to NULL
    }
    get <- function() x                     ## a function with an empty argument list. when called it returns the value of x from
    ## the makeCacheMatrix environment
    
    setinverse <- function(inverse) inv <<- inverse  ## a function which assigns a new value to inv in the makeCacheMatrix environment
    getinverse <- function() inv                     ## gets the value of inv where called
    list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)  ## returns the functions create in makeCacheMatrix
    ## in the form of a list. This allows to use the dollar sign operator in reference to the functions. if we created a vector 
    ## containing the functions instead then we would have to use bracket operators with numerical assignments for the functions
    ## which would be more confusing.
}



## This function uses the list of functions created in makeCacheMatrix to either solve the inverse of the matrix (the argument of 
## makeCacheMatrix) or retrieve the already solved inverse of the matrix depending on whether or not the inverse for that particular
## matrix has already been calculated or not

cacheSolve <- function(x, ...) { ## creates a function that takes as its primary argument an object containing a list of functions
    inv <- x$getinverse()  ## assigns the value of inv in the local evironment (CacheSolve) to the value of inv
    ##                        assigned in makeCacheMatrix
    if (!is.null(inv)) {  ## if the value for inv retrieved from makeCacheMatrix is not null then cacheSolve will return the value
        ## stored in makeCacheMatrix
        message("retriving inv from cache")
        return(inv)
    }
    matrix <- x$get() ## if the value for inv stored in makeCacheMatrix is null then this part of the code is executed.
    ## this particular line retrieves the matrix set in makeCacheMatrix
    inv <- solve(matrix,...) ## the function solve calculates the inverse of the matrix, which itself was retrieved from
    ## the makeCacheMatrix environment
    x$setinverse(inv) ## sets the value of inv in the makeCacheMatrix environment to value of inv just calculated by the solve function
    inv ## returns the just calculated inverse
        ## Return a matrix that is the inverse of 'x'
        
}
