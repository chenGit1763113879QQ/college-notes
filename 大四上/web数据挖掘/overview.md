# 概览

## 第一周

1. 数据挖掘是数据“**模型**”的发现过程
2. 数据挖掘与其他领域的关系：统计学，数据库，机器学习，深度学习
3. 本课程侧重于web+数据挖掘+分布式处理
4. 建模的计算方法Computational Approaches to Modeling
   1. 数据汇总Summarization
   2. 特征抽取Feature Extraction
5. PageRank、聚类两种数据汇总的形式
6. 特征抽取
   1. 频繁项集
   2. 相似项
7. 数据挖掘的统计限制：
   1. 没有免费午餐定理(No Free Lunch，简称NFL)是wolpert和Macerday提出的“最优化理论的发展”之一：在机器学习算法中的体现为**在没有实际背景下，没有一种算法比随机胡猜的效果好**
      1. 欠拟合High bias(uderfit)：拟合偏差比较大，（没有学到所有共有特征，树->树叶）
      2. "just right"
      3. 过拟合High variance：拟合偏差小，但是结果不符合认知，在新的测试样本情况下，很大可能不会落在拟合曲线上，（将样本独有特征学了，树叶无锯齿->非树叶）
   2. 邦弗朗尼原理

## 第二周

1. 邦弗朗尼原理 Bonferroni's Principle
2. TF.IDF 词项频率.逆文档频率Term Frequency times Inverse Document Frequency
3. 哈希函数 Hash function: hash-key->bucket number. 通常会使用$h(x) = x\  mod \ B$通常使用质数作为B，使得分配近似均匀分布
4. 索引index
5. 二级存储器secondary Storage: 容量大，断电不易失去，读取速度慢（相对于RAM内存）
6. e和幂定理The base of Natural Logarithms and Power Law

## 第三周-分布式文件系统

1. 海量(enormous)冷(rarely updated)数据如何存储？使用**分布式文件系统**存储
   1. 硬盘够不够大：分布式存储
   2. 硬盘够不够安全：冗余机制
2. 分布式文件系统的特点
   1. 使用普通廉价的硬件，**硬件故障是常态**而不是异常
   2. 流式数据访问：数据批量读取而非随机读写，擅长做**数据分析**而不是数据处理
   3. 大规模数据集
   4. 简单一致性模型，一次性写多次读，一旦写入不能修改。**现在只允许追加操作**
   5. 文件是**文件块**，而不是文件整体存放
3. 分布式文件系统的组成
   1. Name Node and Secondary Name Node: edit logs and fsimage
   2. Data Node
4. 大量的数据如何计算？
   1. MapReduce

## 第四周-MapReduce框架

1. 不同的Map任务和Reduce任务之间不会进行通信
2. 用户不能显式地进行机器之间的信息交换，所有通信依赖MapReduce框架
3. MapReduce不适用于**实时**的计算，如计算当前某产品的抢购数量
4. 核心思想为分治
5. Reduce任务需要远远小于Map的数目，同时应当多于Reducer的数目

## 第五周-MapReduce应用

1. 字数统计
2. 关系代数计算
3. 基于MapReduce的矩阵-向量乘法
4. 基于MapReduce的矩阵-矩阵乘法

## 第六周-近邻搜索的应用



