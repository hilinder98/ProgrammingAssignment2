## Put comments here that give an overall description of what your
## functions do
## 
## We are tasked with creating 2 functions that are capable, in tandem, of cacheing the inverse of a matrix and retrieving this cached
## inverted matrix when the second function is called if the cached matrix exists (i.e.) if the first function has been called.

## Write a short comment describing this function
## 
## The functions that we are tasked to write do the exact same thing as the mean function we are given as an example except
## for the inverse of a matrix instead of the mean of a vector. In other words, all parts of the example functions can remain the
##  same except for that parts that invovle calculation of the mean. instead, those parts should involve calculating the inverse
## 
## this function in particular creates a matrix whose inverse is capable of being cached

makeCacheMatrix <- function(x = matrix()) { ## this gives a default value to our argument
    inv <- NULL                             ## this sets the invers to null
    set <- function(y) {                    ## this function is a set function which assign new 
        x <<- y                             ## argument matrix in parent environment
        inv <<- NULL                        ## when there is a new matrix, this function resets inv to NULL
    }
    get <- function() x                     ## simply returns value of the matrix 
    
    setinverse <- function(inverse) inv <<- inverse  ## assigns value of inv in parent environment
    getinverse <- function() inv                     ## gets the value of inv where called
    list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)  ## you need this in order to refer 
    ## to the functions with the $ operator
}



## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
