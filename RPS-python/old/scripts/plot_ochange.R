library(tidyverse)

setwd("C:/Unicamp/mestrado/simulacoes/RPS-python/RPS-python")

df_freq_1 <- read.csv("./output/o-change/zo1/p0.csv", header = T)
df_freq_1 <- mutate(df_freq_1, zo = 1, ratio = 1/8)

df_freq_2 <- read.csv("./output/o-change/zo2/p0.csv", header = T)
df_freq_2 <- mutate(df_freq_2, zo = 2, ratio = 2/8)

df_freq_3 <- read.csv("./output/o-change/zo3/p0.csv", header = T)
df_freq_3 <- mutate(df_freq_3, zo = 3, ratio = 3/8)

df_freq_4 <- read.csv("./output/o-change/zo4/p0.csv", header = T)
df_freq_4 <- mutate(df_freq_4, zo = 4, ratio = 4/8)

df_freq_5 <- read.csv("./output/o-change/zo5/p0.csv", header = T)
df_freq_5 <- mutate(df_freq_5, zo = 5, ratio = 5/8)

df_freq_6 <- read.csv("./output/o-change/zo6/p0.csv", header = T)
df_freq_6 <- mutate(df_freq_6, zo = 6, ratio = 6/8)

df_freq_7 <- read.csv("./output/o-change/zo7/p0.csv", header = T)
df_freq_7 <- mutate(df_freq_7, zo = 7, ratio = 7/8)

df_freq_8 <- read.csv("./output/o-change/zo8/p0.csv", header = T)
df_freq_8 <- mutate(df_freq_8, zo = 8, ratio = 8/8)

df_freq_9 <- read.csv("./output/o-change/zo9/p0.csv", header = T)
df_freq_9 <- mutate(df_freq_9, zo = 9, ratio = 9/8)

df_freq_10 <- read.csv("./output/o-change/zo10/p0.csv", header = T)
df_freq_10 <- mutate(df_freq_10, zo = 10, ratio = 10/8)

df_freq_11 <- read.csv("./output/o-change/zo11/p0.csv", header = T)
df_freq_11 <- mutate(df_freq_11, zo = 11, ratio = 11/8)

df_freq_12 <- read.csv("./output/o-change/zo12/p0.csv", header = T)
df_freq_12 <- mutate(df_freq_12, zo = 12, ratio = 12/8)

df_freq_13 <- read.csv("./output/o-change/zo13/p0.csv", header = T)
df_freq_13 <- mutate(df_freq_13, zo = 13, ratio = 13/8)

df_freq_14 <- read.csv("./output/o-change/zo14/p0.csv", header = T)
df_freq_14 <- mutate(df_freq_14, zo = 14, ratio = 14/8)

df_freq_15 <- read.csv("./output/o-change/zo15/p0.csv", header = T)
df_freq_15 <- mutate(df_freq_15, zo = 15, ratio = 15/8)

df_freq_16 <- read.csv("./output/o-change/zo16/p0.csv", header = T)
df_freq_16 <- mutate(df_freq_16, zo = 16, ratio = 16/8)

df_freq_17 <- read.csv("./output/o-change/zo17/p0.csv", header = T)
df_freq_17 <- mutate(df_freq_17, zo = 17, ratio = 17/8)

df_freq_18 <- read.csv("./output/o-change/zo18/p0.csv", header = T)
df_freq_18 <- mutate(df_freq_18, zo = 18, ratio = 18/8)

df_freq_19 <- read.csv("./output/o-change/zo19/p0.csv", header = T)
df_freq_19 <- mutate(df_freq_19, zo = 19, ratio = 19/8)

df_freq_20 <- read.csv("./output/o-change/zo20/p0.csv", header = T)
df_freq_20 <- mutate(df_freq_20, zo = 20, ratio = 20/8)

df_freq_21 <- read.csv("./output/o-change/zo21/p0.csv", header = T)
df_freq_21 <- mutate(df_freq_21, zo = 21, ratio = 21/8)

df_freq_22 <- read.csv("./output/o-change/zo22/p0.csv", header = T)
df_freq_22 <- mutate(df_freq_22, zo = 22, ratio = 22/8)

df_freq_23 <- read.csv("./output/o-change/zo23/p0.csv", header = T)
df_freq_23 <- mutate(df_freq_23, zo = 23, ratio = 23/8)

df_freq_24 <- read.csv("./output/o-change/zo24/p0.csv", header = T)
df_freq_24 <- mutate(df_freq_24, zo = 24, ratio = 24/8)

df_freq_25 <- read.csv("./output/o-change/zo25/p0.csv", header = T)
df_freq_25 <- mutate(df_freq_25, zo = 25, ratio = 25/8)

