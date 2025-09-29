library(tidyverse)

setwd("C:/Unicamp/mestrado/simulacoes/RPS-python/RPS-python")

df_freq_1 <- read.csv("./output/y-change/zy1/p0.csv", header = T)
df_freq_1 <- mutate(df_freq_1, zy = 1, ratio = 1/8)

df_freq_2 <- read.csv("./output/y-change/zy2/p0.csv", header = T)
df_freq_2 <- mutate(df_freq_2, zy = 2, ratio = 2/8)

df_freq_3 <- read.csv("./output/y-change/zy3/p0.csv", header = T)
df_freq_3 <- mutate(df_freq_3, zy = 3, ratio = 3/8)

df_freq_4 <- read.csv("./output/y-change/zy4/p0.csv", header = T)
df_freq_4 <- mutate(df_freq_4, zy = 4, ratio = 4/8)

df_freq_5 <- read.csv("./output/y-change/zy5/p0.csv", header = T)
df_freq_5 <- mutate(df_freq_5, zy = 5, ratio = 5/8)

df_freq_6 <- read.csv("./output/y-change/zy6/p0.csv", header = T)
df_freq_6 <- mutate(df_freq_6, zy = 6, ratio = 6/8)

df_freq_7 <- read.csv("./output/y-change/zy7/p0.csv", header = T)
df_freq_7 <- mutate(df_freq_7, zy = 7, ratio = 7/8)

df_freq_8 <- read.csv("./output/y-change/zy8/p0.csv", header = T)
df_freq_8 <- mutate(df_freq_8, zy = 8, ratio = 8/8)

df_freq_9 <- read.csv("./output/y-change/zy9/p0.csv", header = T)
df_freq_9 <- mutate(df_freq_9, zy = 9, ratio = 9/8)

df_freq_10 <- read.csv("./output/y-change/zy10/p0.csv", header = T)
df_freq_10 <- mutate(df_freq_10, zy = 10, ratio = 10/8)

df_freq_11 <- read.csv("./output/y-change/zy11/p0.csv", header = T)
df_freq_11 <- mutate(df_freq_11, zy = 11, ratio = 11/8)

df_freq_12 <- read.csv("./output/y-change/zy12/p0.csv", header = T)
df_freq_12 <- mutate(df_freq_12, zy = 12, ratio = 12/8)

df_freq_13 <- read.csv("./output/y-change/zy13/p0.csv", header = T)
df_freq_13 <- mutate(df_freq_13, zy = 13, ratio = 13/8)

df_freq_14 <- read.csv("./output/y-change/zy14/p0.csv", header = T)
df_freq_14 <- mutate(df_freq_14, zy = 14, ratio = 14/8)

df_freq_15 <- read.csv("./output/y-change/zy15/p0.csv", header = T)
df_freq_15 <- mutate(df_freq_15, zy = 15, ratio = 15/8)

df_freq_16 <- read.csv("./output/y-change/zy16/p0.csv", header = T)
df_freq_16 <- mutate(df_freq_16, zy = 16, ratio = 16/8)

df_freq_17 <- read.csv("./output/y-change/zy17/p0.csv", header = T)
df_freq_17 <- mutate(df_freq_17, zy = 17, ratio = 17/8)

df_freq_18 <- read.csv("./output/y-change/zy18/p0.csv", header = T)
df_freq_18 <- mutate(df_freq_18, zy = 18, ratio = 18/8)

df_freq_19 <- read.csv("./output/y-change/zy19/p0.csv", header = T)
df_freq_19 <- mutate(df_freq_19, zy = 19, ratio = 19/8)

df_freq_20 <- read.csv("./output/y-change/zy20/p0.csv", header = T)
df_freq_20 <- mutate(df_freq_20, zy = 20, ratio = 20/8)

df_freq_21 <- read.csv("./output/y-change/zy21/p0.csv", header = T)
df_freq_21 <- mutate(df_freq_21, zy = 21, ratio = 21/8)

df_freq_22 <- read.csv("./output/y-change/zy22/p0.csv", header = T)
df_freq_22 <- mutate(df_freq_22, zy = 22, ratio = 22/8)

df_freq_23 <- read.csv("./output/y-change/zy23/p0.csv", header = T)
df_freq_23 <- mutate(df_freq_23, zy = 23, ratio = 23/8)

df_freq_24 <- read.csv("./output/y-change/zy24/p0.csv", header = T)
df_freq_24 <- mutate(df_freq_24, zy = 24, ratio = 24/8)

df_freq_25 <- read.csv("./output/y-change/zy25/p0.csv", header = T)
df_freq_25 <- mutate(df_freq_25, zy = 25, ratio = 25/8)

df_freq_26 <- read.csv("./output/y-change/zy26/p0.csv", header = T)
df_freq_26 <- mutate(df_freq_26, zy = 26, ratio = 26/8)

