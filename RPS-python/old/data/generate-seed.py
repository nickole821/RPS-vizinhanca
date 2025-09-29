# -*- coding: utf-8 -*-
"""
Created on Mon Jun  9 10:26:53 2025

@author: nicko
"""

import numpy as np
import os

# Número de sementes desejado
n_sementes = 100

# Cria diretório se não existir
os.makedirs("data", exist_ok=True)

# Gera sementes aleatórias (ex: inteiros entre 1 e 1 milhão)
sementes = np.random.randint(low=1, high=1_000_000, size=n_sementes)

# Salva em formato .npy
np.save("data/sementes_simulacao.npy", sementes)

print("Arquivo salvo como data/sementes_simulacao.npy")
