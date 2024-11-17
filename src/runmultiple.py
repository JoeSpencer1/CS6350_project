import multiprocessing
from multiprocessing import Pool
import numpy as np
import nn
import os

def run_main(arg):
    nn.main(arg)

def run_processes(arguments):
    processes = []
    num_processes = len(arguments)
    for i in range(num_processes):        
        process = multiprocessing.Process(target=run_main, args=(arguments[i],))
        processes.append(process)

    for process in processes:
        process.start()
    for process in processes:
        process.join()
    with open('output.txt', 'a') as f:
        f.write('\n')

if __name__ == '__main__':
    run_processes(np.array([
        "pinn_one('Er', 'FEM_2D', ('FEM_2D'), 1)",
        "kan_one('Er', 'FEM_2D', ('FEM_2D'), 1)",
        "nn_one('Er', 'FEM_2D', ('FEM_2D'), 1)",
        "mfnn_three('Er', 'exp', 'exp', 1, ('FEM_3D'), 14, ('FEM_2D'), 100)"
        ]))