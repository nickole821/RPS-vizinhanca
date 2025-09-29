library(tidyverse)

setwd("C:/Unicamp/mestrado/simulacoes/RPS-python/RPS-python/output/real-r/")

freq_real <- read.csv("./p0/p0.csv")
freq_real_Oinvading <- read.csv("./initial-freq/O001-Y0495-B0495/p0/p0.csv")
freq_real_Yinvading <- read.csv("./initial-freq/O0495-Y001-B0495/p0/p0.csv")
freq_real_Binvading <- read.csv("./initial-freq/O0495-Y0495-B001/p0/p0.csv")

### equal inital freq ----------------------------------------------------------

freq_real <- freq_real %>%
  pivot_longer(cols = 2:4, names_to = "strategy", values_to = "freq")
str(freq_real)

df_media <- freq_real %>%
  group_by(Generation, strategy) %>%
  summarise(freq_media = mean(freq), freq_sd = sd(freq), .groups = "drop")
df_media

write.csv(df_media,
          "./p0/freq_mean.csv")

ggplot(freq_real, aes(x = Generation, y = freq, color = as.factor(strategy),
                       group = interaction(sim, strategy))) +
  geom_line(size = 1, alpha = 1) +
  geom_line(data = df_media, aes(x = Generation, y = freq_media, 
                                 color = as.factor(strategy),
                                 group = strategy), 
            size = 1.5, linetype = "solid") +
  theme_minimal() +
  labs(x = "Gerações", y = "Frecuencia") +
  scale_color_manual(values = c("O" = "tomato2", "Y" = "gold2", "B" = "blue"),
                     name = "Estrategia", labels = c("Azul", "Laranja", "Amarelo")) +
  theme(text = element_text(size = 24)) +
  scale_y_continuous(lim = c(0,1))

plot_real <- ggplot(df_media, aes(x = Generation, y = freq_media, color = as.factor(strategy))) +
  geom_line(size = 3, alpha = 1) +
  geom_ribbon(aes(ymin = freq_media - freq_sd, ymax = freq_media + freq_sd, 
                  fill = as.factor(strategy)), alpha = 0.4, color = NA) +
  theme_minimal() +
  labs(x = "Gerações", y = "Frequência") +
  scale_color_manual(values = c("O" = "tomato2", "Y" = "gold2", "B" = "blue"),
                     name = "Estratégia") +
  scale_fill_manual(values = c("O" = "tomato2", "Y" = "gold2", "B" = "blue"))+
  scale_y_continuous(lim = c(0,1))+
  annotate(geom="text", x = 175, y = 0.5, label="Z(B) = 24\nZ(Y) = 24\nZ(O) = 48",
           color="black", size = 10) +
  theme(text = element_text(size = 24)) +
  guides(fill = "none", color = "none")

ggsave(filename = "./figures/freq_real.pdf",
       plot = plot_real, device = pdf, width = 35, height = 20, units = "cm")
ggsave(filename = "./figures/freq_real.png",
       plot = plot_real, device = png, width = 35, height = 20, units = "cm")

### invasion -------------------------------------------------------------------
### O invading
freq_real_Oinvading <- freq_real_Oinvading %>%
  pivot_longer(cols = 2:4, names_to = "strategy", values_to = "freq")
str(freq_real_Oinvading)

df_media_Oinvading <- freq_real_Oinvading %>%
  group_by(Generation, strategy) %>%
  summarise(freq_media = mean(freq), .groups = "drop")
df_media_Oinvading

write.csv(df_media_Oinvading,
          "./initial-freq/O001-Y0495-B0495/p0/freq_mean.csv")

freq_real_Oinvading %>%
  ggplot(aes(x = Generation, y = freq, color = as.factor(strategy),
             group = interaction(sim, strategy))) +
  geom_line(size = 1, alpha = 1) +
  geom_line(data = df_media_Oinvading, aes(x = Generation, y = freq_media, 
                                           color = as.factor(strategy),
                                           group = strategy), 
            size = 1.5, linetype = "solid") +
  theme_minimal() +
  labs(x = "Gerações", y = "Frecuencia") +
  scale_color_manual(values = c("O" = "tomato2", "Y" = "gold2", "B" = "blue"),
                     name = "Estrategia", labels = c("Azul", "Laranja", "Amarelo")) +
  theme(text = element_text(size = 24)) +
  scale_y_continuous(lim = c(0,1))

plot_real_O <- ggplot(df_media_Oinvading, aes(x = Generation, y = freq_media, color = as.factor(strategy))) +
  geom_line(size = 1, alpha = 1) +
  theme_minimal() +
  labs(x = "Generaciones", y = "Frecuencia") +
  scale_color_manual(values = c("O" = "tomato2", "Y" = "gold2", "B" = "blue"),
                     name = "Estrategia") +
  theme(text = element_text(size = 24)) +
  scale_y_continuous(lim = c(0,1))