df_freq_26 <- read.csv("./output/o-change/zo26/p0.csv", header = T)
df_freq_26 <- mutate(df_freq_26, zo = 26, ratio = 26/8)

df_freq_27 <- read.csv("./output/o-change/zo27/p0.csv", header = T)
df_freq_27 <- mutate(df_freq_27, zo = 27, ratio = 27/8)

df_freq_28 <- read.csv("./output/o-change/zo28/p0.csv", header = T)
df_freq_28 <- mutate(df_freq_28, zo = 28, ratio = 28/8)

df_freq_29 <- read.csv("./output/o-change/zo29/p0.csv", header = T)
df_freq_29 <- mutate(df_freq_29, zo = 29, ratio = 29/8)

df_freq_30 <- read.csv("./output/o-change/zo30/p0.csv", header = T)
df_freq_30 <- mutate(df_freq_30, zo = 30, ratio = 30/8)

df_freq_31 <- read.csv("./output/o-change/zo31/p0.csv", header = T)
df_freq_31 <- mutate(df_freq_31, zo = 31, ratio = 31/8)

df_freq_32 <- read.csv("./output/o-change/zo32/p0.csv", header = T)
df_freq_32 <- mutate(df_freq_32, zo = 32, ratio = 32/8)

df_zo <- rbind(df_freq_1, df_freq_2, df_freq_3, df_freq_4, df_freq_5, df_freq_6,
               df_freq_7, df_freq_8, df_freq_9, df_freq_10, df_freq_11, df_freq_12,
               df_freq_13, df_freq_14, df_freq_15, df_freq_16, df_freq_17, df_freq_18,
               df_freq_19, df_freq_20, df_freq_21, df_freq_22, df_freq_23, df_freq_24,
               df_freq_25, df_freq_26, df_freq_27, df_freq_28, df_freq_29, df_freq_30,
               df_freq_31, df_freq_32)

df_zo <- pivot_longer(df_zo, cols = 2:4, names_to = "strategy", values_to = "freq")

str(df_zo)

df_media <- df_zo%>%
  group_by(Generation, strategy, zo, ratio) %>%
  summarise(freq_media = mean(freq), freq_sd = sd(freq), .groups = "drop")
df_media

write.csv(df_media,
          "./output/o-change/freq_mean_1-32.csv")

plot_freq_o <- df_media %>%
  filter(Generation == 200, strategy == "O") %>%
  ggplot(aes(x = ratio, y = freq_media)) +
  geom_line(size = 3, alpha = 1, color = "tomato2") +
  geom_point(size = 6, color = "black") +
  theme_minimal() +
  labs(x = "Razón: V(O)/V(Y)", y = "Frecuencia a largo plazo de O") +
  theme(text = element_text(size = 24))

ggsave(filename = "./output/o-change/figures/o-freq.pdf",
       plot = plot_freq_o, device = pdf, width = 30, height = 25, units = "cm")

ggsave(filename = "./output/o-change/figures/o-freq.png",
       plot = plot_freq_o, device = png, width = 30, height = 25, units = "cm")

plot_freq_all <- df_media %>%
  filter(Generation == 200) %>%
  ggplot(aes(x = zo, y = freq_media, color = as.factor(strategy))) +
  #geom_ribbon(aes(ymin = freq_media - freq_sd, ymax = freq_media + freq_sd, 
                  #fill = as.factor(strategy)), alpha = 0.6, color = NA) +
  geom_line(size = 3, alpha = 1) +
  geom_point(size = 6, color = "black") +
  theme_minimal() +
  scale_color_manual(values = c("O" = "tomato2", "Y" = "gold2", 
                                "B" = "blue"),
                     name = "Estrategia") +
  scale_fill_manual(values = c("O" = "tomato2", "Y" = "gold2", 
                               "B" = "blue")) +
  labs(x = "V(O)", y = "Frecuencia a largo plazo") +
  theme(text = element_text(size = 24)) +
  annotate(geom="text", x = 25, y = 0.5, label="V(B) = 4\nV(Y) = 8",
           color="black", size = 10) +
  guides(fill = "none")

ggsave(filename = "./output/o-change/figures/all-freq.pdf",
       plot = plot_freq_all, device = pdf, width = 35, height = 25, units = "cm")

ggsave(filename = "./output/o-change/figures/all-freq.png",
       plot = plot_freq_all, device = png, width = 35, height = 25, units = "cm")


df_zo %>%
  filter(zo == 32) %>%
  ggplot(aes(x = Generation, y = freq,  group = interaction(sim, strategy))) +
  geom_line(aes(color = as.factor(strategy))) +
  scale_color_manual(values = c("O" = "tomato2", "Y" = "gold2", "B" = "blue"),
                     name = "Estratégia", labels = c("Azul", "Laranja", "Amarelo"))


### fit

