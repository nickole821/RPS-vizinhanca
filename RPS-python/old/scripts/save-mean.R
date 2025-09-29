library(tidyverse)

setwd("C:/Unicamp/mestrado/simulacoes/RPS-python/RPS-python")

df_freq_0 <- read.csv("./output/basic/p0/p0.csv", header = T)
df_freq_0 <- mutate(df_freq_0, prob = 0, type = "basic")
df_freq_05 <- read.csv("./output/basic/p05/p05.csv", header = T)
df_freq_05 <- mutate(df_freq_05, prob = 0.5, type = "basic")

df_basic <- rbind(df_freq_0, df_freq_05)

df_basic <- pivot_longer(df_basic, cols = 2:4, names_to = "strategy", values_to = "freq")

str(df_basic)

#df_media_basic <- df_basic %>%
  #group_by(Generation, strategy, prob) %>%
  #summarise(freq_media = mean(freq), freq_sd = sd(freq), .groups = "drop")
#df_media_basic

df_freq_0 <- read.csv("./output/real-r/p0/p0.csv", header = T)
df_freq_0 <- mutate(df_freq_0, prob = 0, type = "real")
df_freq_05 <- read.csv("./output/real-r/p05/p05.csv", header = T)
df_freq_05 <- mutate(df_freq_05, prob = 0.5, type = "real")

df_real <- rbind(df_freq_0, df_freq_05)

df_real <- pivot_longer(df_real, cols = 2:4, names_to = "strategy", values_to = "freq")

str(df_real)

df_all <- rbind(df_basic, df_real)

df_media <- df_all %>%
  group_by(Generation, strategy, prob, type) %>%
  summarise(freq_media = mean(freq), freq_sd = sd(freq), .groups = "drop")
df_media

write.csv(df_media,
          "C:/Unicamp/mestrado/simulacoes/RPS-python/RPS-python/output/real-r/p0/freq_mean.csv")

plot_freq <- df_media %>%
    ggplot(aes(x = Generation, y = freq_media, color = as.factor(strategy))) +
    geom_ribbon(aes(ymin = freq_media - freq_sd, ymax = freq_media + freq_sd, 
                    fill = as.factor(strategy)), alpha = 0.6, color = NA) +
    geom_line(size = 1, alpha = 1) +
    theme_minimal() +
    labs(x = "Gerações", y = "Frequência") +
    scale_color_manual(values = c("O" = "tomato2", "Y" = "gold2", "B" = "blue"),
                       name = "Estratégia") +
    scale_fill_manual(values = c("O" = "tomato2", "Y" = "gold2", "B" = "blue"))+
    facet_wrap(~type + prob) +
    theme(text = element_text(size = 24))

ggsave(filename = "./output/basicreal.pdf",
       plot = plot_freq, device = pdf, width = 30, height = 25, units = "cm")

ggsave(filename = "./output/basicreal.jpeg",
       plot = plot_freq, device = jpeg, width = 30, height = 25, units = "cm")

### fit

df_fit_0 <- read.csv("./output/basic/p0/fit_p0.csv", header = T)
df_fit_0 <- mutate(df_fit_0, prob = 0, type = "basic")
df_fit_05 <- read.csv("./output/basic/p05/fit_p05.csv", header = T)
df_fit_05 <- mutate(df_fit_05, prob = 0.5, type = "basic")

df_fit_basic <- rbind(df_fit_0, df_fit_05)

df_fit_basic <- pivot_longer(df_fit_basic, cols = 2:5, names_to = "strategy", values_to = "fit")

str(df_fit_basic)

#df_media_basic <- df_basic %>%
#group_by(Generation, strategy, prob) %>%
#summarise(freq_media = mean(freq), freq_sd = sd(freq), .groups = "drop")
#df_media_basic

df_fit_0 <- read.csv("./output/real-r/p0/fit_p0.csv", header = T)
df_fit_0 <- mutate(df_fit_0, prob = 0, type = "real")
df_fit_05 <- read.csv("./output/real-r/p05/fit_p05.csv", header = T)
df_fit_05 <- mutate(df_fit_05, prob = 0.5, type = "real")

