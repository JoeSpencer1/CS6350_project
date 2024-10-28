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
        "pinn_one('sy', ('FEM_2D', 'FEM_3D'), ('FEM_2D', 'FEM_3D'), 0)",
        "pinn_one('sy', ('FEM_2D', 'FEM_3D'), ('FEM_2D', 'FEM_3D'), 1)",
        "pinn_one('sy', ('FEM_2D', 'FEM_3D'), ('FEM_2D', 'FEM_3D'), 2)",
        "pinn_one('sy', ('FEM_2D', 'FEM_3D'), ('FEM_2D', 'FEM_3D'), 3)"
        ]))
    run_processes(np.array([
        "pinn_one('sy', ('FEM_2D', 'FEM_3D'), ('FEM_2D', 'FEM_3D'), 5)",
        "pinn_one('sy', ('FEM_2D', 'FEM_3D'), ('FEM_2D', 'FEM_3D'), 6)",
        "pinn_one('sy', ('FEM_2D', 'FEM_3D'), ('FEM_2D', 'FEM_3D'), 8)"
        ]))
    run_processes(np.array([
        "pinn_one('sy', ('FEM_2D', 'FEM_3D'), ('FEM_2D', 'FEM_3D'), 10)",
        "pinn_one('sy', ('FEM_2D', 'FEM_3D'), ('FEM_2D', 'FEM_3D'), 15)",
        "pinn_one('sy', ('FEM_2D', 'FEM_3D'), ('FEM_2D', 'FEM_3D'), 20)",
        ]))
    run_processes(np.array([
        "pinn_one('Er', ('FEM_2D', 'FEM_3D'), ('FEM_2D', 'FEM_3D'), 0)",
        "pinn_one('Er', ('FEM_2D', 'FEM_3D'), ('FEM_2D', 'FEM_3D'), 1)",
        "pinn_one('Er', ('FEM_2D', 'FEM_3D'), ('FEM_2D', 'FEM_3D'), 2)",
        "pinn_one('Er', ('FEM_2D', 'FEM_3D'), ('FEM_2D', 'FEM_3D'), 3)"
        ]))
    run_processes(np.array([
        "pinn_one('Er', ('FEM_2D', 'FEM_3D'), ('FEM_2D', 'FEM_3D'), 5)",
        "pinn_one('Er', ('FEM_2D', 'FEM_3D'), ('FEM_2D', 'FEM_3D'), 6)",
        "pinn_one('Er', ('FEM_2D', 'FEM_3D'), ('FEM_2D', 'FEM_3D'), 8)"
        ]))
    run_processes(np.array([
        "pinn_one('Er', ('FEM_2D', 'FEM_3D'), ('FEM_2D', 'FEM_3D'), 10)",
        "pinn_one('Er', ('FEM_2D', 'FEM_3D'), ('FEM_2D', 'FEM_3D'), 15)",
        "pinn_one('Er', ('FEM_2D', 'FEM_3D'), ('FEM_2D', 'FEM_3D'), 20)",
        ]))
    run_processes(np.array([
        "nn_one('sy', 'TI33_25', ('B3067'), 0)",
        "nn_one('sy', 'TI33_25', ('B3067'), 1)",
        "nn_one('sy', 'TI33_25', ('B3067'), 2)",
        "nn_one('sy', 'TI33_25', ('B3067'), 3)"
        ]))
    run_processes(np.array([
        "nn_one('sy', 'TI33_25', ('B3067'), 5)",
        "nn_one('sy', 'TI33_25', ('B3067'), 6)",
        "nn_one('sy', 'TI33_25', ('B3067'), 8)"
        ]))
    run_processes(np.array([
        "nn_one('sy', 'TI33_25', ('B3067'), 10)",
        "nn_one('sy', 'TI33_25', ('B3067'), 15)",
        "nn_one('sy', 'TI33_25', ('B3067'), 20)",
        ]))
    run_processes(np.array([
        "nn_one('Er', 'TI33_25', ('B3067'), 0)",
        "nn_one('Er', 'TI33_25', ('B3067'), 1)",
        "nn_one('Er', 'TI33_25', ('B3067'), 2)",
        "nn_one('Er', 'TI33_25', ('B3067'), 3)"
        ]))
    run_processes(np.array([
        "nn_one('Er', 'TI33_25', ('B3067'), 5)",
        "nn_one('Er', 'TI33_25', ('B3067'), 6)",
        "nn_one('Er', 'TI33_25', ('B3067'), 8)"
        ]))
    run_processes(np.array([
        "nn_one('Er', 'TI33_25', ('B3067'), 10)",
        "nn_one('Er', 'TI33_25', ('B3067'), 15)",
        "nn_one('Er', 'TI33_25', ('B3067'), 20)",
        ]))
    run_processes(np.array([
        "nn_one('sy', TI33_25', ('Al6061', 'Al7075'), 0)",
        "nn_one('sy', TI33_25', ('Al6061', 'Al7075'), 1)",
        "nn_one('sy', TI33_25', ('Al6061', 'Al7075'), 2)"
        ]))
    run_processes(np.array([
        "nn_one('sy', TI33_25', ('Al6061', 'Al7075'), 3)",
        "nn_one('sy', TI33_25', ('Al6061', 'Al7075'), 5)",
        "nn_one('sy', TI33_25', ('Al6061', 'Al7075'), 6)"
        ]))
    run_processes(np.array([
        "nn_one('sy', TI33_25', ('Al6061', 'Al7075'), 8)",
        "nn_one('sy', TI33_25', ('Al6061', 'Al7075'), 10)"
        ]))
    run_processes(np.array([
        "nn_one('Er', TI33_25', ('Al6061', 'Al7075'), 0)",
        "nn_one('Er', TI33_25', ('Al6061', 'Al7075'), 1)",
        "nn_one('Er', TI33_25', ('Al6061', 'Al7075'), 2)"
        ]))
    run_processes(np.array([
        "nn_one('Er', TI33_25', ('Al6061', 'Al7075'), 3)",
        "nn_one('Er', TI33_25', ('Al6061', 'Al7075'), 5)",
        "nn_one('Er', TI33_25', ('Al6061', 'Al7075'), 6)"
        ]))
    run_processes(np.array([
        "nn_one('Er', TI33_25', ('Al6061', 'Al7075'), 8)",
        "nn_one('Er', TI33_25', ('Al6061', 'Al7075'), 10)"
        ]))
    run_processes(np.array([
        "nn_one('sy', ('FEM_2D', 'FEM_3D'), ('FEM_2D', 'FEM_3D'), 0)",
        "nn_one('sy', ('FEM_2D', 'FEM_3D'), ('FEM_2D', 'FEM_3D'), 1)",
        "nn_one('sy', ('FEM_2D', 'FEM_3D'), ('FEM_2D', 'FEM_3D'), 2)",
        "nn_one('sy', ('FEM_2D', 'FEM_3D'), ('FEM_2D', 'FEM_3D'), 3)"
        ]))
    run_processes(np.array([
        "nn_one('sy', ('FEM_2D', 'FEM_3D'), ('FEM_2D', 'FEM_3D'), 5)",
        "nn_one('sy', ('FEM_2D', 'FEM_3D'), ('FEM_2D', 'FEM_3D'), 6)",
        "nn_one('sy', ('FEM_2D', 'FEM_3D'), ('FEM_2D', 'FEM_3D'), 8)"
        ]))
    run_processes(np.array([
        "nn_one('sy', ('FEM_2D', 'FEM_3D'), ('FEM_2D', 'FEM_3D'), 10)",
        "nn_one('sy', ('FEM_2D', 'FEM_3D'), ('FEM_2D', 'FEM_3D'), 15)",
        "nn_one('sy', ('FEM_2D', 'FEM_3D'), ('FEM_2D', 'FEM_3D'), 20)",
        ]))
    run_processes(np.array([
        "nn_one('Er', ('FEM_2D', 'FEM_3D'), ('FEM_2D', 'FEM_3D'), 0)",
        "nn_one('Er', ('FEM_2D', 'FEM_3D'), ('FEM_2D', 'FEM_3D'), 1)",
        "nn_one('Er', ('FEM_2D', 'FEM_3D'), ('FEM_2D', 'FEM_3D'), 2)",
        "nn_one('Er', ('FEM_2D', 'FEM_3D'), ('FEM_2D', 'FEM_3D'), 3)"
        ]))
    run_processes(np.array([
        "nn_one('Er', ('FEM_2D', 'FEM_3D'), ('FEM_2D', 'FEM_3D'), 5)",
        "nn_one('Er', ('FEM_2D', 'FEM_3D'), ('FEM_2D', 'FEM_3D'), 6)",
        "nn_one('Er', ('FEM_2D', 'FEM_3D'), ('FEM_2D', 'FEM_3D'), 8)"
        ]))
    run_processes(np.array([
        "nn_one('Er', ('FEM_2D', 'FEM_3D'), ('FEM_2D', 'FEM_3D'), 10)",
        "nn_one('Er', ('FEM_2D', 'FEM_3D'), ('FEM_2D', 'FEM_3D'), 15)",
        "nn_one('Er', ('FEM_2D', 'FEM_3D'), ('FEM_2D', 'FEM_3D'), 20)",
        ]))