df_freq_27 <- read.csv("./output/y-change/zy27/p0.csv", header = T)
df_freq_27 <- mutate(df_freq_27, zy = 27, ratio = 27/8)

df_freq_28 <- read.csv("./output/y-change/zy28/p0.csv", header = T)
df_freq_28 <- mutate(df_freq_28, zy = 28, ratio = 28/8)

df_freq_29 <- read.csv("./output/y-change/zy29/p0.csv", header = T)
df_freq_29 <- mutate(df_freq_29, zy = 29, ratio = 29/8)

df_freq_30 <- read.csv("./output/y-change/zy30/p0.csv", header = T)
df_freq_30 <- mutate(df_freq_30, zy = 30, ratio = 30/8)

df_freq_31 <- read.csv("./output/y-change/zy31/p0.csv", header = T)
df_freq_31 <- mutate(df_freq_31, zy = 31, ratio = 31/8)

df_freq_32 <- read.csv("./output/y-change/zy32/p0.csv", header = T)
df_freq_32 <- mutate(df_freq_32, zy = 32, ratio = 32/8)

df_zy <- rbind(df_freq_1, df_freq_2, df_freq_3, df_freq_4, df_freq_5, df_freq_6,
               df_freq_7, df_freq_8, df_freq_9, df_freq_10, df_freq_11, df_freq_12,
               df_freq_13, df_freq_14, df_freq_15, df_freq_16, df_freq_17, df_freq_18,
               df_freq_19, df_freq_20, df_freq_21, df_freq_22, df_freq_23, df_freq_24,
               df_freq_25, df_freq_26, df_freq_27, df_freq_28, df_freq_29, df_freq_30,
               df_freq_31, df_freq_32)

df_zy <- pivot_longer(df_zy, cols = 2:4, names_to = "strategy", values_to = "freq")

str(df_zy)

df_media <- df_zy%>%
  group_by(Generation, strategy, zy, ratio) %>%
  summarise(freq_media = mean(freq), freq_sd = sd(freq), .groups = "drop")
df_media

write.csv(df_media,
          "./output/y-change/freq_mean_1-32.csv")

plot_freq_y <- df_media %>%
  filter(Generation == 200, strategy == "Y") %>%
  ggplot(aes(x = ratio, y = freq_media)) +
  geom_line(size = 3, alpha = 1, color = "gold2") +
  geom_point(size = 6, color = "black") +
  theme_minimal() +
  labs(x = "Razón: V(Y)/V(O)", y = "Frecuencia a largo plazo de Y") +
  theme(text = element_text(size = 24))

ggsave(filename = "./output/y-change/figures/y-freq.pdf",
       plot = plot_freq_y, device = pdf, width = 30, height = 25, units = "cm")

ggsave(filename = "./output/y-change/figures/y-freq.png",
       plot = plot_freq_y, device = png, width = 30, height = 25, units = "cm")

plot_freq_all <- df_media %>%
  filter(Generation == 200) %>%
  ggplot(aes(x = zy, y = freq_media, color = as.factor(strategy))) +
  geom_ribbon(aes(ymin = freq_media - freq_sd, ymax = freq_media + freq_sd, 
                  fill = as.factor(strategy)), alpha = 0.6, color = NA) +
  geom_line(size = 3, alpha = 1) +
  geom_point(size = 6, color = "black") +
  theme_minimal() +
  scale_color_manual(values = c("O" = "tomato2", "Y" = "gold2", 
                                "B" = "blue"),
                     name = "Estratégia") +
  scale_fill_manual(values = c("O" = "tomato2", "Y" = "gold2", 
                               "B" = "blue")) +
  labs(x = "Z(Y)", y = "Frequência na geração 200") +
  theme(text = element_text(size = 24)) +
  annotate(geom="text", x = 25, y = 0.5, label="Z(B) = 4\nZ(O) = 8",
           color="black", size = 10) +
  guides(fill = "none")

ggsave(filename = "./output/y-change/figures/all-freq.pdf",
       plot = plot_freq_all, device = pdf, width = 35, height = 20, units = "cm")

ggsave(filename = "./output/y-change/figures/all-freq.png",
       plot = plot_freq_all, device = png, width = 35, height = 20, units = "cm")


df_zy %>%
  filter(zy == 30) %>%
  ggplot(aes(x = Generation, y = freq,  group = interaction(sim, strategy))) +
  geom_line(aes(color = as.factor(strategy))) +
  scale_color_manual(values = c("O" = "tomato2", "Y" = "gold2", "B" = "blue"),
                     name = "Estratégia", labels = c("Azul", "Laranja", "Amarelo"))

### fit

