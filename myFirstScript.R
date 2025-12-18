
library(lubridate)

# sunset and twilight times from https://www.timeanddate.com/sun/uk/edinburgh?month=11&year=2025
data <- "Day,Time,Over,SS,CivTwiOver
251120,16:33,NA,15:56,16:40
251121,16:17,16:54,15:55,16:38
251125,16:34,NA,15:50,16:34
251127,16:09,NA,15:47,16:32
251202,15:50,NA,15:42,16:28
251205,15:55,NA,15:40,16:26
251215,16:23,16:33,15:38,16:25
251217,16:07,NA,15:38,16:25
251218,15:29,16:23,15:38,16:25"

table <- read.table(textConnection(data), sep=",", header=TRUE)


d <- ymd(table$Day)
tt <- hm(as.character(table$Time))
to <- hm(as.character(table$Over))
ts <- hm(as.character(table$SS))
twi <- hm(as.character(table$CivTwiOver))

plot(d, tt, ylim=c(55000, 65000))
points(d, to, col=2)
points(d, ts, col=3)
points(d, twi, col=4)
legend("topright", legend=c("Fest observed", "Fest over", "Sun Set", "CTwi"), col=1:4, pch=1)

ttn <- as.numeric(tt)
tsn <- as.numeric(ts)
summary(lm(ttn ~ tsn))
