library(compute.es)
library(daff)
library(ggplot2)
library(tidyr)
library(scales)
library(RColorBrewer)
library(lemon)

## read in Brad's extraction for 2012 paper

bac12 <- read.csv("2012/data_Ac.csv")
brt12 <- read.csv("2012/data_RT.csv")


## read in Abbey's extraction for 2012 paper

aac12 <- read.csv("Abbey/data/2012/data_Ac.csv")

art12 <- read.csv("Abbey/data/2012/data_Rt.csv")

#### compare Brad and Abbey's extractions

# accuracy data

dif <- diff_data(bac12, aac12)

render_diff(dif)

##### Brad's extraction contained an error on explicit pre-test mean. Label Abbey's extraction "data_Ac'

data_Ac <- aac12

# response time data

dif2 <- diff_data(brt12, art12)

render_diff(dif2)

##### extractions match. Label Brad's data "data_Rt"

data_RT <- brt12

## 2012 paper accuracy effect size calculations

I_E <- mes(E_m, I_m, E_sd, I_sd, n, n, id = id, data = data_Ac)

I_E <- I_E$d

E_S <- mes(E_m, S_m, E_sd, S_sd, n, n, id = id, data = data_Ac)

E_S <- E_S$d

E_C <- mes(E_m, C_m, E_sd, C_sd, n, n, id = id, data = data_Ac)

E_C <- E_C$d

I_S <- mes(I_m, S_m, I_sd, S_sd, n, n, id = id, data = data_Ac)

I_S <- I_S$d

I_C <- mes(I_m, C_m, I_sd, C_sd, n, n, id = id, data = data_Ac)

I_C <- I_C$d

S_C <- mes(S_m, C_m, S_sd, C_sd, n, n, id = id, data = data_Ac)

S_C <- S_C$d

id <- data_Ac$id

#### create table of accuracy effect sizes for 2012 paper

accuracy_2012 <- cbind(I_E, E_S, E_C, I_S, I_C, S_C, id)
accuracy_2012 <- as.data.frame(accuracy_2012)


## 2012 paper RT effect size calculations


I_E <- mes(E_m, I_m, E_sd, I_sd, n, n, id = id, data = data_RT)

I_E<- I_E$d

E_S <- mes(E_m, S_m, E_sd, S_sd, n, n, id = id, data = data_RT)

E_S <- E_S$d

E_C <- mes(E_m, C_m, E_sd, C_sd, n, n, id = id, data = data_RT)

E_C <- E_C$d

I_S <- mes(I_m, S_m, I_sd, S_sd, n, n, id = id, data = data_RT)

I_S <- I_S$d

I_C <- mes(I_m, C_m, I_sd, C_sd, n, n, id = id, data = data_RT)

I_C <- I_C$d

S_C <- mes(S_m, C_m, S_sd, C_sd, n, n, id = id, data = data_RT)

S_C <- S_C$d

id <- data_RT$id

#### create table of RT effect sizes for 2012 paper

RT_2012 <- cbind(I_E, E_S, E_C, I_S, I_C, S_C, id)
RT_2012 <- as.data.frame(RT_2012)




##############


## read in Brad's extraction for 2014 paper

bac14 <- read.csv("2014/data_ac.csv")
brt14 <- read.csv("2014/data_rt.csv")

## read in Abbey's extraction for 2014 paper

aac14 <- read.csv("Abbey/data/2014/data_ac.csv")

art14 <- read.csv("Abbey/data/2014/data_rt.csv")

#### compare Brad and Abbey's extractions

# accuracy data

dif <- diff_data(bac14, aac14)

render_diff(dif)

##### extractions match. Label Brad's extraction "data_Ac"

data_Ac <- bac14

# response time data

dif2 <- diff_data(brt14, art14)

render_diff(dif2)

# Abbey's extraction contained an error on explicit mean at post test. Label Brad's extraction data_RT

data_RT <- brt14

### 2014 accuracy effect size calculations


A_I <- mes(I_m, A_m, I_sd, A_sd, n, n, id = id, data = data_Ac)

A_I <- A_I$d

I_E <- mes(I_m, E_m, I_sd, E_sd, n, n, id = id, data = data_Ac)

I_E<- I_E$d

I_C <- mes(I_m, C_m, I_sd, C_sd, n, n, id = id, data = data_Ac)

