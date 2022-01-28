# 01 Name 
print("Plotting Basics: Malaviya") 

# 02 Install Packages 
install.packages("FSA")
library(FSA)
install.packages("FSAdata")
library(FSAdata)
install.packages("magrittr")
library(magrittr)
install.packages("dplyr")
library(dplyr)
install.packages("plotrix") 
library(plotrix)
install.packages("ggpubr")
library(ggpubr)

# standard deviation, skew, kurtosis, outliers
install.packages("moments")
library(moments)
data("BullTroutRML2")
skewness(BullTroutRML2$fl)
skewness(BullTroutRML2$age)
kurtosis(BullTroutRML2$fl)
kurtosis(BullTroutRML2$age)

var(BullTroutRML2$age) #Variance 
var(BullTroutRML2$fl)

sd(BullTroutRML2$age) #Standard Deviation 
sd(BullTroutRML2$fl)

# 03 Load the file 
data("BullTroutRML2")

# 04 Display the 3 records 
print(head(BullTroutRML2, n=3))

# 05 Removing specifies records
lake_harrison = filter(BullTroutRML2, lake == 'Harrison') # Filter Applied

# 06 Displaying first & last 5 records 
 fisrt_five = head((lake_harrison),n=5)
 print(fisrt_five)
 last_five = tail((lake_harrison),n=5)
 print(last_five)
 
# 07-08 Structure & Summery 
 print(data.frame(lake_harrison))
 print(summary(lake_harrison))
 
# 09 Scatter Plot
 plot(x = lake_harrison$fl,
      y = lake_harrison$age,
      xlab = 'Fork Length (mm)',
      ylab = 'Age (yrs)',
      xlim = c(0,500),
      ylim = c(0,15),
      pch = 20,
      main = "Plot 1: Harrison Lake Trout" )
 par(new=TRUE)

# 10 “Age” Histogram
 hist(x = lake_harrison$age,
      xlab = 'Age (yrs)',
      ylab = 'Freqency',
      xlim = c(0,15),
      ylim = c(0,15),
      col = 'cadetblue',
      main = 'Plot 2: Harrison Fish Age Distribution',
      col.main = 'cadetblue' )
 par(new=TRUE)

# 11 An Overdense Plot
 plot(x = lake_harrison$fl,
      y = lake_harrison$age,
      xlab = 'Fork Length (mm)',
      ylab = 'Age (yrs)',
      xlim = c(0,500),
      ylim = c(0,15),
      main = 'Plot 3: Harrison Density Shaded by Era',
      pch = 19,
      col = rgb(0,(1:2)/2,0),
      )
 
 par(new=TRUE)
 
# 12 Creating new object "tmp"
 tmp = headtail((lake_harrison),n=3)
 print(tmp)

# 13 Displaying the “era” column (variable) in the new “tmp” object 
 print(tmp$era)
 
# 14  pchs vector
 pchs = c(3,4)
 pchs
 
# 15 cols vector 
 cols = c("red","grey60")

# 16 Converting tmp into numeric 
 class(tmp$era)
 as.numeric(tmp$era)

# 17 Initialization 
 cols[tmp$era]

# 18 Plot 4: Symbol & Color by Era
 plot(age ~ fl,
      data = lake_harrison,
      xlim = c(0,500),
      ylim = c(0,15),
      main = "Plot 4: Symbol & Color by Era",
      xlab = "Age (yrs)",
      ylab = "Fork Length (mm)",
      pch = pchs,
      col = cols)
 par(new=TRUE)
 
 # 19 Plot 5: Regression Overlay”.
 plot(age~fl,
      data = lake_harrison,
      main = 'Plot 5: Regression Overlay',
      xlab = "age(yrs)",
      ylab = "Fork length(mm)",
      xlim = c(0,500),
      ylim = c(0,15),
      pch = pchs,
      col = cols
      )
 abline(lm(lake_harrison$age~lake_harrison$fl),
        data=lake_harrison,col='red')
 
#20 Plot 6: Legend Overlay
 
 plot(age~fl,
      data = lake_harrison,
      main = 'Plot 6: Legend Overlay',
      xlim = c(0,500),
      ylim = c(0,15),
      xlab = "Age (yrs)",
      ylab = "Fork Length (mm)",
      pch = pchs,
      col = cols)
 
 abline(lm(lake_harrison$age ~ lake_harrison$fl),
        data=lake_harrison,col = 'green') 
 
  legend("topleft",
         legend = c('1977-80','1977-01'),
         col = c('red','blue'),
         pch = c(3,4)
         )
  

  
