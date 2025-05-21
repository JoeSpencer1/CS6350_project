# CS6350_project

## Contributors
- Joe Spencer
- Hamid Shafieasl

## Description
This repository contains our project for CS 6350 at the University of Utah. Data is contained in the

## Files
Code files are located in the [src](src) folder, and data files are located in the [data](data) folder.
### Brief explanation of code files

## Requirements
The requirements for the neural network's python environment are listed in `requirements.txt`. Some specific requirements are also listed below:
- `Python 3.11`
- [DeepXDE](https://github.com/lululxvi/deepxde) `v1.11.1` is used, with `tensorflow.compat.v1` set as its backend. Some DeepXDE functions may need to be modified if a different version is used.
- [Keras](https://keras.io/) `v2.15.0` is used. DeepXDE will not work with newer versions of Keras like v3.
- [TensorFlow](https://www.tensorflow.org/) `v2.15.0`, with `tensorflow-probability==0.23.0` (see this DeepXDE [Git issue](https://github.com/lululxvi/deepxde/issues/1682)).

If additional FEM simulations from MOOSE are desired, the MOOSE conda envoronment should work as installed from source using the instructions provided on the [MOOSE website](https://mooseframework.inl.gov/getting_started/installation/).
