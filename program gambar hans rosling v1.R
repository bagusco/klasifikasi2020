lifeexp <- read.csv("D:/lifeexp.csv", header=TRUE)
gdp <- read.csv("D:/gdp.csv", header=TRUE)
pop <- read.csv("D:/pop.csv", header=TRUE)



for (i in c(1900, 1910, 1920, 1930, 1940, 1950:2000))
{
x <- paste0("X", i)
l <- lifeexp[[x]]
g <- gdp[[x]]
p <- pop[[x]]

plot(g, l, cex=log(p/2000000+3), log="x",
     xlim=c(300, 100000), ylim=c(20, 90),
     main = paste0("tahun ", x), 
     col=ifelse(pop$negara=="Indonesia", "red","cyan"),
     pch=ifelse(pop$negara=="Indonesia", 19,1))
}

for (i in c(1900, 1910, 1920, 1930, 1940, 1950:2000))
{
  x <- paste0("X", i)
  l <- lifeexp[[x]]
  g <- gdp[[x]]
  p <- pop[[x]]
  
  jpeg(paste0("D:/tahun",i,".jpg"))
  plot(g, l, cex=log(p/2000000+3), log="x",
       xlim=c(300, 100000), ylim=c(20, 90),
       col=ifelse(pop$negara=="Indonesia", "red",ifelse(pop$negara=="China","blue","cyan")),
       pch=ifelse(pop$negara=="Indonesia", 19,19))
  points (g, l, cex=log(p/2000000+3), 
       col="black",
       pch=1)
  text (20000, 35, i, cex = 9, col="sienna1")
  dev.off()
}

