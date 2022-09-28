# An R script for calculating Hill numbers by hand and comparing results to hillR

songs_data <- read.csv("https://raw.githubusercontent.com/eco-evo-thr-2022/05-simple-metrics/hill/song_plays.csv")


songs_sad <- songs_data$plays

# hillDiv <- (sum(over all species, relative abundance to the q power)) raised to (1 / 1-q)

q = 1 - 1E-5

songs_relabund <- songs_sad / sum(songs_sad)

songs_relabund_to_q <- songs_relabund ^ q

summed_relabund <- sum(songs_relabund_to_q)

summed_relabund_exp <- summed_relabund ^ (1 / (1 - q))

hillR::hill_taxa(songs_sad, q)


