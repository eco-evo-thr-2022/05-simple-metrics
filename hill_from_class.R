songs_data <- read.csv("https://raw.githubusercontent.com/eco-evo-thr-2022/05-simple-metrics/hill/song_plays.csv")

head(songs_data)

library(ggplot2)

ggplot(songs_data, aes(rank, plays)) +
  geom_line()

songs_sad <- songs_data$plays

# p_i is songs_sad
# where for each species p_i is the number of plays 

# q is the order of the hill number
# q cannot be exactly 1

q <- 2

# q can't be exactly 1
# to get Hill numbers as q gets close to 1 use:

# q = 1- 1E-5

# or equation 3b in Chao

songs_relabund <- songs_sad / sum(songs_sad)

sum(songs_relabund)

songs_relabund_to_q <- songs_relabund ^ q

summed_relabund <- sum(songs_relabund_to_q)

summed_relabund_exp <- summed_relabund ^ (1 / (1 - q))


install.packages("hillR")

library(hillR)

hillR::hill_taxa(songs_sad, q)