I_C <- I_C$d

E_A <- mes(A_m, E_m, A_sd, E_sd, n, n, id = id, data = data_Ac)

E_A <- E_A$d

A_C <- mes(A_m, C_m, A_sd, C_sd, n, n, id = id, data = data_Ac)

A_C <- A_C$d

E_C <- mes(E_m, C_m, E_sd, C_sd, n, n, id = id, data = data_Ac)

E_C <- E_C$d

id <- data_Ac$id

#### create table of accuracy effect sizes for 2014 paper

accuracy_2014 <- cbind(A_I, I_E, I_C, E_A, A_C, E_C, id)

accuracy_2014 <- as.data.frame(accuracy_2014)

### 2014 RT effect size calculations


A_I <- mes(I_m, A_m, I_sd, A_sd, n, n, id = id, data = data_RT)

A_I <- A_I$d

I_E <- mes(I_m, E_m, I_sd, E_sd, n, n, id = id, data = data_RT)

I_E<- I_E$d

I_C <- mes(I_m, C_m, I_sd, C_sd, n, n, id = id, data = data_RT)

I_C <- I_C$d

E_A <- mes(A_m, E_m, A_sd, E_sd, n, n, id = id, data = data_RT)

E_A <- E_A$d

A_C <- mes(A_m, C_m, A_sd, C_sd, n, n, id = id, data = data_RT)

A_C <- A_C$d

E_C <- mes(E_m, C_m, E_sd, C_sd, n, n, id = id, data = data_RT)

E_C <- E_C$d

id <- data_RT$id

#### create table of RT effect sizes for 2014 paper

RT_2014 <- cbind(A_I, I_E, I_C, E_A, A_C, E_C, id)

RT_2014 <- as.data.frame(RT_2014)



##############


## read in Brad's extraction for 2020 paper

bmp20 <- read.csv("2020/data_Mp.csv")
bse20 <- read.csv("2020/data_Se.csv")

## read in Abbey's extraction for 2020 paper

amp20 <- read.csv("Abbey/data/2020/data_Mp.csv")
ase20 <- read.csv("Abbey/data/2020/data_Se.csv")

#### compare Brad and Abbey's extractions

# motor performance data

dif <- diff_data(bmp20, amp20)

render_diff(dif)

##### extractions match. Label Brad's extraction "data_mp"

data_mp <- bmp20

# self-efficacy data

dif2 <- diff_data(bse20, ase20)

render_diff(dif2)

##### extractions match. Label Brad's extraction "data_se"

data_se <- bse20

### 2020 motor performance effect size calculations


E_A <- mes(E_m, A_m, E_sd, A_sd, n, n, id = id, data = data_mp)

E_A <- E_A$d

I_E <- mes(I_m, E_m, I_sd, E_sd, n, n, id = id, data = data_mp)

I_E<- I_E$d

E_C <- mes(E_m, C_m, E_sd, C_sd, n, n, id = id, data = data_mp)

E_C <- E_C$d

A_I <- mes(A_m, I_m, A_sd, I_sd, n, n, id = id, data = data_mp)

A_I <- A_I$d

A_C <- mes(A_m, C_m, A_sd, C_sd, n, n, id = id, data = data_mp)

A_C <- A_C$d

I_C <- mes(I_m, C_m, I_sd, C_sd, n, n, id = id, data = data_mp)

I_C <- I_C$d

id <- data_mp$id

#### create table of motor performance effect sizes for 2020 paper

motorperf_2020 <- cbind(E_A,I_E,E_C,A_I,A_C, I_C, id)

motorperf_2020 <- as.data.frame(motorperf_2020)

### 2020 self-efficacy effect size calculations


E_A <- mes(E_m, A_m, E_sd, A_sd, n, n, id = id, data = data_se)

E_A <- E_A$d

I_E <- mes(I_m, E_m, I_sd, E_sd, n, n, id = id, data = data_se)

I_E<- I_E$d

E_C <- mes(E_m, C_m, E_sd, C_sd, n, n, id = id, data = data_se)

E_C <- E_C$d

A_I <- mes(A_m, I_m, A_sd, I_sd, n, n, id = id, data = data_se)

A_I <- A_I$d

