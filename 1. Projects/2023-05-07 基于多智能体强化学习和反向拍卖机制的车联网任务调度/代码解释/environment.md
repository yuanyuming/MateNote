## 用途
完成强化学习环境的搭建. 使用 Pettingzoo 作为环境接口. ACE 轮流执行的机制. 拥有 continuous 和 discrete 两种 action space. 多种终止条件.

## 实现方法

### Job 文件

Class:
- JobDistribution
- Job

#### JobDistribution

接收参数:
- Max_job_vec: 一个列表，表示每种资源的最大任务数量
- Max_job_len: 一个整数，表示任务的最大时长
- Job_small_chance: 一个浮点数，表示任务是小任务的概率
- Job_priority_range: 一个列表，表示任务的优先级范围

生成参数:
- Job_len_big_lower: max_job_len * 2 / 3 大任务的最小时长
- Job_len_small_upper: max_job_len / 5 小任务的最大时长
- Dominant_res_lower: np.divide(np.array(max_job_vec), 2) 占主导地位的资源的最小请求量
- other_res_upper: np.divide(np.array(max_job_vec), 5)  其他资源的最大请求量

任务优先级分布: 随机分布

#### Job

### Machine 文件

Class:
- Machine
- Cluster
- Bids
- MachineRestrict

### AllocationMechanism 文件

Class:
- AllocationMechanism
- FirstPrice
- SecondPrice

### Auction 文件

Class:
- ReverseAuction

### Environment 文件

Class:
- VehicleJobSchedulingParameters
- VehicleJobSchedulingEnv
- VehicleJobSchedulingEnvACE