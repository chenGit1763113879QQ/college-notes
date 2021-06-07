# Introduction of Feature Extraction

## Approaches of Dimensionality reduction

- **Feature extraction**: Usingg the mapping (or transformation) methods to transform the original features to **new features**
- **Feature Selection**: Selecting the most represetative and best performance features from the original features

$$
\text{extraction: }
\bold{x}\rightarrow \bold{x'}=f(\bold{x})
\\
\text{selecttion: }
\bold{x}_{1\times n}\rightarrow \bold{x}_{1 \times m}
$$

## Feature Extraction using K-L transformation

K-L transformation is one common orthogonal(正交,正交矩阵相乘为单位矩阵) transformation

If the type(?distribution?) of training samples is unknown,
then the within-class scatter matrix(类内离散度矩阵) of training matrix of training samples is chosen as special matrix.

1. Computing the within-class scatter matrix $Sw_{2\times 2}=\sum(x_i-\mu)(x_i-\mu)^T$
2. Computing the within-class scater matrix's eigenvalues and eigenvectors $|\lambda E-S_w|=0,\lambda_i\vec{\xi_i}=S_w\vec{\xi_i}$（应该选择方便单位化的特征向量：$A\rightarrow \frac{A}{|A|}$）
3. Gennerating the transformation matrix T based on the orthogonal eigenvectors for the top N eigenvalues（如果原来二维，那么通常选取特征值大的对应的特征向量，来作为T，注意单位正交化）
4. Computing K-L transformation: $y=Tx$
