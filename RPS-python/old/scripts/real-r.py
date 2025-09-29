# -*- coding: utf-8 -*-
"""
Created on Wed Jun 11 09:36:59 2025

@author: nicko
"""

import numpy as np
import pandas as pd
import os
import time
from tqdm import tqdm, trange
import matplotlib.pyplot as plt
import sys

def get_neighbors(i, j, position_matrix, reference_matrix=None):
    size = position_matrix.shape[0]
    if reference_matrix is None:
        reference_matrix = position_matrix

    cell_value = reference_matrix[i, j]
    delta_map = {'B': 2, 'O': 3, 'Y': 2}
    delta = delta_map.get(cell_value, 1)

    i_seq = (np.arange(i - delta, i + delta + 1) % size)
    j_seq = (np.arange(j - delta, j + delta + 1) % size)

    neighbors_info = []
    for ii in i_seq:
        for jj in j_seq:
            if ii == i and jj == j:
                continue
            neighbors_info.append((position_matrix[ii, jj], ii, jj))
    return neighbors_info


def get_payoff(a1, a2, payoff_matrix, index_map):
    return payoff_matrix[index_map[a1], index_map[a2]]

def get_fitness_matrix(position_matrix, payoff_matrix):
    size = position_matrix.shape[0]
    fitness = np.zeros((size, size))
    processed_pairs = set()
    
    index_map = {'O': 0, 'Y': 1, 'B': 2}
    delta_map = {'B': 2, 'O': 3, 'Y': 2}

    for i in range(size):
        for j in range(size):
            s1 = position_matrix[i, j]
            if s1 not in index_map:
                continue

            delta = delta_map.get(s1, 1)
            i_seq = (np.arange(i - delta, i + delta + 1) % size)
            j_seq = (np.arange(j - delta, j + delta + 1) % size)

            for ii in i_seq:
                for jj in j_seq:
                    if (ii == i and jj == j):
                        continue

                    s2 = position_matrix[ii, jj]
                    if s2 not in index_map:
                        continue

                    # Define par único
                    pair_key = tuple(sorted([(i, j), (ii, jj)]))
                    if pair_key in processed_pairs:
                        continue
                    processed_pairs.add(pair_key)

                    # Payoffs recíprocos
                    payoff1 = get_payoff(s1, s2, payoff_matrix, index_map)
                    payoff2 = get_payoff(s2, s1, payoff_matrix, index_map)

                    fitness[i, j] += payoff1
                    fitness[ii, jj] += payoff2

    return fitness

def going_to_die(position_matrix, prob_reproduce):
    rand_mat = np.random.rand(*position_matrix.shape)
    return np.where(rand_mat > prob_reproduce, 'E', position_matrix)

def get_new_matrix(position_matrix, intermediate_matrix, fitness_matrix):
    size = position_matrix.shape[0]
    new_matrix = np.empty_like(position_matrix)

    for i in range(size):
        for j in range(size):
            if intermediate_matrix[i, j] == 'E':
                neighbors_info = get_neighbors(i, j, position_matrix)

                # Inclui a célula atual
                current_strategies = [position_matrix[i, j]]
                current_fitness = [fitness_matrix[i, j]]

                for strategy, ii, jj in neighbors_info:
                    current_strategies.append(strategy)
                    current_fitness.append(fitness_matrix[ii, jj])
                if len(current_fitness) == len(current_strategies):
                    best_idx = np.argmax(current_fitness)
                    new_matrix[i, j] = current_strategies[best_idx]
                else:
                    print("Erro")
                    sys.exit() 
            else:
                new_matrix[i, j] = position_matrix[i, j]

    return new_matrix

