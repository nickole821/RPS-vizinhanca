### plotting initial_freq ###

library(tidyverse)
library(purrr)

# Salvar as frequências como um data.frame só
path <- "./output/data/stochastic/diferent-neighborhood/basic/p05/"

files <- list.files(path, pattern = "^freq.*\\.csv$",
                    full.names = TRUE, recursive = TRUE)

print(files)

freq_list <- lapply(files, read.csv, sep = ",", stringsAsFactors = FALSE)
freq_list[[2]]

df_freq <- bind_rows(freq_list, .id = "id")
str(df_freq)
df_freq <- df_freq[,-2]
df_freq <- df_freq %>%
  pivot_longer(cols = 3:5, names_to = "strategy", values_to = "freq")
str(df_freq)
df_freq <- df_freq %>% 
  rename(sim = id)
str(df_freq)
df_freq <- df_freq %>% 
  mutate(prob = 0.5, freq_0_O = 1/3, freq_0_Y = 1/3, freq_0_B = 1/3, neighbors = "basic", devide = "FALSE")
str(df_freq)

write.csv(df_freq, "./output/data/stochastic/diferent-neighborhood/basic/p05.csv")

# remover as frequencias das pastas
path <- "./output/data/stochastic/diferent-neighborhood/basic/p025/"

files <- list.files(path, pattern = "^freq.*\\.csv$",
                    full.names = TRUE, recursive = TRUE)
print(files)

file.remove(files)

