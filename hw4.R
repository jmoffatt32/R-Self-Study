require(plyr)
library(dplyr)
library(magrittr)
data(baseball)
data(diamonds)
dia <- as_tibble(diamonds)


# Part (i)
# --------

# Compute the number of Extra Base Hits using `with`
baseball$XBh <- with(baseball, (X2b + X3b + hr))

# slice
dia %>% slice(1:5)

# merge
first <- data.frame(id=c(1, 2, 3), val1=c(40, 50, 60))
second <- data.frame(id=c(1, 2, 3), val2=c(-37, 23, -14))
merged <- merge(x=first, y=second, by.x="id", by.y="id")

# join
joined <- join(x=first, y=second, by="id")

# select
dia %>% select(carat, price)

# filter
dia %>% filter(cut == 'Ideal')
dia %>% filter(cut == "Ideal" & color=="I")

# mutate  
dia %>% mutate(ratio=price/carat)
dia %<>% mutate(ratio=price/carat)

# rename
dia %>% rename(cost=price)

# summarize
dia %>% summarize(AvgPrice=mean(price))

# cbind 
school <- c("College", "High School", "Elementary")
age <- c("18-20", "14-18", "6-12")
numStudents <- c(10000, 1000, 100)
schools1 <- cbind(school, age, numStudents)

# rbind
schools2 <- data.frame(school=c("Pre School", "Middle School"),
                       age=c("3-6", "12-14"),
                       numStudents=c(50, 500)
                       )
schools <- rbind(schools1, schools2)

# group_by
dia %>% group_by(cut) %>% summarize(AvgPrice=mean(price), AvgCarat=mean(carat))

# do
topN <- function(x, N=5)
{
    x %>% arrange(desc(price)) %>% slice(1:N)
}

dia %>% group_by(cut) %>% do(topN(., N=2))


# Part (ii)
# ---------
housing <- read.csv("http://www.stat.cmu.edu/~cshalizi/ADAfaEPoV/data/calif_penn_2011.csv")
housing <- na.omit(housing) 
calif <- housing[housing$STATEFP == 6, ]

    # (a) Average of `median_house_value` column
    cali <-as_tibble(calif)
    cali %>% summarize(AvgPrice=mean(Median_house_value))
    
    # (b) Data Frame Showing select Columns
    cal <- cali %>% select(POPULATION, Median_house_value, Median_household_income)
    cal %<>% mutate(valToPop=Median_house_value / POPULATION)
    cal %<>% mutate(valToInc=Median_house_value / Median_household_income)

    # (c)
    cal %>% filter(Median_house_value < mean(Median_house_value))
    
# Part (iii)
# ----------
    
    # (a) Extract the name of the county in the GEO.display.label column
    install.packages('stringr', dependencies = TRUE)
    require(stringr)
    countylist <- str_split(string=calif$GEO.display.label, pattern = ",")
    countylistMatrix <- data.frame(Reduce(rbind, countylist))
    names(countylistMatrix) <- c("Tract", "County", "State")
    
    # (b) Create `newcalif` DataFrame which consists of the column "County"
    # from the `countylistMatrix` and the column "Median_house_value" from `calif`
    newcalif <- countylistMatrix %>% select(County)
    newcalif$Median_house_value <- calif$Median_house_value
    
    # (c) Find the AvgHousePrice for each county
    newcalif %>% group_by(County) %>% summarize(AvgHousePrice=mean(Median_house_value))

    # (d) Rearrange the data frame in part c such that it shows the top 8 county
    # with the highest value of AvgHousePrice in decreasing order.
    summary <- newcalif %>% group_by(County) %>% summarize(AvgHousePrice=mean(Median_house_value))
    summary %>% arrange(desc(AvgHousePrice))
    