df_fit_1 <- read.csv("./output/y-change/zy1/fit_p0.csv", header = T)
df_fit_1 <- mutate(df_fit_1, zy = 1, ratio = 1/8)

df_fit_2 <- read.csv("./output/y-change/zy2/fit_p0.csv", header = T)
df_fit_2 <- mutate(df_fit_2, zy = 2, ratio = 2/8)

df_fit_3 <- read.csv("./output/y-change/zy3/fit_p0.csv", header = T)
df_fit_3 <- mutate(df_fit_3, zy = 3, ratio = 3/8)

df_fit_4 <- read.csv("./output/y-change/zy4/fit_p0.csv", header = T)
df_fit_4 <- mutate(df_fit_4, zy = 4, ratio = 4/8)

df_fit_5 <- read.csv("./output/y-change/zy5/fit_p0.csv", header = T)
df_fit_5 <- mutate(df_fit_5, zy = 5, ratio = 5/8)

df_fit_6 <- read.csv("./output/y-change/zy6/fit_p0.csv", header = T)
df_fit_6 <- mutate(df_fit_6, zy = 6, ratio = 6/8)

df_fit_7 <- read.csv("./output/y-change/zy7/fit_p0.csv", header = T)
df_fit_7 <- mutate(df_fit_7, zy = 7, ratio = 7/8)

df_fit_8 <- read.csv("./output/y-change/zy8/fit_p0.csv", header = T)
df_fit_8 <- mutate(df_fit_8, zy = 8, ratio = 8/8)

df_fit_9 <- read.csv("./output/y-change/zy9/fit_p0.csv", header = T)
df_fit_9 <- mutate(df_fit_9, zy = 9, ratio = 9/8)

df_fit_10 <- read.csv("./output/y-change/zy10/fit_p0.csv", header = T)
df_fit_10 <- mutate(df_fit_10, zy = 10, ratio = 10/8)

df_fit_11 <- read.csv("./output/y-change/zy11/fit_p0.csv", header = T)
df_fit_11 <- mutate(df_fit_11, zy = 11, ratio = 11/8)

df_fit_12 <- read.csv("./output/y-change/zy12/fit_p0.csv", header = T)
df_fit_12 <- mutate(df_fit_12, zy = 12, ratio = 12/8)

df_fit_13 <- read.csv("./output/y-change/zy13/fit_p0.csv", header = T)
df_fit_13 <- mutate(df_fit_13, zy = 13, ratio = 13/8)

df_fit_14 <- read.csv("./output/y-change/zy14/fit_p0.csv", header = T)
df_fit_14 <- mutate(df_fit_14, zy = 14, ratio = 14/8)

df_fit_15 <- read.csv("./output/y-change/zy15/fit_p0.csv", header = T)
df_fit_15 <- mutate(df_fit_15, zy = 15, ratio = 15/8)

df_fit_16 <- read.csv("./output/y-change/zy16/fit_p0.csv", header = T)
df_fit_16 <- mutate(df_fit_16, zy = 16, ratio = 16/8)

df_fit_17 <- read.csv("./output/y-change/zy17/fit_p0.csv", header = T)
df_fit_17 <- mutate(df_fit_17, zy = 17, ratio = 17/8)

df_fit_18 <- read.csv("./output/y-change/zy18/fit_p0.csv", header = T)
df_fit_18 <- mutate(df_fit_18, zy = 18, ratio = 18/8)

df_fit_19 <- read.csv("./output/y-change/zy19/fit_p0.csv", header = T)
df_fit_19 <- mutate(df_fit_19, zy = 19, ratio = 19/8)

df_fit_20 <- read.csv("./output/y-change/zy20/fit_p0.csv", header = T)
df_fit_20 <- mutate(df_fit_20, zy = 20, ratio = 20/8)

df_fit_21 <- read.csv("./output/y-change/zy21/fit_p0.csv", header = T)
df_fit_21 <- mutate(df_fit_21, zy = 21, ratio = 21/8)

df_fit_22 <- read.csv("./output/y-change/zy22/fit_p0.csv", header = T)
df_fit_22 <- mutate(df_fit_22, zy = 22, ratio = 22/8)

df_fit_23 <- read.csv("./output/y-change/zy23/fit_p0.csv", header = T)
df_fit_23 <- mutate(df_fit_23, zy = 23, ratio = 23/8)

df_fit_24 <- read.csv("./output/y-change/zy24/fit_p0.csv", header = T)
df_fit_24 <- mutate(df_fit_24, zy = 24, ratio = 24/8)

df_fit_25 <- read.csv("./output/y-change/zy25/fit_p0.csv", header = T)
df_fit_25 <- mutate(df_fit_25, zy = 25, ratio = 25/8)

df_fit_26 <- read.csv("./output/y-change/zy26/fit_p0.csv", header = T)
df_fit_26 <- mutate(df_fit_26, zy = 26, ratio = 26/8)

