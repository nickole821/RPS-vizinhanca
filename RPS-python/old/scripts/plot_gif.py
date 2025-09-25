import numpy as np
import matplotlib.pyplot as plt
import matplotlib.animation as animation
import os
import pandas as pd
import os
import time
from tqdm import tqdm, trange

# 📥 Carregar semente
seeds = np.load("data/sementes_simulacao.npy")
seed = seeds[0]  # Semente 1

# 🔧 Parâmetros
strategies = ['O', 'Y', 'B']
a = 2
b = 1 / a
payoff_matrix = np.array([[1, b, a],
                          [a, 1, b],
                          [b, a, 1]])
size = 100
num_generations = 200
prob_reproduce = 0
propO = 0.2

# 🌱 Rodar uma simulação
np.random.seed(seed)
initial = np.random.choice(strategies, size=(size, size))

result = simulation(initial, payoff_matrix, num_generations, prob_reproduce)
all_matrices = result["matrices"]

# 🎨 Mapeamento de cores ajustado
color_map = {
    'O': (1.0, 0.5, 0.0),   # Laranja
    'Y': (1.0, 1.0, 0.0),   # Amarelo
    'B': (0.0, 0.0, 1.0),   # Azul
    'E': (1.0, 1.0, 1.0)    # Branco (vazio)
}

def matrix_to_rgb(mat):
    rgb = np.zeros((mat.shape[0], mat.shape[1], 3))
    for key, color in color_map.items():
        rgb[mat == key] = color
    return rgb

# 🎥 Criar a animação com título funcional
fig, ax = plt.subplots(figsize=(6, 6))
plt.axis('off')
im = ax.imshow(matrix_to_rgb(all_matrices[0]))
title = ax.text(0.5, 1.05, '', transform=ax.transAxes, ha='center', fontsize=16)

def update(frame):
    im.set_array(matrix_to_rgb(all_matrices[frame]))
    title.set_text(f"Geração {frame}")
    return [im, title]

ani = animation.FuncAnimation(fig, update, frames=len(all_matrices), interval=200, blit=False)

# 💾 Salvar como GIF
output_dir = "output/gif/adap/"
os.makedirs(output_dir, exist_ok=True)
ani.save(os.path.join(output_dir, 'simulacao_p0_sim0.gif'), writer='pillow', fps=5)

plt.show()

import matplotlib.animation as animation
print(animation.writers.list())
