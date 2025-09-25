# -*- coding: utf-8 -*-
"""
Created on Thu Jul  3 09:21:22 2025

@author: nicko
"""

import numpy as np
import pandas as pd
import os
import time
from tqdm import tqdm, trange
import matplotlib.pyplot as plt

def get_neighbors(i, j, position_matrix, x, reference_matrix=None):
    size = position_matrix.shape[0]
    if reference_matrix is None:
        reference_matrix = position_matrix

    cell_value = reference_matrix[i, j]
    
    final_neighbors_info = [] # Lista para armazenar (value, row, col)

    if cell_value == 'O':
        # Lógica para 'Y' permanece a mesma (vizinhança flexível baseada em x_target)
        # delta_map para 'O' e 'B' ainda é útil para calcular num_neighbors_O
        num_neighbors_Y = 8 # Vizinhos de Moore para 'O'para 'O'

        desired_zo = int(x * num_neighbors_Y)
        desired_zo = max(1, desired_zo) 
        
        all_potential_neighbors_info = []
        visited_coords = set() 
        
        max_search_delta = max(size // 2, 5) 
        current_delta = 1 
        
        while len(all_potential_neighbors_info) < desired_zo + 1 and current_delta <= max_search_delta:
            i_seq_current = (np.arange(i - current_delta, i + current_delta + 1) % size)
            j_seq_current = (np.arange(j - current_delta, j + current_delta + 1) % size)
            
            for r_raw in i_seq_current:
                for c_raw in j_seq_current:
                    r, c = r_raw % size, c_raw % size
                    
                    if r == i and c == j:
                        continue
                    
                    if (r, c) not in visited_coords:
                        visited_coords.add((r, c))
                        
                        dr = min(abs(r - i), size - abs(r - i))
                        dc = min(abs(c - j), size - abs(c - j))
                        distance = dr + dc 
                        
                        all_potential_neighbors_info.append((distance, r, c))
            
            current_delta += 1
            
        all_potential_neighbors_info.sort(key=lambda x: x[0]) 
        
        for k in range(min(desired_zo, len(all_potential_neighbors_info))):
            r, c = all_potential_neighbors_info[k][1], all_potential_neighbors_info[k][2]
            final_neighbors_info.append((position_matrix[r, c], r, c))
        
    elif cell_value == 'Y':
        # Vizinhança de Moore (delta = 1, todos os 8 vizinhos)
        delta_Y_moore = 1
        i_seq = (np.arange(i - delta_Y_moore, i + delta_Y_moore + 1) % size)
        j_seq = (np.arange(j - delta_Y_moore, j + delta_Y_moore + 1) % size)
        
        for r_raw in i_seq:
            for c_raw in j_seq:
                r, c = r_raw % size, c_raw % size
                if r == i and c == j:
                    continue
                final_neighbors_info.append((position_matrix[r, c], r, c))

    elif cell_value == 'B':
        # Vizinhança de Von Neumann (apenas cardinais, distância de Manhattan = 1)
        # Iteramos apenas sobre os vizinhos com distância de Manhattan igual a 1
        von_neumann_deltas = [(-1, 0), (1, 0), (0, -1), (0, 1)] # deltas para N, S, L, O
        
        for dr, dc in von_neumann_deltas:
            r, c = (i + dr) % size, (j + dc) % size
            final_neighbors_info.append((position_matrix[r, c], r, c))
            
    else: # Para qualquer outro valor na matriz (comportamento padrão)
        # Pode definir um delta padrão ou lidar com erro
        # Aqui, vou manter um delta=1 para exemplificar, ou você pode retornar uma lista vazia
        print("erro")

    return final_neighbors_info


def get_payoff(a1, a2, payoff_matrix, index_map):
    return payoff_matrix[index_map[a1], index_map[a2]]

def get_fitness_matrix(position_matrix, payoff_matrix, x):
    size = position_matrix.shape[0]
    fitness = np.zeros((size, size))
    
    # Este set armazenará pares de coordenadas normalizadas (menor_lin, menor_col, maior_lin, maior_col)
    # para garantir que cada par de interação seja processado apenas uma vez.
    processed_interactions = set() 
    
    index_map = {'O': 0, 'Y': 1, 'B': 2}

    for i in range(size):
        for j in range(size):
            s1_type = position_matrix[i, j]
            if s1_type not in ('O', 'Y', 'B'):
                continue

            # Obter a lista de vizinhos para a célula (i,j) COM BASE EM SEU PRÓPRIO RAIO
            # (valor do vizinho, linha do vizinho, coluna do vizinho)
            s1_neighbors_info = get_neighbors(i, j, position_matrix, x)
            
            for s2_type, ii, jj in s1_neighbors_info:
                # Normaliza o par de coordenadas para que (i,j)-(ii,jj) e (ii,jj)-(i,j) sejam o mesmo par.
                # Isso é crucial para que a interação seja processada uma única vez para o par.
                # Exemplo: (0,0)-(0,1) e (0,1)-(0,0) resultam na mesma chave.
                # Usa tuplas aninhadas para garantir ordem consistente.
                if (i, j) < (ii, jj):
                    pair_key = ((i, j), (ii, jj))
                else:
                    pair_key = ((ii, jj), (i, j))
                
                # Se este par já foi processado, pule para evitar duplicação de cálculo e adição ao fitness.
                if pair_key in processed_interactions:
                    continue
                
                # Marca o par como processado.
                processed_interactions.add(pair_key)
                
                # Calcula os payoffs para a interação entre s1_type e s2_type
                payoff1_to_s1 = get_payoff(s1_type, s2_type, payoff_matrix, index_map)
                payoff2_to_s2 = get_payoff(s2_type, s1_type, payoff_matrix, index_map) # Payoff que s2 recebe de s1

                # Adiciona o payoff ao fitness de AMBAS as células envolvidas.
                fitness[i, j] += payoff1_to_s1
                fitness[ii, jj] += payoff2_to_s2

    return fitness

def going_to_die(position_matrix, prob_reproduce):
    rand_mat = np.random.rand(*position_matrix.shape)
    return np.where(rand_mat > prob_reproduce, 'E', position_matrix)

def get_new_matrix(position_matrix, intermediate_matrix, fitness_matrix, x):
    size = position_matrix.shape[0]
    new_matrix = np.empty_like(position_matrix)

    for i in range(size):
        for j in range(size):
            # Se a célula é 'E' (Empty ou Evolver)
            if intermediate_matrix[i, j] == 'E':
        
                neighbors_info = get_neighbors(i, j, position_matrix, x)
                
                # Listas para armazenar as estratégias e os fitness DOS VIZINHOS
                current_neighbors_strategies = [position_matrix[i, j]]
                current_neighbors_fitness = [fitness_matrix[i, j]]

                # 2. Iterar sobre os vizinhos encontrados
                for neighbor_s_val, neighbor_r, neighbor_c in neighbors_info:
                    # Coletar a estratégia do vizinho
                    current_neighbors_strategies.append(neighbor_s_val)
                    # 3. Coletar o fitness do vizinho da fitness_matrix, usando as COORDENADAS do vizinho
                    current_neighbors_fitness.append(fitness_matrix[neighbor_r, neighbor_c])
                
                # Converter para arrays numpy para facilitar o uso de argmax
                current_neighbors_strategies = np.array(current_neighbors_strategies)
                current_neighbors_fitness = np.array(current_neighbors_fitness)

                if len(current_neighbors_fitness) > 0:
                    # 4. Encontrar o índice do vizinho com o maior fitness
                    best_neighbor_idx = np.argmax(current_neighbors_fitness)
                    # 5. A célula (i,j) adota a ESTRATÉGIA desse vizinho com maior fitness
                    new_matrix[i, j] = current_neighbors_strategies[best_neighbor_idx]
                else:
                    # Fallback caso não haja vizinhos (ex: grid 1x1 ou célula isolada)
                    new_matrix[i, j] = np.random.choice(['O', 'Y', 'B'])
                    print("erro")
                    # print("Erro: Célula 'E' sem vizinhos para copiar. Estratégia aleatória atribuída.")
            else:
                # Se a célula não é 'E', ela mantém sua estratégia atual
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
        fitness_matrix = get_fitness_matrix(position_matrix, payoff_matrix, x)
        intermediate_matrix = going_to_die(position_matrix, prob_reproduce)
        new_matrix = get_new_matrix(position_matrix, intermediate_matrix, fitness_matrix, x)

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



# Parâmetros ------------------------------------------------------------------
strategies = ['O', 'Y', 'B']
a = 2
b = 1/a
payoff_matrix = np.array([[1, b, a],
                          [a, 1, b],
                          [b, a, 1]])
n_sim = 1
size = 10
num_generations = 3
prob_reproduce = 0
num_viz_o = 1
x = num_viz_o/8

output_dir = "C:/Unicamp/mestrado/simulacoes/RPS-python/RPS-python/output/o-change/zo1/"
os.makedirs(output_dir, exist_ok=True)
seeds = np.load("data/sementes_simulacao.npy") if os.path.exists("data/sementes_simulacao.npy") else print("erro")

# Rodar simulações
start = time.time()
all_freqs, all_fits = [], []

for i in tqdm(range(n_sim), desc="Simulações"):
    np.random.seed(seeds[i])
    initial = np.random.choice(strategies, size=(size, size))
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

color_map = {
    'Y': 'gold',    # Usando 'orange' para o que era 'amarelo' antes, para melhor contraste
    'B': 'darkblue',
    'O': 'darkorange'       # Usando 'red' para o que era 'laranja' antes, para melhor contraste
}

# Definir as cores para o fitness, alinhando com as estratégias e adicionando o total
# Podemos usar cores mais escuras ou variantes para o fitness para diferenciar, se desejar
color_map_fitness = {
    'fit_O': 'darkorange', # Laranja escuro
    'fit_Y': 'gold',       # Amarelo ouro
    'fit_B': 'blue',   # Azul escuro
    'fit_total': 'black'   # Preto para o fitness total
}

# --- Geração dos gráficos ---

# Frequência média por geração
plt.figure(figsize=(12, 5))
for s in ["O", "Y", "B"]:
    # Usar a cor definida no color_map para cada estratégia
    plt.plot(mean_freq.index, mean_freq[s], label=f"Frequência {s}", color=color_map[s])
plt.title("Frequência média por geração")
plt.xlabel("Geração")
plt.ylabel("Frequência")
plt.legend()
plt.grid(True)
plt.tight_layout()
plt.savefig(os.path.join(output_dir, "frequencia_media.png"))
plt.show()

# Fitness médio por geração
plt.figure(figsize=(12, 5))
for s in ["fit_O", "fit_Y", "fit_B", "fit_total"]:
    # Usar a cor definida no color_map_fitness para cada item
    plt.plot(mean_fit.index, mean_fit[s], label=f"Fitness {s}", color=color_map_fitness[s])
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
