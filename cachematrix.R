## Put comments here that give an overall description of what your
## functions do------
## The two funtions together define a matrix, find its inverse
## and save both the matrices into a cache and continue to read the inverse 
## from the cache until a new matrix is defined.

## Write a short comment describing this function
## This function defines a list of functions that can be used to operate the cache 
## containing matrix and its inverse.
makeCacheMatrix <- function(UserMatrix = matrix()) { ##user provides the matrix whose inverse is to be found. 
        CachedInverse<-NULL
        set<-function(UserMatrix){ 
                CachedMatrix<<-UserMatrix
                CachedInverse<<-NULL
        }
        get<-function() x
        setmatrix<-function(solve) CachedInverse<<- solve ## i contains the cached inverse.
        getmatrix<-function() CachedInverse
        list(set=set, get=get,
             setmatrix=setmatrix,
             getmatrix=getmatrix) ## list of functions that operate cache matrices.
}
## This function checks if the inverse is available in the cache. If it doesnot
## find the value in the cache it computes the inverse and stores it in the cache.
cacheSolve <- function(s, ...) { ## accepts the object containg the list of functions as argument.
        i<-s$getmatrix()         ## Reads the inverse from the cache
        if(!is.null(i)){
                message("getting cached data")
                return(i)        ## if inverse found in cache returns the inverse from cache.
        }
        matrix<-s$get()         ## else computes the inverse and stores it into the cache.
        i<-solve(matrix, ...)
        s$setmatrix(i)
        i
}
