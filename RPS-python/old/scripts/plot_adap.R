library(tidyverse)

setwd("C:/Unicamp/mestrado/simulacoes/RPS-python/RPS-python/output/adaptative/")

freq_prop0 <- read.csv("./prop0/p0/p0.csv")
freq_prop0 <- mutate(freq_prop0, prop = 0)

freq_prop01 <- read.csv("./prop01/p0/p0.csv")
freq_prop01 <- mutate(freq_prop01, prop = 0.1)

freq_prop02 <- read.csv("./prop02/p0/p0.csv")
freq_prop02 <- mutate(freq_prop02, prop = 0.2)

freq_prop03 <- read.csv("./prop03/p0/p0.csv")
freq_prop03 <- mutate(freq_prop03, prop = 0.3)

freq_prop04 <- read.csv("./prop04/p0/p0.csv")
freq_prop04 <- mutate(freq_prop04, prop = 0.4)

freq_prop05 <- read.csv("./prop05/p0/p0.csv")
freq_prop05 <- mutate(freq_prop05, prop = 0.5)

freq_prop06 <- read.csv("./prop06/p0/p0.csv")
freq_prop06 <- mutate(freq_prop06, prop = 0.6)

freq_adap <- rbind(freq_prop0, freq_prop01, freq_prop02, freq_prop03,
                   freq_prop04, freq_prop05, freq_prop06)

freq_adap <- freq_adap %>%
  pivot_longer(cols = 2:4, names_to = "strategy", values_to = "freq")
str(freq_adap)

df_media <- freq_adap %>%
  group_by(Generation, strategy, prop) %>%
  summarise(freq_media = mean(freq), freq_sd = sd(freq), .groups = "drop")
df_media

plot_adap_02 <- df_media %>%
  filter(prop == 0.3) %>%
    ggplot(aes(x = Generation, y = freq_media, color = as.factor(strategy))) +
    geom_line(size = 3, alpha = 1) +
    geom_ribbon(aes(ymin = freq_media - freq_sd, ymax = freq_media + freq_sd,
                    fill = as.factor(strategy)), alpha = 0.4, color = NA) +
    theme_minimal() +
    labs(x = "Gerações", y = "") +
    scale_color_manual(values = c("O" = "tomato2", "Y" = "gold2", "B" = "blue"),
                       name = "Estratégia") +
    scale_fill_manual(values = c("O" = "tomato2", "Y" = "gold2", "B" = "blue"))+
    theme(text = element_text(size = 24)) +
    scale_y_continuous(lim = c(0,1)) +
    annotate(geom="text", x = 159, y = 0.75, label="Z(B) = 24\nZ(O) = 48\nZ(Y) = 24 se p(O) > 0.3\n caso contrário, Z(Y) = 48",
             color="black", size = 8) +
    guides(fill = "none", color = "none")
    #facet_wrap(~as.factor(prop), ncol = 2)

ggsave(filename = "./figures/freq_adap_02.pdf",
       plot = plot_adap_02, device = pdf, width = 35, height = 20, units = "cm")
ggsave(filename = "./figures/freq_adap_02.png",
       plot = plot_adap_02, device = png, width = 35, height = 20, units = "cm")

plot_adap <- df_media %>%
  ggplot(aes(x = Generation, y = freq_media, color = as.factor(strategy))) +
  geom_line(size = 3, alpha = 1) +
  theme_minimal() +
  labs(x = "Generaciones", y = "Frecuencia") +
  scale_color_manual(values = c("O" = "tomato2", "Y" = "gold2", "B" = "blue"),
                     name = "Estrategia") +
  theme(text = element_text(size = 24)) +
  scale_y_continuous(lim = c(0,1)) +
  facet_wrap(~as.factor(prop), ncol = 2)

ggsave(filename = "./figures/freq_adap.pdf",
       plot = plot_adap, device = pdf, width = 35, height = 20, units = "cm")
ggsave(filename = "./figures/freq_adap.png",
       plot = plot_adap, device = png, width = 35, height = 20, units = "cm")

