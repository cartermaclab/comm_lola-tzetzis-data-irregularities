library(lsr)
library(cowplot)
library(ggplot2)
library(gridGraphics)
# set seed for reproducible results

set.seed(9293)

# specify number of simulations

iters <- 1000000


# save cohens d estimate from each simulation

d <- rep(NA, iters)

# run simulations

for (i in 1:iters) {
  
  x1 <- rnorm(20, mean=0, sd=1)
  x2 <- rnorm(20, mean=0.8, sd=1)
  res <- cohensD(x1, x2)
  d[i] <- res
  
}

round(max(d), digits = 2)

round(mean(d), digits = 2)

dres <- density(d)
a <- plot(dres,xlab = expression("Cohen's "*italic(d)), bty = "n", main= expression(italic('d') == .80))+
polygon(dres, col="blue", border="black")

p1_recorded <- recordPlot(a)

ggdraw(p1_recorded)

#### repeat with true effect of d = 3



# specify number of simulations

iters <- 1000000


# save cohens d estimate from each simulation

dmax <- rep(NA, iters)

# run simulations

for (i in 1:iters) {
  
  x1 <- rnorm(20, mean=0, sd=1)
  x2 <- rnorm(20, mean=3, sd=1)
  res <- cohensD(x1, x2)
  dmax[i] <- res
  
}

round(max(dmax), digits = 2)

round(mean(dmax), digits = 2)

round(min(dmax), digits = 2)

dmaxres <- density(dmax)
b <- plot(dmaxres,xlab = expression("Cohen's "*italic(d)), bty = "n", main= expression(italic('d') == 3.0))+
polygon(dmaxres, col="black", border="black")

p2_recorded <- recordPlot(b)

ggdraw(p2_recorded)



plot_grid(p1_recorded, p2_recorded, labels = c('A', 'B'), label_size = 12)
