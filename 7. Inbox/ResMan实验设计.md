测试second price的效用
社会总剩余=消费者剩余-生产者剩余

我们考虑了一个由多个车辆和多个服务器构成的公路仿真环境, 由车辆随机向路边的满足信道条件的边缘服务器请求任务, 由车辆对其间的服务器信道进行评估. 任务请求的数量符合泊松分布, 任务类型有存储密集型, 计算密集型, 存储计算密集型, 任务时长有长任务和短任务.


为了实现本论文中多智能体强化学习的环境建模，我们使用了Pettingzoo作为我们实现自定义环境的接口^1。Pettingzoo是一个用于表示一般的多智能体强化学习（MARL）问题的Python库，它包括了多种参考环境、有用的工具和创建自定义环境的方法。Pettingzoo支持Agent Environment Cycle（ACE）模式，它是一种适用于顺序的回合制环境的接口，能够处理任何MARL可以考虑的游戏。在ACE模式下，每个智能体都有自己的观察空间和动作空间，而且只有一个智能体可以在每个时间步骤中执行动作。

^1 source code
### 实验方法


固定机器, 内存优化和计算优化
固定用户

- 内存优化 sku D,E,M
- 计算优化 sku F

因为本次车辆网服务申请的是虚拟机, 所以我们利用[Azure的专用主机](https://learn.microsoft.com/zh-cn/azure/virtual-machines/dedicated-hosts)进行试验. 报价来自[Azure Dedicated Host pricing](https://azure.microsoft.com/en-us/pricing/details/virtual-machines/dedicated-host/).对于云服务提供商来说, 硬盘成本可以包含在服务器成本之中, 对应的如果硬盘使用量不大, 服务器自带硬盘是完全可以满足需要的, 而且作为pay as you go 模式, 硬盘在服务完成后会清空用户数据, 因此不需要额外考虑. 网络成本因为是边缘服务器, 服务器与用户直接相连或者仅有几跳, 网络带宽瓶颈几乎不存在, 所以不考虑网络成本.

市场价格用容器实例价格计算, 成本用3 year plan 计算


大中小服务器确定

|Dedicated Host SKUs|vCPUs|RAM|CPU|Pay as you go|1 year plan|3 year plan|
|---|---|---|---|---|---|---|
|Mdsv2MedMem-Type1|192|2,048 GiB|8280 (Cascade Lake)|$16.582|$11.44  |$5.81  |
|Easv5-Type1|112|768 GiB|EPYC™ 7763v (Milan)|$6.742|$4.59  |$3.49  |
|Fsv2-Type2|72|144 GiB|8168 (Skylake)|$3.804|$2.94  |$2.05  |


平均价格
按照容器实例价格 per hour

|Resource|Price|
|---|---|
|RAM|$0.0045|
|CPU|$0.0405|

5 min 一个slot, 一小时20个slot, 最大请求时间1小时

max job vec 8, 100
max job len 20
job priority range 0, 10
big_machine = MachineType(192, 2048, 29.05)
middle_machine = MachineType(112, 768, 17.45)
small_machine = MachineType(72, 144, 10.25)

- [ ] 添加PPO参数描述
- [ ] 环境下运行多次, seeds
	- [ ] PPO
	- [ ] PPO+LTSM
Avg Reward
