library(tidyverse)

setwd("C:/Unicamp/mestrado/simulacoes/RPS-spatial-model/")

df <- read.csv("./output/data/stochastic/regular-neighborhood/prob-reproduce/mean/mean_p0.csv",
               header = T)

plot_null <- df %>%
  ggplot(aes(x = Generation, y = freq_media, color = strategy)) +
  geom_line(size = 3, alpha = 1) +
  geom_ribbon(aes(ymin = freq_media - freq_sd, ymax = freq_media + freq_sd, 
                  fill = as.factor(strategy)), alpha = 0.4, color = NA) +
  labs(x = "", y = "Frequência") +
  theme_minimal() +
  scale_y_continuous(limits = c(0,1)) +
  scale_color_manual(values = c("O" = "tomato2", "Y" = "gold2", "B" = "blue"),
                     name = "Estratégia") +
  scale_fill_manual(values = c("O" = "tomato2", "Y" = "gold2", "B" = "blue"))+
  theme(text = element_text(size = 24)) +
  scale_x_continuous(limits = c(0,200)) +
  annotate(geom="text", x = 159, y = 0.75, label="Z(B) = 8\nZ(O) = 8\nZ(Y) = 8",
           color="black", size = 8) +
  guides(fill = "none", color = "none")