A_C <- mes(A_m, C_m, A_sd, C_sd, n, n, id = id, data = data_se)

A_C <- A_C$d

I_C <- mes(I_m, C_m, I_sd, C_sd, n, n, id = id, data = data_se)

I_C <- I_C$d

id <- data_se$id

#### create table of motor performance effect sizes for 2020 paper

selfefficacy_2020 <- cbind(E_A,I_E,E_C,A_I,A_C, I_C, id)

selfefficacy_2020 <- as.data.frame(selfefficacy_2020)

##### read in Brad's extraction for 2021 paper

bac21 <- read.csv("2021/data_Ac.csv")
bcs21 <- read.csv("2021/data_CSAI.csv")
bmac21 <- read.csv("2021/data_Mac.csv")
brt21 <- read.csv("2021/data_RT.csv")

## read in Abbey's extraction for 2021 paper

aac21 <- read.csv("Abbey/data/2021/data_Ac.csv")
acs21 <- read.csv("Abbey/data/2021/data_CSAI.csv")
amac21 <- read.csv("Abbey/data/2021/data_Mac.csv")
art21 <- read.csv("Abbey/data/2021/data_RT.csv")

#### compare Brad and Abbey's extractions

# accuracy data

dif <- diff_data(bac21, aac21)

render_diff(dif)

##### Brad's extraction contained an error on explicit stress test mean. Label Abbey's extraction "data_ac'

data_ac <- aac21

# CSAI data

dif2 <- diff_data(bcs21, acs21)

render_diff(dif2)

##### Extractions match. Label Abbey's extraction "data_cs"

data_cs <- acs21

# motor accuracy data

dif3 <- diff_data(bmac21, amac21)

render_diff(dif3)

##### Extractions match. Label Abbey's extraction "data_mac"

data_mac <- amac21

# RT data

dif4 <- diff_data(brt21, art21)

render_diff(dif4)

##### Extractions match. Label Abbey's extraction "data_rt"

data_rt <- art21

### 2021 accuracy effect size calculations


E_A <- mes(E_m, A_m, E_sd, A_sd, n, n, id = id, data = data_ac)

E_A <- E_A$d

I_E <- mes(I_m, E_m, I_sd, E_sd, n, n, id = id, data = data_ac)

I_E<- I_E$d

E_C <- mes(E_m, C_m, E_sd, C_sd, n, n, id = id, data = data_ac)

E_C <- E_C$d

A_I <- mes(A_m, I_m, A_sd, I_sd, n, n, id = id, data = data_ac)

A_I <- A_I$d

A_C <- mes(A_m, C_m, A_sd, C_sd, n, n, id = id, data = data_ac)

A_C <- A_C$d

I_C <- mes(I_m, C_m, I_sd, C_sd, n, n, id = id, data = data_ac)

I_C <- I_C$d

id <- data_ac$id

#### create table of accuracy effect sizes for 2021 paper

accuracy_2021 <- cbind(E_A,I_E,E_C,A_I,A_C, I_C, id)


accuracy_2021 <- as.data.frame(accuracy_2021)




### 2021 CSAI effect size calculations


E_A <- mes(E_m, A_m, E_sd, A_sd, n, n, id = id, data = data_cs)

E_A <- E_A$d

I_E <- mes(I_m, E_m, I_sd, E_sd, n, n, id = id, data = data_cs)

I_E<- I_E$d

E_C <- mes(E_m, C_m, E_sd, C_sd, n, n, id = id, data = data_cs)

E_C <- E_C$d

A_I <- mes(A_m, I_m, A_sd, I_sd, n, n, id = id, data = data_cs)

A_I <- A_I$d

A_C <- mes(A_m, C_m, A_sd, C_sd, n, n, id = id, data = data_cs)

A_C <- A_C$d

I_C <- mes(I_m, C_m, I_sd, C_sd, n, n, id = id, data = data_cs)

I_C <- I_C$d

id <- data_cs$id

#### create table of CSAI effect sizes for 2021 paper

CSAI_2021 <- cbind(E_A,I_E,E_C,A_I,A_C, I_C, id)

CSAI_2021 <- as.data.frame(CSAI_2021)


### 2021 motor accuracy effect size calculations


E_A <- mes(E_m, A_m, E_sd, A_sd, n, n, id = id, data = data_mac)