df_fit_1 <- read.csv("./output/o-change/zo1/fit_p0.csv", header = T)
df_fit_1 <- mutate(df_fit_1, zo = 1, ratio = 1/8)

df_fit_2 <- read.csv("./output/o-change/zo2/fit_p0.csv", header = T)
df_fit_2 <- mutate(df_fit_2, zo = 2, ratio = 2/8)

df_fit_3 <- read.csv("./output/o-change/zo3/fit_p0.csv", header = T)
df_fit_3 <- mutate(df_fit_3, zo = 3, ratio = 3/8)

df_fit_4 <- read.csv("./output/o-change/zo4/fit_p0.csv", header = T)
df_fit_4 <- mutate(df_fit_4, zo = 4, ratio = 4/8)

df_fit_5 <- read.csv("./output/o-change/zo5/fit_p0.csv", header = T)
df_fit_5 <- mutate(df_fit_5, zo = 5, ratio = 5/8)

df_fit_6 <- read.csv("./output/o-change/zo6/fit_p0.csv", header = T)
df_fit_6 <- mutate(df_fit_6, zo = 6, ratio = 6/8)

df_fit_7 <- read.csv("./output/o-change/zo7/fit_p0.csv", header = T)
df_fit_7 <- mutate(df_fit_7, zo = 7, ratio = 7/8)

df_fit_8 <- read.csv("./output/o-change/zo8/fit_p0.csv", header = T)
df_fit_8 <- mutate(df_fit_8, zo = 8, ratio = 8/8)

df_fit_9 <- read.csv("./output/o-change/zo9/fit_p0.csv", header = T)
df_fit_9 <- mutate(df_fit_9, zo = 9, ratio = 9/8)

df_fit_10 <- read.csv("./output/o-change/zo10/fit_p0.csv", header = T)
df_fit_10 <- mutate(df_fit_10, zo = 10, ratio = 10/8)

df_fit_11 <- read.csv("./output/o-change/zo11/fit_p0.csv", header = T)
df_fit_11 <- mutate(df_fit_11, zo = 11, ratio = 11/8)

df_fit_12 <- read.csv("./output/o-change/zo12/fit_p0.csv", header = T)
df_fit_12 <- mutate(df_fit_12, zo = 12, ratio = 12/8)

df_fit_13 <- read.csv("./output/o-change/zo13/fit_p0.csv", header = T)
df_fit_13 <- mutate(df_fit_13, zo = 13, ratio = 13/8)

df_fit_14 <- read.csv("./output/o-change/zo14/fit_p0.csv", header = T)
df_fit_14 <- mutate(df_fit_14, zo = 14, ratio = 14/8)

df_fit_15 <- read.csv("./output/o-change/zo15/fit_p0.csv", header = T)
df_fit_15 <- mutate(df_fit_15, zo = 15, ratio = 15/8)

df_fit_16 <- read.csv("./output/o-change/zo16/fit_p0.csv", header = T)
df_fit_16 <- mutate(df_fit_16, zo = 16, ratio = 16/8)

df_fit_17 <- read.csv("./output/o-change/zo17/fit_p0.csv", header = T)
df_fit_17 <- mutate(df_fit_17, zo = 17, ratio = 17/8)

df_fit_18 <- read.csv("./output/o-change/zo18/fit_p0.csv", header = T)
df_fit_18 <- mutate(df_fit_18, zo = 18, ratio = 18/8)

df_fit_19 <- read.csv("./output/o-change/zo19/fit_p0.csv", header = T)
df_fit_19 <- mutate(df_fit_19, zo = 19, ratio = 19/8)

df_fit_20 <- read.csv("./output/o-change/zo20/fit_p0.csv", header = T)
df_fit_20 <- mutate(df_fit_20, zo = 20, ratio = 20/8)

df_fit_21 <- read.csv("./output/o-change/zo21/fit_p0.csv", header = T)
df_fit_21 <- mutate(df_fit_21, zo = 21, ratio = 21/8)

df_fit_22 <- read.csv("./output/o-change/zo22/fit_p0.csv", header = T)
df_fit_22 <- mutate(df_fit_22, zo = 22, ratio = 22/8)

df_fit_23 <- read.csv("./output/o-change/zo23/fit_p0.csv", header = T)
df_fit_23 <- mutate(df_fit_23, zo = 23, ratio = 23/8)

df_fit_24 <- read.csv("./output/o-change/zo24/fit_p0.csv", header = T)
df_fit_24 <- mutate(df_fit_24, zo = 24, ratio = 24/8)

df_fit_25 <- read.csv("./output/o-change/zo25/fit_p0.csv", header = T)
df_fit_25 <- mutate(df_fit_25, zo = 25, ratio = 25/8)

df_fit_26 <- read.csv("./output/o-change/zo26/fit_p0.csv", header = T)
df_fit_26 <- mutate(df_fit_26, zo = 26, ratio = 26/8)

