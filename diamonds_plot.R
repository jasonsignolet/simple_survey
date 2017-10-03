library(ggplot2)

ggplot(diamonds, aes(cut, price)) +
  geom_violin() +
  scale_y_log10()