E_A <- E_A$d

I_E <- mes(I_m, E_m, I_sd, E_sd, n, n, id = id, data = data_mac)

I_E<- I_E$d

E_C <- mes(E_m, C_m, E_sd, C_sd, n, n, id = id, data = data_mac)

E_C <- E_C$d

A_I <- mes(A_m, I_m, A_sd, I_sd, n, n, id = id, data = data_mac)

A_I <- A_I$d

A_C <- mes(A_m, C_m, A_sd, C_sd, n, n, id = id, data = data_mac)

A_C <- A_C$d

I_C <- mes(I_m, C_m, I_sd, C_sd, n, n, id = id, data = data_mac)

I_C <- I_C$d

id <- data_mac$id

#### create table of CSAI effect sizes for 2021 paper

motoracc_2021 <- cbind(E_A,I_E,E_C,A_I,A_C, I_C, id)

motoracc_2021 <- as.data.frame(motoracc_2021)


### 2021 RT effect size calculations


E_A <- mes(E_m, A_m, E_sd, A_sd, n, n, id = id, data = data_rt)

E_A <- E_A$d

I_E <- mes(I_m, E_m, I_sd, E_sd, n, n, id = id, data = data_rt)

I_E<- I_E$d

E_C <- mes(E_m, C_m, E_sd, C_sd, n, n, id = id, data = data_rt)

E_C <- E_C$d

A_I <- mes(A_m, I_m, A_sd, I_sd, n, n, id = id, data = data_rt)

A_I <- A_I$d

A_C <- mes(A_m, C_m, A_sd, C_sd, n, n, id = id, data = data_rt)

A_C <- A_C$d

I_C <- mes(I_m, C_m, I_sd, C_sd, n, n, id = id, data = data_rt)

I_C <- I_C$d

id <- data_rt$id

#### create table of CSAI effect sizes for 2021 paper

RT_2021 <- cbind(E_A,I_E,E_C,A_I,A_C, I_C, id)

RT_2021 <- as.data.frame(RT_2021)

##### create table of effect sizes across studies

all_effects <- plyr::rbind.fill(RT_2021, RT_2014, RT_2012, accuracy_2021, accuracy_2014, accuracy_2012, motoracc_2021, motorperf_2020, selfefficacy_2020, CSAI_2021)

### create figure of effects

## reformat to long

all_long <- all_effects %>%
  pivot_longer(!id, names_to = "comparison", values_to = "d")

## make all d values positive

all_long$d <- abs(all_long$d)


## create plot



options(scipen = 999)



  ggplot(data = all_long, aes(x = id, y = d, color = comparison)) +
  labs(y = expression(bold("Cohen's ")*bolditalic(d)), x = "Timepoint", color = "Comparison")+
  theme(panel.border = element_blank(), axis.line = element_line(), axis.ticks = element_line(), panel.background = element_rect(fill = "white"))+
  scale_y_continuous(trans = "log10", breaks = c(.2, .5, .8, 3, 10, 100, 1000, 4000))+
  geom_jitter(width = .2)+
  annotate("rect", xmin = 0.8, xmax = 4.2, ymin = 0, ymax = 2.97,
           alpha = .2, fill = "#1B9E77")+
  annotate("rect", xmin = 0.8, xmax = 4.2, ymin = 1.36, ymax = 6.86, fill = "#7570B3",
           alpha = .2)+
  scale_x_continuous(breaks= c(1,2,3,4), labels=c("1" = "Pre-test", "2" = "Post-test",
                            "3" = "Retention", "4" = "Stress-test"))+
  scale_color_brewer(labels = c("Analogy-Control", "Analogy-Implicit", "Explicit-Analogy", "Explicit-Control",
                                "Explicit-Sequential", "Implicit-Control", "Implicit-Explicit", "Implicit-Sequential", "Sequential-Control"),
                     palette = "Set1")+
  theme(axis.title.x = element_text(face = "bold"))+
  theme(axis.title.y = element_text(face = "bold"))+
  theme(legend.title = element_text(face = "bold"))+
  coord_capped_cart(bottom = brackets_horizontal())+
  geom_hline(aes(yintercept=0.8), linetype = 'dashed')+
  annotate("text", x = 2.5, y = .5, label = "Cohen's benchmark\nfor a large effect")











