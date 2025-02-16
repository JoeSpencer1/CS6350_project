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
        "pinn_one('Er', ('Al7075', 'Al6061'), ('Ti-6Al-4V'), 0)",
        "pinn_one('Er', ('Al7075', 'Al6061'), ('Ti-6Al-4V'), 5)",
        "pinn_one('Er', ('Al7075', 'Al6061'), ('Ti-6Al-4V'), 10)",
        # "nn_one('Er', ('Al7075', 'Al6061'), ('Ti-6Al-4V'), 0)",
        # "nn_one('Er', ('Al7075', 'Al6061'), ('Ti-6Al-4V'), 10)",
        # "pinn_one('sy', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075'), 0)"
        ]))
    run_processes(np.array([
        "pinn_one('sy', ('Al7075', 'Al6061'), ('Ti-6Al-4V'), 0)",
        "pinn_one('sy', ('Al7075', 'Al6061'), ('Ti-6Al-4V'), 5)",
        "pinn_one('sy', ('Al7075', 'Al6061'), ('Ti-6Al-4V'), 10)",
        # "nn_one('Er', ('Al7075', 'Al6061'), ('Ti-6Al-4V'), 0)",
        # "nn_one('Er', ('Al7075', 'Al6061'), ('Ti-6Al-4V'), 10)",
        # "pinn_one('sy', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075'), 0)"
        ]))
    # run_processes(np.array([
    #     "nn_one('Er', 'FEM_2D', ('FEM_2D'), 0)",
    #     "nn_one('Er', 'FEM_2D', ('FEM_2D'), 1)",
    #     "nn_one('Er', 'FEM_2D', ('FEM_2D'), 2)",
    #     "nn_one('Er', 'FEM_2D', ('FEM_2D'), 3)",
    #     "nn_one('Er', 'FEM_2D', ('FEM_2D'), 4)",
    #     "nn_one('Er', 'FEM_2D', ('FEM_2D'), 5)",
    #     "nn_one('Er', 'FEM_2D', ('FEM_2D'), 8)",
    #     "nn_one('Er', 'FEM_2D', ('FEM_2D'), 10)",
    #     "nn_one('Er', 'FEM_2D', ('FEM_2D'), 20)",
    #     "nn_one('Er', 'FEM_2D', ('FEM_2D'), 50)"
    #     ]))
    # run_processes(np.array([
    #     "nn_one('sy', 'FEM_2D', ('FEM_2D'), 0)",
    #     "nn_one('sy', 'FEM_2D', ('FEM_2D'), 1)",
    #     "nn_one('sy', 'FEM_2D', ('FEM_2D'), 2)",
    #     "nn_one('sy', 'FEM_2D', ('FEM_2D'), 3)",
    #     "nn_one('sy', 'FEM_2D', ('FEM_2D'), 4)",
    #     "nn_one('sy', 'FEM_2D', ('FEM_2D'), 5)",
    #     "nn_one('sy', 'FEM_2D', ('FEM_2D'), 8)",
    #     "nn_one('sy', 'FEM_2D', ('FEM_2D'), 10)",
    #     "nn_one('sy', 'FEM_2D', ('FEM_2D'), 20)",
    #     "nn_one('sy', 'FEM_2D', ('FEM_2D'), 50)"
    #     ]))
    # run_processes(np.array([
    #     "pinn_one('Er', 'FEM_2D', ('FEM_2D'), 0)",
    #     "pinn_one('Er', 'FEM_2D', ('FEM_2D'), 1)",
    #     "pinn_one('Er', 'FEM_2D', ('FEM_2D'), 2)",
    #     "pinn_one('Er', 'FEM_2D', ('FEM_2D'), 3)",
    #     "pinn_one('Er', 'FEM_2D', ('FEM_2D'), 4)",
    #     "pinn_one('Er', 'FEM_2D', ('FEM_2D'), 5)",
    #     "pinn_one('Er', 'FEM_2D', ('FEM_2D'), 8)",
    #     "pinn_one('Er', 'FEM_2D', ('FEM_2D'), 10)",
    #     "pinn_one('Er', 'FEM_2D', ('FEM_2D'), 20)",
    #     "pinn_one('Er', 'FEM_2D', ('FEM_2D'), 50)"
    #     ]))
    # run_processes(np.array([
    #     "pinn_one('sy', 'FEM_2D', ('FEM_2D'), 0)",
    #     "pinn_one('sy', 'FEM_2D', ('FEM_2D'), 1)",
    #     "pinn_one('sy', 'FEM_2D', ('FEM_2D'), 2)",
    #     "pinn_one('sy', 'FEM_2D', ('FEM_2D'), 3)",
    #     "pinn_one('sy', 'FEM_2D', ('FEM_2D'), 4)",
    #     "pinn_one('sy', 'FEM_2D', ('FEM_2D'), 5)",
    #     "pinn_one('sy', 'FEM_2D', ('FEM_2D'), 8)",
    #     "pinn_one('sy', 'FEM_2D', ('FEM_2D'), 10)",
    #     "pinn_one('sy', 'FEM_2D', ('FEM_2D'), 20)",
    #     "pinn_one('sy', 'FEM_2D', ('FEM_2D'), 50)"
    #     ]))
    # run_processes(np.array([
    #     "nn_one('Er', '33TiAlTa', ('FEM_2D', 'FEM_3D'), 0)",
    #     "nn_one('Er', '33TiAlTa', ('FEM_2D', 'FEM_3D'), 1)",
    #     "nn_one('Er', '33TiAlTa', ('FEM_2D', 'FEM_3D'), 2)",
    #     "nn_one('Er', '33TiAlTa', ('FEM_2D', 'FEM_3D'), 3)",
    #     "nn_one('Er', '33TiAlTa', ('FEM_2D', 'FEM_3D'), 4)",
    #     "nn_one('Er', '33TiAlTa', ('FEM_2D', 'FEM_3D'), 5)",
    #     "nn_one('Er', '33TiAlTa', ('FEM_2D', 'FEM_3D'), 8)",
    #     "nn_one('Er', '33TiAlTa', ('FEM_2D', 'FEM_3D'), 10)",
    #     "nn_one('Er', '33TiAlTa', ('FEM_2D', 'FEM_3D'), 20)",
    #     "nn_one('Er', '33TiAlTa', ('FEM_2D', 'FEM_3D'), 50)"
    #     ]))
    # run_processes(np.array([
    #     "nn_one('sy', '33TiAlTa', ('FEM_2D', 'FEM_3D'), 0)",
    #     "nn_one('sy', '33TiAlTa', ('FEM_2D', 'FEM_3D'), 1)",
    #     "nn_one('sy', '33TiAlTa', ('FEM_2D', 'FEM_3D'), 2)",
    #     "nn_one('sy', '33TiAlTa', ('FEM_2D', 'FEM_3D'), 3)",
    #     "nn_one('sy', '33TiAlTa', ('FEM_2D', 'FEM_3D'), 4)",
    #     "nn_one('sy', '33TiAlTa', ('FEM_2D', 'FEM_3D'), 5)",
    #     "nn_one('sy', '33TiAlTa', ('FEM_2D', 'FEM_3D'), 8)",
    #     "nn_one('sy', '33TiAlTa', ('FEM_2D', 'FEM_3D'), 10)",
    #     "nn_one('sy', '33TiAlTa', ('FEM_2D', 'FEM_3D'), 20)",
    #     "nn_one('sy', '33TiAlTa', ('FEM_2D', 'FEM_3D'), 50)"
    #     ]))
    # run_processes(np.array([
    #     "pinn_one('Er', '33TiAlTa', ('FEM_2D', 'FEM_3D'), 0)",
    #     "pinn_one('Er', '33TiAlTa', ('FEM_2D', 'FEM_3D'), 1)",
    #     "pinn_one('Er', '33TiAlTa', ('FEM_2D', 'FEM_3D'), 2)",
    #     "pinn_one('Er', '33TiAlTa', ('FEM_2D', 'FEM_3D'), 3)",
    #     "pinn_one('Er', '33TiAlTa', ('FEM_2D', 'FEM_3D'), 4)",
    #     "pinn_one('Er', '33TiAlTa', ('FEM_2D', 'FEM_3D'), 5)",
    #     "pinn_one('Er', '33TiAlTa', ('FEM_2D', 'FEM_3D'), 8)",
    #     "pinn_one('Er', '33TiAlTa', ('FEM_2D', 'FEM_3D'), 10)",
    #     "pinn_one('Er', '33TiAlTa', ('FEM_2D', 'FEM_3D'), 20)",
    #     "pinn_one('Er', '33TiAlTa', ('FEM_2D', 'FEM_3D'), 50)"
    #     ]))
    # run_processes(np.array([
    #     "pinn_one('sy', '33TiAlTa', ('FEM_2D', 'FEM_3D'), 0)",
    #     "pinn_one('sy', '33TiAlTa', ('FEM_2D', 'FEM_3D'), 1)",
    #     "pinn_one('sy', '33TiAlTa', ('FEM_2D', 'FEM_3D'), 2)",
    #     "pinn_one('sy', '33TiAlTa', ('FEM_2D', 'FEM_3D'), 3)",
    #     "pinn_one('sy', '33TiAlTa', ('FEM_2D', 'FEM_3D'), 4)",
    #     "pinn_one('sy', '33TiAlTa', ('FEM_2D', 'FEM_3D'), 5)",
    #     "pinn_one('sy', '33TiAlTa', ('FEM_2D', 'FEM_3D'), 8)",
    #     "pinn_one('sy', '33TiAlTa', ('FEM_2D', 'FEM_3D'), 10)",
    #     "pinn_one('sy', '33TiAlTa', ('FEM_2D', 'FEM_3D'), 20)",
    #     "pinn_one('sy', '33TiAlTa', ('FEM_2D', 'FEM_3D'), 50)"
    #     ]))
    # run_processes(np.array([
    #     "nn_one('Er', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075'), 0)",
    #     "nn_one('Er', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075'), 1)",
    #     "nn_one('Er', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075'), 2)",
    #     "nn_one('Er', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075'), 3)",
    #     "nn_one('Er', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075'), 4)",
    #     "nn_one('Er', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075'), 5)",
    #     "nn_one('Er', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075'), 8)",
    #     "nn_one('Er', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075'), 10)",
    #     "nn_one('Er', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075'), 20)",
    #     "nn_one('Er', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075'), 50)"
    #     ]))
    # run_processes(np.array([
    #     "nn_one('sy', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075'), 0)",
    #     "nn_one('sy', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075'), 1)",
    #     "nn_one('sy', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075'), 2)",
    #     "nn_one('sy', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075'), 3)",
    #     "nn_one('sy', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075'), 4)",
    #     "nn_one('sy', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075'), 5)",
    #     "nn_one('sy', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075'), 8)",
    #     "nn_one('sy', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075'), 10)",
    #     "nn_one('sy', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075'), 20)",
    #     "nn_one('sy', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075'), 50)"
    #     ]))
    # run_processes(np.array([
    #     "pinn_one('Er', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075'), 0)",
    #     "pinn_one('Er', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075'), 1)",
    #     "pinn_one('Er', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075'), 2)",
    #     "pinn_one('Er', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075'), 3)",
    #     "pinn_one('Er', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075'), 4)",
    #     "pinn_one('Er', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075'), 5)",
    #     "pinn_one('Er', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075'), 8)",
    #     "pinn_one('Er', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075'), 10)",
    #     "pinn_one('Er', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075'), 20)",
    #     "pinn_one('Er', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075'), 50)"
    #     ]))
    # run_processes(np.array([
    #     "pinn_one('sy', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075'), 0)",
    #     "pinn_one('sy', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075'), 1)",
    #     "pinn_one('sy', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075'), 2)",
    #     "pinn_one('sy', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075'), 3)",
    #     "pinn_one('sy', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075'), 4)",
    #     "pinn_one('sy', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075'), 5)",
    #     "pinn_one('sy', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075'), 8)",
    #     "pinn_one('sy', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075'), 10)",
    #     "pinn_one('sy', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075'), 20)",
    #     "pinn_one('sy', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075'), 50)"
    #     ]))
    # run_processes(np.array([
    #     "mfnn_two('Er', '33TiAlTa', 'Ti-6Al-4V', 0, ('Al6061', 'Al7075'), 12)",
    #     "mfnn_two('Er', '33TiAlTa', 'Ti-6Al-4V', 1, ('Al6061', 'Al7075'), 12)",
    #     "mfnn_two('Er', '33TiAlTa', 'Ti-6Al-4V', 2, ('Al6061', 'Al7075'), 12)",
    #     "mfnn_two('Er', '33TiAlTa', 'Ti-6Al-4V', 3, ('Al6061', 'Al7075'), 12)",
    #     "mfnn_two('Er', '33TiAlTa', 'Ti-6Al-4V', 4, ('Al6061', 'Al7075'), 12)",
    #     "mfnn_two('Er', '33TiAlTa', 'Ti-6Al-4V', 5, ('Al6061', 'Al7075'), 12)",
    #     "mfnn_two('Er', '33TiAlTa', 'Ti-6Al-4V', 8, ('Al6061', 'Al7075'), 12)",
    #     "mfnn_two('Er', '33TiAlTa', 'Ti-6Al-4V', 10, ('Al6061', 'Al7075'), 12)",
    #     "mfnn_two('Er', '33TiAlTa', 'Ti-6Al-4V', 20, ('Al6061', 'Al7075'), 12)",
    #     "mfnn_two('Er', '33TiAlTa', 'Ti-6Al-4V', 50, ('Al6061', 'Al7075'), 12)"
    #     ]))
    # run_processes(np.array([
    #     "mfnn_two('sy', '33TiAlTa', 'Ti-6Al-4V', 0, ('Al6061', 'Al7075'), 12)",
    #     "mfnn_two('sy', '33TiAlTa', 'Ti-6Al-4V', 1, ('Al6061', 'Al7075'), 12)",
    #     "mfnn_two('sy', '33TiAlTa', 'Ti-6Al-4V', 2, ('Al6061', 'Al7075'), 12)",
    #     "mfnn_two('sy', '33TiAlTa', 'Ti-6Al-4V', 3, ('Al6061', 'Al7075'), 12)",
    #     "mfnn_two('sy', '33TiAlTa', 'Ti-6Al-4V', 4, ('Al6061', 'Al7075'), 12)",
    #     "mfnn_two('sy', '33TiAlTa', 'Ti-6Al-4V', 5, ('Al6061', 'Al7075'), 12)",
    #     "mfnn_two('sy', '33TiAlTa', 'Ti-6Al-4V', 8, ('Al6061', 'Al7075'), 12)",
    #     "mfnn_two('sy', '33TiAlTa', 'Ti-6Al-4V', 10, ('Al6061', 'Al7075'), 12)",
    #     "mfnn_two('sy', '33TiAlTa', 'Ti-6Al-4V', 20, ('Al6061', 'Al7075'), 12)",
    #     "mfnn_two('sy', '33TiAlTa', 'Ti-6Al-4V', 50, ('Al6061', 'Al7075'), 12)"
    #     ]))
    # run_processes(np.array([
    #     "nn_one('Er', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075', 'FEM_3D', 'FEM_2D'), 0)",
    #     "nn_one('Er', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075', 'FEM_3D', 'FEM_2D'), 1)",
    #     "nn_one('Er', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075', 'FEM_3D', 'FEM_2D'), 2)",
    #     "nn_one('Er', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075', 'FEM_3D', 'FEM_2D'), 3)",
    #     "nn_one('Er', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075', 'FEM_3D', 'FEM_2D'), 4)",
    #     "nn_one('Er', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075', 'FEM_3D', 'FEM_2D'), 5)",
    #     "nn_one('Er', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075', 'FEM_3D', 'FEM_2D'), 8)",
    #     "nn_one('Er', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075', 'FEM_3D', 'FEM_2D'), 10)",
    #     "nn_one('Er', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075', 'FEM_3D', 'FEM_2D'), 20)",
    #     "nn_one('Er', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075', 'FEM_3D', 'FEM_2D'), 50)"
    #     ]))
    # run_processes(np.array([
    #     "nn_one('sy', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075', 'FEM_3D', 'FEM_2D'), 0)",
    #     "nn_one('sy', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075', 'FEM_3D', 'FEM_2D'), 1)",
    #     "nn_one('sy', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075', 'FEM_3D', 'FEM_2D'), 2)",
    #     "nn_one('sy', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075', 'FEM_3D', 'FEM_2D'), 3)",
    #     "nn_one('sy', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075', 'FEM_3D', 'FEM_2D'), 4)",
    #     "nn_one('sy', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075', 'FEM_3D', 'FEM_2D'), 5)",
    #     "nn_one('sy', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075', 'FEM_3D', 'FEM_2D'), 8)",
    #     "nn_one('sy', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075', 'FEM_3D', 'FEM_2D'), 10)",
    #     "nn_one('sy', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075', 'FEM_3D', 'FEM_2D'), 20)",
    #     "nn_one('sy', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075', 'FEM_3D', 'FEM_2D'), 50)"
    #     ]))
    # run_processes(np.array([
    #     "pinn_one('Er', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075', 'FEM_3D', 'FEM_2D'), 0)",
    #     "pinn_one('Er', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075', 'FEM_3D', 'FEM_2D'), 1)",
    #     "pinn_one('Er', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075', 'FEM_3D', 'FEM_2D'), 2)",
    #     "pinn_one('Er', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075', 'FEM_3D', 'FEM_2D'), 3)",
    #     "pinn_one('Er', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075', 'FEM_3D', 'FEM_2D'), 4)",
    #     "pinn_one('Er', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075', 'FEM_3D', 'FEM_2D'), 5)",
    #     "pinn_one('Er', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075', 'FEM_3D', 'FEM_2D'), 8)",
    #     "pinn_one('Er', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075', 'FEM_3D', 'FEM_2D'), 10)",
    #     "pinn_one('Er', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075', 'FEM_3D', 'FEM_2D'), 20)",
    #     "pinn_one('Er', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075', 'FEM_3D', 'FEM_2D'), 50)"
    #     ]))
    # run_processes(np.array([
    #     "pinn_one('sy', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075', 'FEM_3D', 'FEM_2D'), 0)",
    #     "pinn_one('sy', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075', 'FEM_3D', 'FEM_2D'), 1)",
    #     "pinn_one('sy', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075', 'FEM_3D', 'FEM_2D'), 2)",
    #     "pinn_one('sy', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075', 'FEM_3D', 'FEM_2D'), 3)",
    #     "pinn_one('sy', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075', 'FEM_3D', 'FEM_2D'), 4)",
    #     "pinn_one('sy', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075', 'FEM_3D', 'FEM_2D'), 5)",
    #     "pinn_one('sy', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075', 'FEM_3D', 'FEM_2D'), 8)",
    #     "pinn_one('sy', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075', 'FEM_3D', 'FEM_2D'), 10)",
    #     "pinn_one('sy', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075', 'FEM_3D', 'FEM_2D'), 20)",
    #     "pinn_one('sy', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075', 'FEM_3D', 'FEM_2D'), 50)"
    #     ]))
    # run_processes(np.array([
    #     "mfnn_three('Er', '33TiAlTa', 'Ti-6Al-4V', 0, ('Al6061', 'Al7075'), 12, ('FEM_3D', 'FEM_2D'), 114)",
    #     "mfnn_three('Er', '33TiAlTa', 'Ti-6Al-4V', 1, ('Al6061', 'Al7075'), 12, ('FEM_3D', 'FEM_2D'), 114)",
    #     "mfnn_three('Er', '33TiAlTa', 'Ti-6Al-4V', 2, ('Al6061', 'Al7075'), 12, ('FEM_3D', 'FEM_2D'), 114)",
    #     "mfnn_three('Er', '33TiAlTa', 'Ti-6Al-4V', 3, ('Al6061', 'Al7075'), 12, ('FEM_3D', 'FEM_2D'), 114)",
    #     "mfnn_three('Er', '33TiAlTa', 'Ti-6Al-4V', 4, ('Al6061', 'Al7075'), 12, ('FEM_3D', 'FEM_2D'), 114)",
    #     "mfnn_three('Er', '33TiAlTa', 'Ti-6Al-4V', 5, ('Al6061', 'Al7075'), 12, ('FEM_3D', 'FEM_2D'), 114)",
    #     "mfnn_three('Er', '33TiAlTa', 'Ti-6Al-4V', 8, ('Al6061', 'Al7075'), 12, ('FEM_3D', 'FEM_2D'), 114)",
    #     "mfnn_three('Er', '33TiAlTa', 'Ti-6Al-4V', 10, ('Al6061', 'Al7075'), 12, ('FEM_3D', 'FEM_2D'), 114)",
    #     "mfnn_three('Er', '33TiAlTa', 'Ti-6Al-4V', 20, ('Al6061', 'Al7075'), 12, ('FEM_3D', 'FEM_2D'), 114)",
    #     "mfnn_three('Er', '33TiAlTa', 'Ti-6Al-4V', 50, ('Al6061', 'Al7075'), 12, ('FEM_3D', 'FEM_2D'), 114)"
    #     ]))
    # run_processes(np.array([
    #     "mfnn_three('sy', '33TiAlTa', 'Ti-6Al-4V', 0, ('Al6061', 'Al7075'), 12, ('FEM_3D', 'FEM_2D'), 114)",
    #     "mfnn_three('sy', '33TiAlTa', 'Ti-6Al-4V', 1, ('Al6061', 'Al7075'), 12, ('FEM_3D', 'FEM_2D'), 114)",
    #     "mfnn_three('sy', '33TiAlTa', 'Ti-6Al-4V', 2, ('Al6061', 'Al7075'), 12, ('FEM_3D', 'FEM_2D'), 114)",
    #     "mfnn_three('sy', '33TiAlTa', 'Ti-6Al-4V', 3, ('Al6061', 'Al7075'), 12, ('FEM_3D', 'FEM_2D'), 114)",
    #     "mfnn_three('sy', '33TiAlTa', 'Ti-6Al-4V', 4, ('Al6061', 'Al7075'), 12, ('FEM_3D', 'FEM_2D'), 114)",
    #     "mfnn_three('sy', '33TiAlTa', 'Ti-6Al-4V', 5, ('Al6061', 'Al7075'), 12, ('FEM_3D', 'FEM_2D'), 114)",
    #     "mfnn_three('sy', '33TiAlTa', 'Ti-6Al-4V', 8, ('Al6061', 'Al7075'), 12, ('FEM_3D', 'FEM_2D'), 114)",
    #     "mfnn_three('sy', '33TiAlTa', 'Ti-6Al-4V', 10, ('Al6061', 'Al7075'), 12, ('FEM_3D', 'FEM_2D'), 114)",
    #     "mfnn_three('sy', '33TiAlTa', 'Ti-6Al-4V', 20, ('Al6061', 'Al7075'), 12, ('FEM_3D', 'FEM_2D'), 114)",
    #     "mfnn_three('sy', '33TiAlTa', 'Ti-6Al-4V', 50, ('Al6061', 'Al7075'), 12, ('FEM_3D', 'FEM_2D'), 114)"
    #     ]))
    # run_processes(np.array([
    #     "kan_one('Er', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075', 'FEM_3D', 'FEM_2D'), 0)",
    #     "kan_one('Er', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075', 'FEM_3D', 'FEM_2D'), 1)",
    #     "kan_one('Er', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075', 'FEM_3D', 'FEM_2D'), 2)",
    #     "kan_one('Er', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075', 'FEM_3D', 'FEM_2D'), 3)",
    #     "kan_one('Er', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075', 'FEM_3D', 'FEM_2D'), 4)",
    #     "kan_one('Er', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075', 'FEM_3D', 'FEM_2D'), 5)",
    #     "kan_one('Er', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075', 'FEM_3D', 'FEM_2D'), 8)",
    #     "kan_one('Er', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075', 'FEM_3D', 'FEM_2D'), 10)",
    #     "kan_one('Er', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075', 'FEM_3D', 'FEM_2D'), 20)",
    #     "kan_one('Er', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075', 'FEM_3D', 'FEM_2D'), 50)"
    #     ]))
    # run_processes(np.array([
    #     "kan_one('sy', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075', 'FEM_3D', 'FEM_2D'), 0)",
    #     "kan_one('sy', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075', 'FEM_3D', 'FEM_2D'), 1)",
    #     "kan_one('sy', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075', 'FEM_3D', 'FEM_2D'), 2)",
    #     "kan_one('sy', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075', 'FEM_3D', 'FEM_2D'), 3)",
    #     "kan_one('sy', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075', 'FEM_3D', 'FEM_2D'), 4)",
    #     "kan_one('sy', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075', 'FEM_3D', 'FEM_2D'), 5)",
    #     "kan_one('sy', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075', 'FEM_3D', 'FEM_2D'), 8)",
    #     "kan_one('sy', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075', 'FEM_3D', 'FEM_2D'), 10)",
    #     "kan_one('sy', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075', 'FEM_3D', 'FEM_2D'), 20)",
    #     "kan_one('sy', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075', 'FEM_3D', 'FEM_2D'), 50)"
    #     ]))
    # run_processes(np.array([
    #     "kan_one('Er', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075'), 0)",
    #     "kan_one('Er', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075'), 1)",
    #     "kan_one('Er', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075'), 2)",
    #     "kan_one('Er', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075'), 3)",
    #     "kan_one('Er', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075'), 4)",
    #     "kan_one('Er', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075'), 5)",
    #     "kan_one('Er', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075'), 8)",
    #     "kan_one('Er', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075'), 10)",
    #     "kan_one('Er', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075'), 20)",
    #     "kan_one('Er', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075'), 50)"
    #     ]))
    # run_processes(np.array([
    #     "kan_one('sy', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075'), 0)",
    #     "kan_one('sy', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075'), 1)",
    #     "kan_one('sy', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075'), 2)",
    #     "kan_one('sy', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075'), 3)",
    #     "kan_one('sy', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075'), 4)",
    #     "kan_one('sy', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075'), 5)",
    #     "kan_one('sy', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075'), 8)",
    #     "kan_one('sy', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075'), 10)",
    #     "kan_one('sy', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075'), 20)",
    #     "kan_one('sy', '33TiAlTa', ('Ti-6Al-4V', 'Al6061', 'Al7075'), 50)"
    #     ]))
    # run_processes(np.array([
    #     "kan_one('Er', '33TiAlTa', ('FEM_2D', 'FEM_3D'), 0)",
    #     "kan_one('Er', '33TiAlTa', ('FEM_2D', 'FEM_3D'), 1)",
    #     "kan_one('Er', '33TiAlTa', ('FEM_2D', 'FEM_3D'), 2)",
    #     "kan_one('Er', '33TiAlTa', ('FEM_2D', 'FEM_3D'), 3)",
    #     "kan_one('Er', '33TiAlTa', ('FEM_2D', 'FEM_3D'), 4)",
    #     "kan_one('Er', '33TiAlTa', ('FEM_2D', 'FEM_3D'), 5)",
    #     "kan_one('Er', '33TiAlTa', ('FEM_2D', 'FEM_3D'), 8)",
    #     "kan_one('Er', '33TiAlTa', ('FEM_2D', 'FEM_3D'), 10)",
    #     "kan_one('Er', '33TiAlTa', ('FEM_2D', 'FEM_3D'), 20)",
    #     "kan_one('Er', '33TiAlTa', ('FEM_2D', 'FEM_3D'), 50)"
    #     ]))
    # run_processes(np.array([
    #     "kan_one('sy', '33TiAlTa', ('FEM_2D', 'FEM_3D'), 0)",
    #     "kan_one('sy', '33TiAlTa', ('FEM_2D', 'FEM_3D'), 1)",
    #     "kan_one('sy', '33TiAlTa', ('FEM_2D', 'FEM_3D'), 2)",
    #     "kan_one('sy', '33TiAlTa', ('FEM_2D', 'FEM_3D'), 3)",
    #     "kan_one('sy', '33TiAlTa', ('FEM_2D', 'FEM_3D'), 4)",
    #     "kan_one('sy', '33TiAlTa', ('FEM_2D', 'FEM_3D'), 5)",
    #     "kan_one('sy', '33TiAlTa', ('FEM_2D', 'FEM_3D'), 8)",
    #     "kan_one('sy', '33TiAlTa', ('FEM_2D', 'FEM_3D'), 10)",
    #     "kan_one('sy', '33TiAlTa', ('FEM_2D', 'FEM_3D'), 20)",
    #     "kan_one('sy', '33TiAlTa', ('FEM_2D', 'FEM_3D'), 50)"
    #     ]))
    # run_processes(np.array([
    #     "kan_one('Er', 'FEM_2D', ('FEM_2D'), 0)",
    #     "kan_one('Er', 'FEM_2D', ('FEM_2D'), 1)",
    #     "kan_one('Er', 'FEM_2D', ('FEM_2D'), 2)",
    #     "kan_one('Er', 'FEM_2D', ('FEM_2D'), 3)",
    #     "kan_one('Er', 'FEM_2D', ('FEM_2D'), 4)",
    #     "kan_one('Er', 'FEM_2D', ('FEM_2D'), 5)",
    #     "kan_one('Er', 'FEM_2D', ('FEM_2D'), 8)",
    #     "kan_one('Er', 'FEM_2D', ('FEM_2D'), 10)",
    #     "kan_one('Er', 'FEM_2D', ('FEM_2D'), 20)",
    #     "kan_one('Er', 'FEM_2D', ('FEM_2D'), 50)"
    #     ]))
    # run_processes(np.array([
    #     "kan_one('sy', 'FEM_2D', ('FEM_2D'), 0)",
    #     "kan_one('sy', 'FEM_2D', ('FEM_2D'), 1)",
    #     "kan_one('sy', 'FEM_2D', ('FEM_2D'), 2)",
    #     "kan_one('sy', 'FEM_2D', ('FEM_2D'), 3)",
    #     "kan_one('sy', 'FEM_2D', ('FEM_2D'), 4)",
    #     "kan_one('sy', 'FEM_2D', ('FEM_2D'), 5)",
    #     "kan_one('sy', 'FEM_2D', ('FEM_2D'), 8)",
    #     "kan_one('sy', 'FEM_2D', ('FEM_2D'), 10)",
    #     "kan_one('sy', 'FEM_2D', ('FEM_2D'), 20)",
    #     "kan_one('sy', 'FEM_2D', ('FEM_2D'), 50)"
    #     ]))