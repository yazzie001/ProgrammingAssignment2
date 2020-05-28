## This file contains two functions which are required for the Week 3 R Programming assignment


## makeCacheMatrix creates an R object that stores a matrix and its inverse

makeCacheMatrix <- function(x = matrix()) {
	i <- NULL
	set <- function(y) {
		x <<- y
		i <<- NULL
	}
	get <- function() x
	setinverse <- function(inverse) i <<- inverse
	getinverse <- function() i
	list(set = set,
	get = get,
	setinverse = setinverse,
	getinverse = getinverse
	)
}


## cacheSolve requires an argument that is returned by makeCacheMatrix.
## It retrieves the inverse from the cached matrix that is stored in the 
##makeCacheMatrix object's environemnt

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'

i <- x$getinverse()
if (!is.null(i)) {
	message("getting cached data")
	return(i)
}
data <- x$get()
i <- solve(data, ...)
x$setinverse(i)
i
}