def simulation(position_matrix, payoff_matrix, num_generations, prob_reproduce):
    size = position_matrix.shape[0]
    all_matrices = [position_matrix.copy()]

    freq = lambda mat: [np.sum(mat == s) / (size ** 2) for s in ['O', 'Y', 'B']]
    frequencies = []
    mean_fitness = []

    frequencies.append([0] + freq(position_matrix))
    mean_fitness.append([0, 0, 0, 0, 0])

    for g in trange(1, num_generations + 1, desc="Gerações", leave=False):
        fitness_matrix = get_fitness_matrix(position_matrix, payoff_matrix)
        intermediate_matrix = going_to_die(position_matrix, prob_reproduce)
        new_matrix = get_new_matrix(position_matrix, intermediate_matrix, fitness_matrix)

        position_matrix = new_matrix
        all_matrices.append(new_matrix.copy())

        f = freq(new_matrix)
        frequencies.append([g] + f)

        fit_O = fitness_matrix[position_matrix == 'O'].mean() if np.any(position_matrix == 'O') else 0
        fit_Y = fitness_matrix[position_matrix == 'Y'].mean() if np.any(position_matrix == 'Y') else 0
        fit_B = fitness_matrix[position_matrix == 'B'].mean() if np.any(position_matrix == 'B') else 0
        fit_total = fitness_matrix.mean()
        mean_fitness.append([g, fit_O, fit_Y, fit_B, fit_total])

    df_freq = pd.DataFrame(frequencies, columns=["Generation", "O", "Y", "B"])
    df_fit = pd.DataFrame(mean_fitness, columns=["Generation", "fit_O", "fit_Y", "fit_B", "fit_total"])
    return {"matrices": all_matrices, "frequencies": df_freq, "mean_fitness": df_fit}

# Parâmetros
strategies = ['O', 'Y', 'B']
fprob = [0.01, 0.495, 0.495]
a = 2
b = 1/a
payoff_matrix = np.array([[1, b, a],
                          [a, 1, b],
                          [b, a, 1]])
n_sim = 100
size = 100
num_generations = 200
prob_reproduce = 0
output_dir = "C:/Unicamp/mestrado/simulacoes/RPS-python/RPS-python/output/real-r/initial-freq/O001-Y0495-B0495/p0/"
os.makedirs(output_dir, exist_ok=True)
seeds = np.load("data/sementes_simulacao.npy") if os.path.exists("data/sementes_simulacao.npy") else np.random.randint(0, 100000, size=n_sim)

# Rodar simulações
start = time.time()
all_freqs, all_fits = [], []

for i in tqdm(range(n_sim), desc="Simulações"):
    np.random.seed(seeds[i])
    initial = np.random.choice(strategies, size=(size, size), p = fprob)
    result = simulation(initial, payoff_matrix, num_generations, prob_reproduce)

    f = result["frequencies"]
    f["sim"] = i + 1
    all_freqs.append(f)

    fit = result["mean_fitness"]
    fit["sim"] = i + 1
    all_fits.append(fit)

# Consolidar resultados
df_freq = pd.concat(all_freqs)
df_fit = pd.concat(all_fits)
df_freq.to_csv(os.path.join(output_dir, "p0.csv"), index=False)
df_fit.to_csv(os.path.join(output_dir, "fit_p0.csv"), index=False)

# Geração de gráficos
mean_freq = df_freq.groupby("Generation")[["O", "Y", "B"]].mean()
mean_fit = df_fit.groupby("Generation")[["fit_O", "fit_Y", "fit_B", "fit_total"]].mean()

plt.figure(figsize=(12, 5))
for s in ["O", "Y", "B"]:
    plt.plot(mean_freq.index, mean_freq[s], label=f"Frequência {s}")
plt.title("Frequência média por geração")
plt.xlabel("Geração")
plt.ylabel("Frequência")
plt.legend()
plt.grid(True)
plt.tight_layout()
plt.savefig(os.path.join(output_dir, "frequencia_media.png"))
plt.show()

plt.figure(figsize=(12, 5))
for s in ["fit_O", "fit_Y", "fit_B", "fit_total"]:
    plt.plot(mean_fit.index, mean_fit[s], label=f"Fitness {s}")
plt.title("Fitness médio por geração")
plt.xlabel("Geração")
plt.ylabel("Fitness")
plt.legend()
plt.grid(True)
plt.tight_layout()
plt.savefig(os.path.join(output_dir, "fitness_medio.png"))
plt.show()

print("Simulações e gráficos concluídos.")
print("Tempo total:", round(time.time() - start, 2), "segundos")