### Y invading

freq_real_Yinvading <- freq_real_Yinvading %>%
  pivot_longer(cols = 2:4, names_to = "strategy", values_to = "freq")
str(freq_real_Yinvading)

df_media_Yinvading <- freq_real_Yinvading %>%
  group_by(Generation, strategy) %>%
  summarise(freq_media = mean(freq), .groups = "drop")
df_media_Yinvading

write.csv(df_media_Yinvading,
          "./initial-freq/O0495-Y001-B0495/p0/freq_mean.csv")

freq_real_Yinvading %>%
  ggplot(aes(x = Generation, y = freq, color = as.factor(strategy),
             group = interaction(sim, strategy))) +
  geom_line(size = 1, alpha = 1) +
  geom_line(data = df_media_Yinvading, aes(x = Generation, y = freq_media, 
                                           color = as.factor(strategy),
                                           group = strategy), 
            size = 1.5, linetype = "solid") +
  theme_minimal() +
  labs(x = "Gerações", y = "Frecuencia") +
  scale_color_manual(values = c("O" = "tomato2", "Y" = "gold2", "B" = "blue"),
                     name = "Estrategia", labels = c("Azul", "Laranja", "Amarelo")) +
  theme(text = element_text(size = 24)) +
  scale_y_continuous(lim = c(0,1))

plot_real_Y <- ggplot(df_media_Yinvading, aes(x = Generation, y = freq_media, color = as.factor(strategy))) +
  geom_line(size = 1, alpha = 1) +
  theme_minimal() +
  labs(x = "Generaciones", y = "Frecuencia") +
  scale_color_manual(values = c("O" = "tomato2", "Y" = "gold2", "B" = "blue"),
                     name = "Estrategia") +
  theme(text = element_text(size = 24)) +
  scale_y_continuous(lim = c(0,1))

### B invading

freq_real_Binvading <- freq_real_Binvading %>%
  pivot_longer(cols = 2:4, names_to = "strategy", values_to = "freq")
str(freq_real_Binvading)

df_media_Binvading <- freq_real_Binvading %>%
  group_by(Generation, strategy) %>%
  summarise(freq_media = mean(freq), .groups = "drop")
df_media_Binvading

write.csv(df_media_Binvading,
          "./initial-freq/O0495-Y0495-B001/p0/freq_mean.csv")

freq_real_Binvading %>%
  ggplot(aes(x = Generation, y = freq, color = as.factor(strategy),
             group = interaction(sim, strategy))) +
  geom_line(size = 1, alpha = 1) +
  geom_line(data = df_media_Binvading, aes(x = Generation, y = freq_media, 
                                           color = as.factor(strategy),
                                           group = strategy), 
            size = 1.5, linetype = "solid") +
  theme_minimal() +
  labs(x = "Gerações", y = "Frecuencia") +
  scale_color_manual(values = c("O" = "tomato2", "Y" = "gold2", "B" = "blue"),
                     name = "Estrategia", labels = c("Azul", "Laranja", "Amarelo")) +
  theme(text = element_text(size = 24)) +
  scale_y_continuous(lim = c(0,1))

plot_real_B <- ggplot(df_media_Binvading, aes(x = Generation, y = freq_media, color = as.factor(strategy))) +
  geom_line(size = 1, alpha = 1) +
  theme_minimal() +
  labs(x = "Generaciones", y = "Frecuencia") +
  scale_color_manual(values = c("O" = "tomato2", "Y" = "gold2", "B" = "blue"),
                     name = "Estrategia") +
  theme(text = element_text(size = 24)) +
  scale_y_continuous(lim = c(0,1))

# plot invasion

df_media_Binvading <- df_media_Binvading %>%
  mutate(invasion = "B")

df_media_Oinvading <- df_media_Oinvading %>%
  mutate(invasion = "O")

df_media_Yinvading <- df_media_Yinvading %>%
  mutate(invasion = "Y")

df_invasion <- rbind(df_media_Binvading, df_media_Yinvading, df_media_Oinvading)
df_invasion

plot_invasion <- ggplot(df_invasion, aes(x = Generation, y = freq_media, color = as.factor(strategy))) +
  geom_line(size = 1, alpha = 1) +
  theme_minimal() +
  labs(x = "Generaciones", y = "Frecuencia", title = "Invasión") +
  scale_color_manual(values = c("O" = "tomato2", "Y" = "gold2", "B" = "blue"),
                     name = "Estrategia") +
  theme(text = element_text(size = 24)) +
  scale_y_continuous(lim = c(0,1)) +
  facet_wrap(~as.factor(invasion))

ggsave(filename = "./figures/freq_real_invasion.pdf",
       plot = plot_invasion, device = pdf, width = 30, height = 25, units = "cm")
ggsave(filename = "./figures/freq_real_invasion.png",
       plot = plot_invasion, device = png, width = 30, height = 25, units = "cm")
