# 深度学习在国民游戏“斗地主”中的应用

!> 这是我的机器学习课程作业，对 douZero 项目做一些简单的熟悉了解

## 一、背景

随着人工智能的技术[三次发展高潮][1]的影响，人工智能已经开始深入国民生活的方方面面。
最近，清华大学了 THUNLP 发布了在线反向词典——[万词王][wantwords]，
其源码在代码托管平台[github][wantwords-github]进行了公开，
引发了大众特别是写作爱好者与人工智能爱好者的广泛关注。

在娱乐方便，经典的棋牌游戏已经有了 IBM 的深蓝和[deep-mind][deep-mind]的[alpha-go][alpha-go]击败人类顶尖棋手的例子。
而在国民游戏“斗地主”方面，由于其游戏的特殊性，特别是发牌的随机性以及需要玩家之间的配合等原因，
长久以来没有很好的机器学习模型得到广泛应用。

不久前，[douZero][douzero]（斗零）人工智能系统成功发布，随之一起的还有论文[DouZero: Mastering DouDizhu with Self-Play Deep Reinforcement Learning](https://arxiv.org/abs/2106.06135)以及源代码（[gitee][douzero-gitee]和[github][douzero-github]），

相关的应用如雨后春笋班爆发，如在线平台[rlcard:卡牌游戏强化学习工具包]（[github][rlcard-github]）与 对于 [欢乐斗地主][douzero-hlddz] 与 JJ 斗地主的简单适配。
使用不同语言的实验与移植，使用不同思路的算法也相继推出，如使用[C/C++语言][douzero-cpp]的移植版本，依靠专家系统的[changjiuxiong/ddz](ddz)。

[1]: http://www.miluo.gov.cn/28566/28577/content_1338533.html
[wantwords]: https://wantwords.thunlp.org/
[wantwords-github]: https://github.com/thunlp/WantWords
[douzero]: https://douzero.org/
[douzero-gitee]: https://gitee.com/daochenzha/DouZero
[douzero-github]: https://github.com/kwai/DouZero
[douzero-cpp]: https://github.com/yffbit/douzero_cpp
[douzero-hlddz]: https://tqraf.cn/2021/07/DouZero-For-HappyDouDiZhu.html
[ddz]: https://gitee.com/changjiuxiong/ddz
[alpha-go]: https://baike.baidu.com/item/%E9%98%BF%E5%B0%94%E6%B3%95%E5%9B%B4%E6%A3%8B/19319610
[deep-mind]: https://deepmind.com/
[rlcard]: www.rlcard.org
[rlcard-github]: https://github.com/datamllab/rlcard

## 二、问题分析

用强化学习打游戏对大家来说一定不陌生，常见的游戏 AI，比如围棋、DOTA、星际争霸、王者荣耀等，都有强化学习的身影。

强化学习的目标是针对一个特定的**任务**去学习一个**策略**来最大化**奖励**。放在斗地主的环境下，任务是学打斗地主，策略是指出牌策略（先不考虑叫牌），奖励是输赢（先不考虑炸弹加倍）。那么什么是策略呢？这里项目引入强化学习中的两个概念，**状态**和**动作**。状态是指一个策略在某一时刻所能看到所有信息。在斗地主中，状态包括玩家当前的手牌、过去的出牌历史、地主的三张牌等等（注意，这里不包括其他玩家的手牌）。动作是指在某一个状态下做出的一个行为。在斗地主中，动作指玩家打出的牌型，例如单张、对子、三带一、炸弹等等。那么策略其实就是一个由状态到动作的一个函数映射，也就是项目优化的目标。它可以是简单的规则，也可以是深度神经网络。项目接下来引入**状态转移**的概念。在斗地主中，状态是会改变的。例如当玩家出了一张牌后，它的手牌会少一张并且出牌历史记录里会多了一张牌，这个过程项目称为状态转移。在强化学习中，项目假设下一个状态是由前一个状态和在上一个状态做的动作决定的，这也被称为马尔可夫决策过程。

根据以上定义，项目重新描述一下**用强化学习学打斗地主**这个任务。项目希望为每个位置（地主、地主上家和地主下家）分别学出一个策略来达到以下效果：当每个位置用其学到的策略来打牌时，经过多次状态转换直到一局游戏的结束最终得到的奖励（可以是输赢，也可以考虑炸弹算得分）的期望值达到最大。当然这个描述中奖励还有一些瑕疵，因为输赢不仅取决于策略好不好，还取决于对手强不强。下一章项目详细分析这个问题。

那么强化学习是怎么学习的呢？强化学习的原理在于**不断试错**。例如在斗地主中，一开始项目并不能直接知道哪个动作是好的，但是当项目打完一局游戏后，项目可以根据输赢获取**正反馈或者负反馈**。对于正反馈，强化学习算法会基于某种机制来增大未来在相同或者类似的状态做当前动作的概率。相反，对于负反馈，算法会减小未来在相同或者类似的状态做当前动作的概率。经过一次试错后，策略根据反馈进行了更新；在下一次试错中，算法会用新的策略去打牌产生新的数据。经过很多次迭代，算法最终学到一个比较强的策略。

### 斗地主难在哪里？

上面描述了一般的强化学习设定。那么斗地主对于强化学习难在哪里呢？难点大致可以归纳为以下几点：

- **合作与竞争并存：** 斗地主中有三个角色，包括一个地主和两个农民。农民之间需要相互配合来共同对抗地主。这种**多智能体**的设定对强化学习来说是很难的。比如，地主最后得到的奖励（输赢）取决于两个农民策略的强度。如果两个农民很强，地主就很容易赢：如果两个农民都很弱，地主的策略即便很弱也很容易赢。对农民来说就更加复杂了，农民得到的奖励不仅关系到地主强不强，还取决于队友给不给力（毕竟遇到猪队友很难赢）。在这样一种**奖励不明确**的情况下，训练强化学习是很难的。
- **庞大而复杂的动作空间**：斗地主中有复杂的牌型组合，比如单牌、对子、顺子、三带一等，一共有上万种可能的组合，在很大动作空间下训练强化学习是很难的。
- **非完美信息：** 有人可能会问，阿法狗还有它的后代 AlphaZero 连围棋这么难的游戏都能解决，可以来斗地主吗？还真没那么容易，原因在于斗地主是**非完美信息游戏，每个玩家看到的信息是不对称的**。具体来说，斗地主中的玩家不能看到其他玩家手牌，而围棋中双方玩家都能看到所有的棋子。如此，智能体只能靠「猜」来做决策，增加了很多变数，导致 AlphaZero 中的算法 MCTS 不能直接用得上。当然**并不是说斗地主比围棋难**，它们都很难，区别在于难的点不一样。围棋难在庞大的状态空间和很深的决策树，而斗地主难在合作与竞争并存的设定、巨大的动作空间和非完美信息。

## 三、解决方案

DouZero 使用的强化学习算法非常简单。 当项目要知道某个事件发生的概率时，项目可以通过重复采样，根据事件发生的频率来估计概率。这种方法有个更高端的名字，叫做「蒙特卡罗方法」。蒙特卡罗方法很容易和强化学习联系起来，因为强化学习也是通过不断重复采样来做估计。几十年前在还没有深度学习的时候就有学者想到了这一点。

具体怎么做呢？首先，项目介绍**价值**的概念：价值是指当前情况下预期的奖励是多少；在这里，项目主要考虑$Q$价值，指的是**在某个状态去做 某个动作预期的价值是多少。** 那么项目知道 $Q$值有什么用呢？$Q$值可以用来做决策：在某个状态下，项目可以自然而然地选择 Q 值最大的动作，因为它预期能带来的奖励最大。在强化学习中，项目一般用 $Q(s,a)$来表示在状态 $s$和动作 $a$下的 $Q$值。在非深度学习的时代， $Q$一般都是离散的，用表格实现。

项目怎么样用「蒙特卡罗方法」学习出 $Q$表格呢？
项目可以用重复采样的方法去迭代更新 $Q$ 表格中的值，直到收敛。
首先，项目初始化 $Q$ 表格中的值（比如 0）和一个随机的的策略$\pi$
（ $\pi(s)$会对于当前状态 $s$输出一个动作）。
然后，项目迭代执行以下步骤（以斗地主为例）：

1.  用当前的策略 $\pi$去生成一场对局，得到奖励 $r$。
2.  对在当前对局中出现所有的 $s,+a$对，项目将对应 $Q$值更新为$r$（在其他任务中，同样的$s,+a$对可能出现多次；一种可能的方法是取平均值）。
3.  对在当前对局中所有的 $s$， $\pi(s)+\leftarrow+argmax_a+Q(s,a)$。

这个步骤重复做两件事：

- 第一，用当前的策略去采样；
- 第二，用采样的数据去估计 $Q$值。

这个简单方法在学术界不怎么受重视，主要原因是蒙特卡罗方法的方差会比较大，导致采样效率比较低。
以斗地主为例，假设智能体在某一个状态做一个动作，最后它赢了，得到+1 的奖励；在另一局游戏中同样的状态下做同样的动作，因为队友不给力，最后输了，得到-1 的奖励。
那么在同样的情况下，一个是+1 一个是-1，就会造成很大的方差。如此，智能体需要采集很多的样本才能得到一个相对准确的估计。
为了提高效率，很多强化学习算法，比如 DQN，会用 boostraping 的方法以提高 bias（偏差）的代价来降低方差，以达到更好的采样效率。

注意，以上项目讨论的都是采样效率，即打了多少场斗地主。
在实际操作中，当项目有比较好的模拟器时，项目更关心挂钟时间（wall-clock time），即学打斗地主花了多长时间。
除了采样开销，算法本身也会有开销：比较复杂的强化学习算法，比如 DQN，会用经验回放、TD 学习等操作。
经验回放会维护一个缓存区用来存放过去的数据，需要内存和计算开销；DQN 的 TD 学习有一个取最大值的操作，需要做一次神经网络的推理，也需要不少的开销。
与之相反，**蒙特卡罗方法本身的开销几乎可以忽略不计。** 因此，**蒙特卡罗方法虽然采样效率可能不高，但因为其极度简单，从计算量来看它很高效。**

注意，DouZero 虽然叫的是「Zero」，但用的不是 Alpha 系列的树搜索的模式。「Zero」的意思是不需要人类知识，从「零」开始。树搜索一般都要非常大的开销，比如上千块 CPU。DouZero 的蒙特卡罗方法不做搜索，因此只需要 4 块 GPU 训练。虽然个人一般没有这个计算资源，但对大多数做机器学习相关的实验室来说，这算是非常小的开销了。相信很多读者都能基于 DouZero 的代码快速实验。

### 加强蒙特卡罗算法

标准的蒙特卡罗算法只能处理离散的情况，但斗地主的状态和动作空间都非常大，普通的蒙特卡罗算法不能直接用。这里项目给它做些加强来应对斗地主：

1.  把 $Q$表格换成神经网络，称作 $Q$网络。
2.  用 Mean-Square-Error（MSE) 的损失来更新 $Q$网络。
3.  项目对斗地主中的动作也进行编码（后面会详细介绍）。
4.  项目在采样中引入 $\epsilon-greedy$机制来鼓励探索。
5.  项目用多个进程来采样，提高效率。

