# Question (i)

hello2.person <- function(first, ...) {
    args <- c(...)
    
    if (length(args) == 1) {
        print(sprintf("Hello %s %s, today is %s.", first, "Doe", args[1]))
    } else if(length(args) >= 2) {
        print(sprintf("Hello %s %s, today is %s.", first, args[1], args[2]))
        
    }
}

# Question (ii)

run.this2 <- function (first, second, op="sum") {
    combo <- first + second
    do.call(op, args=list(combo))
}

# Question (iii)

    # If statement example
    ex.if <- function(x, y) {
        if (x == y) {
            print("Equal")
        }
    }
    
    # If-Else statement example
    ex.if_else <- function(x, y) {
        if (x == y) {
            print("Equal")
        } else {
            print("Unequal")
        }
    }
    
    # Switch statement example
    ex.switch <- function(x) {
        switch(x,
               "1"="One",
               "2"="Two",
               "3"="Three",
               "Other")
    }
    
    # && statement example
    ex.and <- function(x, y, z) {
        if (x < y && y < z) {
            print("Correct")
        } else {
            print("Incorrect")
        }
    }
    
    # Rep statement example
    ex.rep <- function(val, len) {
        
        res <- rep(val, len)
        res
        
    }
    
    
    # For loop example
    ex.for <- function(len) {
        for (i in 1:len) {
            print(i)
        }
    }
    
    # While loop example
    ex.while <- function(num) {
        i <- 0
        while (i < num) {
            print(i)
            i <- i + 1
        }
    }
    
# Question (iv)
    
    # Apply statement example
    m <- matrix(1:9, nrow=3)
    apply(m, MARGIN=2, sum) # sum column values
    apply(m, MARGIN=1, sum) # sum row values
    
    # Lapply statement example
    l <- list(A=matrix(1:9, nrow=3), B=1:5, C=matrix(1:4, nrow=2), D=2)
    lapply(l, sum)      # returns a list
    v <- c("Cheese", "Milk", "Yogurt")
    lapply(v, nchar)    # returns a list
    
    # Sapply statement example
    sapply(l, sum)      # returns a vector
    
    # Mapply statement example
    l1 <- list(A=matrix(1:16, 4), B=matrix(1:16, 2), C=1:5)
    l2 <- list(A=matrix(1:16, 4), B=matrix(1:16, 8), C=15:1)
    mapply(identical, l1, l2)
    
    ex.func <- function(x, y) {
        NROW(x) + NROW(y)
    }
    
    mapply(ex.func, l1, l2)
    
    
    # Aggregate statement example
    require(ggplot2)
    data(diamonds)
    aggregate(price ~ cut, diamonds, mean)
    aggregate(price ~ cut + color, diamonds, mean)
    aggregate(cbind(price, carat) ~ cut, diamonds, mean) 
    aggregate(cbind(price, carat) ~ cut + color, diamonds, mean)
    
# Question (v)
    
    q5.func <- function() {
        for (val in 1:50) {
            if (val %% 4 == 0 && val %% 6 == 0) {
                print("Egg and Ham")
            } else if (val %% 4 == 0) {
                print("Egg")
            } else if (val %% 6 == 0) {
                print("Ham")
            } else {
                print(val)
            }
        }
    }
    
# Question (vi)
    
    case <- read.table("lab_method_3.txt", header = TRUE) 
    case$method[30] <- "B" # First, fix the typo
    
    # Part (a)
    aggregate(results ~ method, case, mean)
    
    # Part (b)
    aggregate(results ~ lab, case, mean)
    
    # Part (c)
    aggregate(results ~ lab + method, case, mean)
    