df_fit_27 <- read.csv("./output/o-change/zo27/fit_p0.csv", header = T)
df_fit_27 <- mutate(df_fit_27, zo = 27, ratio = 27/8)

df_fit_28 <- read.csv("./output/o-change/zo28/fit_p0.csv", header = T)
df_fit_28 <- mutate(df_fit_28, zo = 28, ratio = 28/8)

df_fit_29 <- read.csv("./output/o-change/zo29/fit_p0.csv", header = T)
df_fit_29 <- mutate(df_fit_29, zo = 29, ratio = 29/8)

df_fit_30 <- read.csv("./output/o-change/zo30/fit_p0.csv", header = T)
df_fit_30 <- mutate(df_fit_30, zo = 30, ratio = 30/8)

df_fit_31 <- read.csv("./output/o-change/zo31/fit_p0.csv", header = T)
df_fit_31 <- mutate(df_fit_31, zo = 31, ratio = 31/8)

df_fit_32 <- read.csv("./output/o-change/zo32/fit_p0.csv", header = T)
df_fit_32 <- mutate(df_fit_32, zo = 32, ratio = 32/8)

df_fit <- rbind(df_fit_1, df_fit_2, df_fit_3, df_fit_4, df_fit_5, df_fit_6,
                df_fit_7, df_fit_8, df_fit_9, df_fit_10, df_fit_11, df_fit_12,
                df_fit_13, df_fit_14, df_fit_15, df_fit_16, df_fit_17, df_fit_18,
                df_fit_19, df_fit_20, df_fit_21, df_fit_22, df_fit_23, df_fit_24,
                df_fit_25, df_fit_26, df_fit_27, df_fit_28, df_fit_29, df_fit_30,
                df_fit_31, df_fit_32)

df_fit <- pivot_longer(df_fit, cols = 2:5, names_to = "strategy", values_to = "fit")

str(df_fit)

df_media_fit <- df_fit %>%
  group_by(Generation, strategy, zo, ratio) %>%
  summarise(fit_media = mean(fit), fit_sd = sd(fit), .groups = "drop")
df_media_fit

write.csv(df_media_fit,
          "./output/o-change/fit_mean_1-32.csv")

plot_fit_all <- df_media_fit %>%
  filter(Generation == 200) %>%
  ggplot(aes(x = ratio, y = fit_media, color = as.factor(strategy))) +
  #geom_ribbon(aes(ymin = fit_media - fit_sd, ymax = fit_media + fit_sd, 
                  #fill = as.factor(strategy)), alpha = 0.6, color = NA) +
  geom_line(size = 3, alpha = 1) +
  geom_point(size = 6, color = "black") +
  theme_minimal() +
  labs(x = "Razón V(O)/V(Y)", y = "Fitness a largo plazo") +
  scale_color_manual(values = c("fit_O" = "tomato2", "fit_Y" = "gold2", 
                                "fit_B" = "blue", "fit_total" = "black"),
                     name = "Estrategia", 
                     labels = c("B", "O", "Total", "Y")) +
  scale_fill_manual(values = c("fit_O" = "tomato2", "fit_Y" = "gold2",
                               "fit_B" = "blue", "fit_total" = "black"))+
  theme(text = element_text(size = 24)) +
  guides(fill = "none")

ggsave(filename = "./output/o-change/figures/fit_all.pdf",
       plot = plot_fit_all, device = pdf, width = 30, height = 25, units = "cm")

ggsave(filename = "./output/o-change/figures/fit_all.png",
       plot = plot_fit_all, device = png, width = 30, height = 25, units = "cm")


plot_fit_o <- df_media_fit %>%
  filter(Generation == 200, strategy == "fit_O") %>%
  ggplot(aes(x = ratio, y = fit_media)) +
  geom_line(size = 3, alpha = 1, color = "tomato2") +
  geom_point(size = 6, color = "black") +
  theme_minimal() +
  labs(x = "Razón V(O)/V(Y)", y = "Fitness a largo plazo de O") +
  theme(text = element_text(size = 24)) +
  guides(fill = "none")

ggsave(filename = "./output/o-change/figures/fit_o.pdf",
       plot = plot_fit_o, device = pdf, width = 30, height = 25, units = "cm")

ggsave(filename = "./output/o-change/figures/fit_o.png",
       plot = plot_fit_o, device = png, width = 30, height = 25, units = "cm")

df_fit %>%
  filter(zo == 1) %>%
  ggplot(aes(x = Generation, y = fit,  group = interaction(sim, strategy))) +
  geom_line(aes(color = as.factor(strategy)))
scale_color_manual(values = c("O" = "tomato2", "Y" = "gold2", "B" = "blue"),
                   name = "Estratégia", labels = c("Azul", "Laranja", "Amarelo"))