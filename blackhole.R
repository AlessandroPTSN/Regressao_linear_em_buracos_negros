blackhole <- read.csv("data")
fit <- lm(logm~logv, data=blackhole)
plot(blackhole$logv,blackhole$logm, 
     main=paste("correlação=",round(cor(blackhole$logv,blackhole$logm),2)),
     ylab="Log da massa do buraco negro",
     xlab="Log da velocidade de dispersão"
)
abline(fit, col = "red")
fit
