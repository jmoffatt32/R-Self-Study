# Video 1.3:
# ---------

    # Load `ggplot2` package   
    library(ggplot2);

# Video 2.2
# ---------

    # Show 3 ways to assign a variable value
    aaa <- 3.9
    
    aaa = 3.9
    
    assign("aaa", 3.9)
    
    # Show how to remove a variable
    rm(aaa)
    
# Video 2.3
# ---------
    
    # Example 1: "numeric" vs. "integer"
    a <- 1
    b <- 2L
    class(a)
    class(b)
    is.numeric(b)
    
    # Example 2: Use `nchar()` to check the length of a string
    a <- "sample text"
    nchar(a)
    
    # Example 3: Use the `Date` class to store dates.
    date1 <- as.Date('2023-01-30')
    date1
    
    # Example 4: Use `POSIXct` class to store datetimes.
    date2 <- as.POSIXct("2022-01-30 11:59")
    date2
    
    # Example 5: Use "logical" type to store boolean values.
    t <- TRUE
    f <- FALSE
    class(t)
    class(f)
    t * 5       # 5 (since TRUE has value of 1)
    f * 5       # 0 (since FALSE has value of 0)
    
    
    