df_fit_27 <- read.csv("./output/y-change/zy27/fit_p0.csv", header = T)
df_fit_27 <- mutate(df_fit_27, zy = 27, ratio = 27/8)

df_fit_28 <- read.csv("./output/y-change/zy28/fit_p0.csv", header = T)
df_fit_28 <- mutate(df_fit_28, zy = 28, ratio = 28/8)

df_fit_29 <- read.csv("./output/y-change/zy29/fit_p0.csv", header = T)
df_fit_29 <- mutate(df_fit_29, zy = 29, ratio = 29/8)

df_fit_30 <- read.csv("./output/y-change/zy30/fit_p0.csv", header = T)
df_fit_30 <- mutate(df_fit_30, zy = 30, ratio = 30/8)

df_fit_31 <- read.csv("./output/y-change/zy31/fit_p0.csv", header = T)
df_fit_31 <- mutate(df_fit_31, zy = 31, ratio = 31/8)

df_fit_32 <- read.csv("./output/y-change/zy32/fit_p0.csv", header = T)
df_fit_32 <- mutate(df_fit_32, zy = 32, ratio = 32/8)

df_fit <- rbind(df_fit_1, df_fit_2, df_fit_3, df_fit_4, df_fit_5, df_fit_6,
               df_fit_7, df_fit_8, df_fit_9, df_fit_10, df_fit_11, df_fit_12,
               df_fit_13, df_fit_14, df_fit_15, df_fit_16, df_fit_17, df_fit_18,
               df_fit_19, df_fit_20, df_fit_21, df_fit_22, df_fit_23, df_fit_24,
               df_fit_25, df_fit_26, df_fit_27, df_fit_28, df_fit_29, df_fit_30,
               df_fit_31, df_fit_32)

df_fit <- pivot_longer(df_fit, cols = 2:5, names_to = "strategy", values_to = "fit")

str(df_fit)

df_media_fit <- df_fit %>%
  group_by(Generation, strategy, zy, ratio) %>%
  summarise(fit_media = mean(fit), fit_sd = sd(fit), .groups = "drop")
df_media_fit

write.csv(df_media_fit,
          "./output/y-change/fit_mean_1-32.csv")

plot_fit_all <- df_media_fit %>%
  filter(Generation == 200) %>%
  ggplot(aes(x = ratio, y = fit_media, color = as.factor(strategy))) +
  geom_ribbon(aes(ymin = fit_media - fit_sd, ymax = fit_media + fit_sd, 
                  fill = as.factor(strategy)), alpha = 0.6, color = NA) +
  geom_line(size = 3, alpha = 1) +
  geom_point(size = 6, color = "black") +
  theme_minimal() +
  labs(x = "Razón V(Y)/V(O)", y = "Fitness a largo plazo") +
  scale_color_manual(values = c("fit_O" = "tomato2", "fit_Y" = "gold2", 
                                "fit_B" = "blue", "fit_total" = "black"),
                     name = "Estrategia", 
                     labels = c("B", "O", "Total", "Y")) +
  scale_fill_manual(values = c("fit_O" = "tomato2", "fit_Y" = "gold2",
                               "fit_B" = "blue", "fit_total" = "black"))+
  theme(text = element_text(size = 24)) +
  guides(fill = "none")

ggsave(filename = "./output/y-change/figures/fit_all.pdf",
       plot = plot_fit_all, device = pdf, width = 30, height = 25, units = "cm")

ggsave(filename = "./output/y-change/figures/fit_all.png",
       plot = plot_fit_all, device = png, width = 30, height = 25, units = "cm")


plot_fit_y <- df_media_fit %>%
  filter(Generation == 200, strategy == "fit_Y") %>%
  ggplot(aes(x = ratio, y = fit_media)) +
  geom_line(size = 3, alpha = 1, color = "gold2") +
  geom_point(size = 6, color = "black") +
  theme_minimal() +
  labs(x = "Razón V(Y)/V(O)", y = "Fitness a largo plazo de Y") +
  theme(text = element_text(size = 24)) +
  guides(fill = "none")

ggsave(filename = "./output/y-change/figures/fit_y.pdf",
       plot = plot_fit_y, device = pdf, width = 30, height = 25, units = "cm")

ggsave(filename = "./output/y-change/figures/fit_y.png",
       plot = plot_fit_y, device = png, width = 30, height = 25, units = "cm")

df_fit %>%
  filter(zy == 1) %>%
  ggplot(aes(x = Generation, y = fit,  group = interaction(sim, strategy))) +
  geom_line(aes(color = as.factor(strategy)))
  scale_color_manual(values = c("O" = "tomato2", "Y" = "gold2", "B" = "blue"),
                     name = "Estratégia", labels = c("Azul", "Laranja", "Amarelo"))