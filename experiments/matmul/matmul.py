import numpy as np

mat1 = np.random.rand(2**13, 2**13)
mat2 = np.random.rand(2**13, 2**13)

res  = np.matmul(mat1, mat2)