因为项目引入了深度神经网络。项目把这个方法称为深度蒙特卡罗（Deep Monte-Carlo）。这个方法也可以看作是只包含价值网络的 AlphaZero（去掉搜索和策略网络；当然这个价值是 $Q$
价值，而 AlphaZero 里是状态的价值）。这个方法有几个优点：

1.  实现简单，效率高。简单并行处理后产生数据很快。
2.  超参数很少，避免调参的麻烦。
3.  因为没有用 bootstrapping，所以不会有偏差的烦恼。
4.  通用性很强。

这个方法可能的缺点就是方差很大。但因为算法本身简单，采样速度快，所以可以通过采集大量的样本来降低方法。在实际中（斗地主游戏），这种组合效果很好。

### DouZero 系统实现

接下来，项目介绍 DouZero 是怎么实现基于深度蒙特卡罗算法来打斗地主，主要包括牌型编码、神经网络和多演员（actor）的并行训练。

项目将牌型编码成 15x4 的矩阵，其中 15 表示非重复牌的种类（3 到 A 加上大小王），4 表示最多每种有四张牌。项目用 0/1 的矩阵来编码，例子如下：

![](https://pic2.zhimg.com/v2-a02c7c880ec2b62d427cf8d4616805ed_b.jpg)

**这里项目忽略了花色**。有人可能会说花色也有用（当考虑地主三张牌的时候），但这毕竟是很少数的情况，项目暂不考虑。这种编码方式是非常通用，项目可以用它去编码一种特定的牌型（例如单张、对子、三带一等），也可以编码手牌、其他玩家的手牌等。有了这种编码方式，项目接下来介绍神经网路，如下图所示：

![](https://pic4.zhimg.com/v2-42e7c90a4d44b7620e2856a3074613ef_b.jpg)

网络的输入是状态和动作，输出是 $Q$值。
动作就是简单地用上面的方式进行编码。
状态包括两部分：一部分是当前能看到的信息，包括手牌、其他玩家出的牌、上家的牌等特征矩阵以及其他玩家手牌数量和炸弹数量的 0/1 编码；另一部分是历史出牌信息，项目用 LSTM 网络进行编码。最后特征经过 6 层全连接网路得到 $Q$值。

有人或许会问为什么选择简单的全连接网络。原因是项目尝试全连接后，发现效果已经不错了。使用其他网络，比如卷积网络，或者增大网络容量，都有可能进一步提高模型的性能。

为了加快采样速度，项目采用多演员（actor）机制去模拟产生数据。每个演员进程的算法实现细节如下：

![](https://pic4.zhimg.com/v2-0c273cbb717cd472ecf1a047c20a98b7_b.jpg)

简而言之，每个演员进程不断产生数据并把数据不断地存入一个共享的缓冲器中。缓冲器里的数据会被学习器用来学习：

![](https://pic1.zhimg.com/v2-a615a148cc832df1bf6941a52b3c16ac_b.jpg)

## 四、代码运行

我使用 conda 来管理虚拟环境，通过如下命令创建安装环境，并安装需要的 torch 等依赖。
安装过程遇到了 https 证书等问题，需要配置好镜像源。

```sh
conda create -n pytorch
conda activate pytorch
conda install pytorch -c pytorch
conda install GitPython gitdb2
pip install rlcard
```

### 训练

实验中我的电脑没有 GPU，所以需要使用 CPU 来训练模型，这牺牲了速度。
说明文档中也指出在 windows 系统下无法使用 GPU 训练。

如果用 CPU 进行训练和模拟（Windows 用户只能用 CPU 进行模拟），用以下参数：

- `--training_device cpu`: 用 CPU 来训练
- `--actor_device_cpu`: 用 CPU 来模拟

例如，用以下命令完全在 CPU 上运行：

```
python train.py --actor_device_cpu --training_device cpu
```

以下命令仅仅用 CPU 来跑模拟：

```
python train.py --actor_device_cpu
```

训练时输出为

```plainText
Found log directory: douzero_checkpoints\douzero
Saving arguments to douzero_checkpoints\douzero/meta.json
Path to meta file already exists. Not overriding meta.
Saving messages to douzero_checkpoints\douzero/out.log
Path to message file already exists. New data will be appended.
Saving logs data to douzero_checkpoints\douzero/logs.csv
Saving logs' fields to douzero_checkpoints\douzero/fields.csv
Path to log file already exists. New data will be appended.
[INFO:10464 utils:119 2022-01-01 19:28:20,749] Device cpu Actor 0 started.
[INFO:9852 utils:119 2022-01-01 19:28:24,109] Device cpu Actor 1 started.
[INFO:3376 utils:119 2022-01-01 19:28:27,579] Device cpu Actor 2 started.
[INFO:10808 utils:119 2022-01-01 19:28:31,016] Device cpu Actor 3 started.
[INFO:1472 utils:119 2022-01-01 19:28:34,429] Device cpu Actor 4 started.
[INFO:11216 dmc:194 2022-01-01 19:28:39,464] Saving checkpoint to douzero_checkpoints/douzero/model.tar
[INFO:11216 dmc:233 2022-01-01 19:28:39,537] After 0 (L:0 U:0 D:0) frames: @ 0.0 fps (avg@ 0.0 fps) (L:0.0 U:0.0 D:0.0) Stats:
{'loss_landlord': 0,
 'loss_landlord_down': 0,
 'loss_landlord_up': 0,
 'mean_episode_return_landlord': 0,
 'mean_episode_return_landlord_down': 0,
 'mean_episode_return_landlord_up': 0}
[INFO:11216 dmc:233 2022-01-01 19:28:44,547] After 0 (L:0 U:0 D:0) frames: @ 0.0 fps (avg@ 0.0 fps) (L:0.0 U:0.0 D:0.0) Stats:
{'loss_landlord': 0,
 'loss_landlord_down': 0,
 'loss_landlord_up': 0,
 'mean_episode_return_landlord': 0,
 'mean_episode_return_landlord_down': 0,
 'mean_episode_return_landlord_up': 0}
[INFO:11216 dmc:233 2022-01-01 19:28:49,564] After 9600 (L:3200 U:3200 D:3200) frames: @ 1914.5 fps (avg@ 638.2 fps) (L:638.2 U:638.2 D:638.2) Stats:
{'loss_landlord': 2.3976564407348633,
 'loss_landlord_down': 2.452058792114258,
 'loss_landlord_up': 2.5052504539489746,
 'mean_episode_return_landlord': -0.260606050491333,
 'mean_episode_return_landlord_down': 0.23668639361858368,
 'mean_episode_return_landlord_up': 0.16860465705394745}
[INFO:11216 dmc:233 2022-01-01 19:28:54,583] After 9600 (L:3200 U:3200 D:3200) frames: @ 0.0 fps (avg@ 478.6 fps) (L:0.0 U:0.0 D:0.0) Stats:
{'loss_landlord': 2.3976564407348633,
 'loss_landlord_down': 2.452058792114258,
 'loss_landlord_up': 2.5052504539489746,
 'mean_episode_return_landlord': -0.260606050491333,
 'mean_episode_return_landlord_down': 0.23668639361858368,
 'mean_episode_return_landlord_up': 0.16860465705394745}
```

### 评估

评估可以使用 GPU 或 CPU 进行（GPU 效率会高得多）。
将预训练权重放到`baselines/`目录下。
模型性能通过自我对弈进行评估。
可以使用如下一些其他预训练模型和一些启发式方法作为基准：

- [random](douzero/evaluation/random_agent.py): 智能体随机出牌（均匀选择）
- [rlcard](douzero/evaluation/rlcard_agent.py): [RLCard](https://github.com/datamllab/rlcard)项目中的规则模型
- SL (`baselines/sl/`): 基于人类数据进行深度学习的预训练模型
- DouZero-ADP (`baselines/douzero_ADP/`): 以平均分数差异（Average Difference Points, ADP）为目标训练的 Douzero 智能体
- DouZero-WP (`baselines/douzero_WP/`): 以胜率（Winning Percentage, WP）为目标训练的 Douzero 智能体

#### 第 1 步：生成评估数据

```
python generate_eval_data.py
```

以下为一些重要的超参数。

- `--output`: pickle 数据存储路径
- `--num_games`: 生成数据的游戏局数，默认值 10000

控制台输出为

```plainText
╭─[Administrator@CHINA-20190315T]─[DouZero]                                               (pytorch 3.9.7)()─[ 1,19:55]
╰─[main ● +3]->> python generate_eval_data.py
output_pickle: eval_data.pkl
generating data...
saving pickle file...
```

## 第 2 步：自我对弈

```
python evaluate.py
```

控制台输出为

```plainText
╭─[Administrator@CHINA-20190315T]─[DouZero]                                               (pytorch 3.9.7)()─[ 1,19:55]
╰─[main ● +3]->> python evaluate.py
WP results:
landlord : Farmers - 0.5186 : 0.4814
ADP results:
landlord : Farmers - 0.3454 : -0.3454
```

以下为一些重要的超参数。

- `--landlord`: 扮演地主的智能体，可选值：random, rlcard 或预训练模型的路径
- `--landlord_up`: 扮演地主上家的智能体，可选值：random, rlcard 或预训练模型的路径
- `--landlord_down`: 扮演地主下家的智能体，可选值：random, rlcard 或预训练模型的路径
- `--eval_data`: 包含评估数据的 pickle 文件
- `--num_workers`: 用多少个进程进行模拟
- `--gpu_device`: 用哪个 GPU 设备进行模拟。默认用 CPU

例如，可以通过以下命令评估 DouZero-ADP 智能体作为地主对阵随机智能体

```
python evaluate.py --landlord baselines/douzero_ADP/landlord.ckpt --landlord_up random --landlord_down random
```

以下命令可以评估 DouZero-ADP 智能体作为农民对阵 RLCard 智能体

```
python evaluate.py --landlord rlcard --landlord_up baselines/douzero_ADP/landlord_up.ckpt --landlord_down baselines/douzero_ADP/landlord_down.ckpt
```

默认情况下，项目的模型会每半小时保存在`douzero_checkpoints/douzero`路径下。项目提供了一个脚本帮助定位最近一次保存检查点。运行

```
sh get_most_recent.sh douzero_checkpoints/douzero/
```

之后可以在`most_recent_model`路径下找到最近一次保存的模型。

## 五、总结

简单的蒙特卡罗算法经过一些加强效果可以很好。蒙特卡罗方法没有什么超参，实现简单，在实际应用中值得一试。从简单开始，可以更好地理解问题、设计特征、快速实验。其次，（我希望）蒙特卡罗方法能再次受到重视。蒙特卡罗方法自深度学习以来一直不受重视。大多数研究都基于 DQN 或者 Actor-Critc，算法越来越复杂、超参越来越多。DouZero 表明在有些时候，蒙特卡罗方法可能有惊人的效果。什么情况下蒙特卡罗方法适用，什么情况下不适用，还需要更多的研究。

## 参考资料

- DouZero 斗地主 AI 深度解析，以及 RLCard 工具包介绍.https://zhuanlan.zhihu.com/p/383097277
