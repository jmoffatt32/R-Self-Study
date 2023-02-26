# Video 2.4:
# ---------

    # Example 1
    x <- c(1, 2, 3)

    # Example 2
    x * 3
    x + 3
    x - 3
    x / 3
    x ^2

    # Example 3
    1:10
    10:1

    # Example 4
    x <- 1:10
    y <- -5:4
    x + y

    # Example 5
    x + c(1, 2)     # 2, 4, 4, 6, 6, 8, 8, 10, 10, 12
    x + c(1, 2, 3)  # 2, 4, 6, 5, 7, 9, 8, 10, 12, 11 (with warning)
    
    # Example 6
    any(x, y)
    all(x, y)

    # Example 7
    x[1]            # 1
    x[2]            # 2
    x[2:5]          # 2, 3, 4, 5
    x[c(1, 3, 7)]   # 1, 3, 7
    x[10]           # 10
    
    
# Video 2.5
# ---------
    
    # Example 1
    y <- c(-5:4, 8:10)
    mean(y)
    mean(y, trim = .3)
    
    # Example 2
    y <- c(-5:4, NA, 8:10)
    mean(y)
    mean(y, na.rm=TRUE)

# Video 3.1
# ---------
    
    # Example 1
    x <- 201:210
    y <- 5:14
    target <- c("Ice Cream", "Chicken Fingers", "Chocolate Cake", "Pizza", "Salmon", 
                "Apple Juice", "Onions", "Scrambled Eggs", "Jamba Juice", "Cookies")
    df <- data.frame(x, y, target)
    
    # Example 2
    df <- data.frame(Calories = x, Fats = y, Food = target)
    
    # Example 3
    df <- data.frame(Calories = x, Fats = y, Food = target, stringsAsFactors = FALSE)
    
    # Example 4
    nrow(df)
    ncol(df)
    dim(df)

    # Example 5
    rownames(df) <- c("One", "Two", "Three", "Four", "Five", 
                      "Six", "Seven", "Eight", "Nine", "Ten")
    rownames(df) <- NULL
    
    # Example 6
    head(df)
    head(df, n = 3)
    tail(df)
    tail(df, n=3)
    
    # Example 7
    df$Food
    df[3, 3]    
    df[3, 2:3]    
    df[3:5, 2]    
    df[1:10, 1:3]
    df[,3]
    df[,2:3]

    # Example 8    
    df[,3, drop=FALSE]

# Video 3.2
# ---------
    
    # Example 1
    l1 <- list(1, 2, 3)
    l2 <- list(c(1, 2, 3))
    l3 <- list(c(1, 2, 3), c(4, 5, 6))
    
    # Example 2
    df <- data.frame(Height = c(72, 63, 75, 68, 70), Weight= c(200, 125, 215, 150, 185), Gender=c("Boy", "Girl", "Boy", "Girl", "Boy"))
    l1 <- list(df, 1:5)

    # Example 3
    names(l1)
    names(l1) <- c("dataframe", "list")
    names(l1)
    
    # Example 4
    l2 <- vector(mode="list", length = 3)
    l2[[1]] <- 1
    l2[[2]] <- 2
    l2[[3]] <- 3
    
    # Example 5
    l1[[1]]$Gender
    l1[[1]][,3, drop=FALSE]
    
# Video 3.3
# ---------
    
    # Example 1
    A <- matrix(1:10, nrow=5)
    B <- matrix(21:40, nrow=2)
    
    # Example 2
    ncol(A)
    nrow(A)
    dim(A)
    
    # Example 3
    B <- matrix(21:30, nrow=5)
    A + B
    A * B

    # Example 4
    B <- t(B)   # Transpose B to make dot product dimensions work
    A %*% B
    A %*% t(B)  # ERROR since dimensions don't match
    
    # Example 5
    colnames(A) <- c("Left", "Right")
    rownames(A) <- c("One", "Two", "Three", "Four", "Five")
    
# Questions
# ---------
    
    case <- read.table("lab_method_2.txt", header = TRUE)
    
    # Part (a)
    # --------
    mean(case$results)

    # Part (b)
    case$residual <- case$results - mean(case$results)
    
    # Part (c)
    case$method[30] <- "B" # First, fix the typo
    new <- as.numeric(case$method == "B") + 1
    case$method <- new
    
    # Part (d)
    case <- case[,c("method", "lab", "residual", "results")]
    
    
    