df_fit_real <- rbind(df_fit_0, df_fit_05)

df_fit_real <- pivot_longer(df_fit_real, cols = 2:5, names_to = "strategy", values_to = "fit")

str(df_fit_real)

df_fit_all <- rbind(df_fit_basic, df_fit_real)

df_fit_media <- df_fit_all %>%
  group_by(Generation, strategy, prob, type) %>%
  summarise(fit_media = mean(fit), fit_sd = sd(fit), .groups = "drop")
df_fit_media

write.csv(df_media,
          "./output/fit_mean_basicreal.csv")

plot_fit <- df_fit_media %>%
  ggplot(aes(x = Generation, y = fit_media, color = as.factor(strategy))) +
  geom_ribbon(aes(ymin = fit_media - fit_sd, ymax = fit_media + fit_sd, 
                  fill = as.factor(strategy)), alpha = 0.6, color = NA) +
  geom_line(size = 1, alpha = 1) +
  theme_minimal() +
  labs(x = "Gerações", y = "Fitness") +
  scale_color_manual(values = c("fit_O" = "tomato2", "fit_Y" = "gold2", 
                                "fit_B" = "blue", "fit_total" = "black"),
                     name = "Estratégia") +
  scale_fill_manual(values = c("fit_O" = "tomato2", "fit_Y" = "gold2",
                               "fit_B" = "blue", "fit_total" = "black"))+
  facet_wrap(~type + prob) +
  theme(text = element_text(size = 24))

ggsave(filename = "./output/fit_basicreal.pdf",
       plot = plot_fit, device = pdf, width = 30, height = 25, units = "cm")

ggsave(filename = "./output/fit_basicreal.jpeg",
       plot = plot_fit, device = jpeg, width = 30, height = 25, units = "cm")




ggplot(df_media, aes(x = Generation, y = fit_media,
                                      color = as.factor(strategy), group = strategy)) +
  geom_ribbon(aes(ymin = fit_media - fit_sd, ymax = fit_media + fit_sd, 
                  fill = as.factor(strategy)), alpha = 0.6, color = NA) +
  geom_line(size = 1) +  # Linha da média
  theme_minimal() +
  labs(x = "Gerações", y = "Frequência", title = "adaptative neighborhood, p = 0.25") +
  scale_color_manual(values = c("fit_O" = "tomato2", "fit_Y" = "gold2", 
                                "fit_B" = "blue", "fit_total" = "black"),
                     name = "Estratégia") +
  scale_fill_manual(values = c("fit_O" = "tomato2", "fit_Y" = "gold2",
                               "fit_B" = "blue", "fit_total" = "black"))+
  theme(text = element_text(size = 24))

ggsave(filename = "./output/data/stochastic/diferent-neighborhood/real-r/mean/mean_p025.pdf",
       plot = freq_mean_p025, device = pdf, width = 30, height = 25, units = "cm")




#####




df_fit_0 <- read.csv("C:/Unicamp/mestrado/simulacoes/RPS-python/RPS-python/output/real-r/p0/fit_p0.csv",
                     header = T)
df_fit_0 <- mutate(df_fit_0, prob = 0)
df_fit_05 <- read.csv("C:/Unicamp/mestrado/simulacoes/RPS-python/RPS-python/output/real-r/p05/fit_p05.csv",
                      header = T)
df_fit_05 <- mutate(df_fit_05, prob = 0.5)

df_fit <- rbind(df_fit_0, df_fit_05)

str(df_fit)

df_fit_basic <- pivot_longer(df_fit, cols = 2:5, names_to = "strategy", values_to = "fit")

df_media <- df_fit_basic %>%
  group_by(Generation, strategy, prob) %>%
  summarise(fit_media = mean(fit), fit_sd = sd(fit), .groups = "drop")
df_media

write.csv(df_media,
          "C:/Unicamp/mestrado/simulacoes/RPS-python/RPS-python/output/real-r/p0/fit_mean.csv")

