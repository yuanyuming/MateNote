## Deep Reinforcement Learning-Based Workload Scheduling for Edge Computing

- 引言：介绍边缘计算的概念、优势和挑战。
- 方法：提出一种基于深度强化学习（DRL）的工作负载调度方法，采用深度Q网络（DQN）算法来解决工作负载调度问题的复杂性和高维度。
- 结果：通过仿真实验，比较了提出的方法和其他方法在服务时间、虚拟机（VM）利用率和失败任务率方面的性能。
- 结论：总结了提出的方法的优点和贡献，指出了它可以为边缘计算中的工作负载调度问题提供一个有效的解决方案。



## RLScheduler An Automated HPC Batch Job Scheduler Using Reinforcement Learning
- 目前的 HPC 平台仍以批处理作业为主,因此批处理作业调度对效率至关重要。
- 现有的调度器依赖专家设置的启发式优先级函数,缺乏对条件变化的适应性。
- 本文介绍了RLScheduler,这是一种基于强化学习的调度器,可以通过连续的试错学习到好的策略,几乎不需要专家知识。
- RLScheduler引入了新的核心网络结构和轨迹过滤来改进和稳定学习。
- 评估确认RLScheduler可以以相对较低的计算成本学习各种工作负载和目标的高质量策略。
- 学习到的模型即使在面对未见过的工作负载时, 表现也很稳定, 使其可实际应用。



## A Truthful Dynamic Workflow Scheduling Mechanism for Commercial Multicloud Environments

- 云服务提供商的终极目标是增加收入, 这会导致在多云环境下对用户产生负面影响的自私行为。
- 本文提出了考虑成本和完成时间的单任务调度定价模型和真实机制。
- 该机制被扩展用于科学工作流的动态调度, 以最小化完成时间和成本。  
- 从理论上分析了该机制的真实性和效率。
- 实验显示服务提供商的自私行为对系统效率有重大影响。
- 与多目标进化算法得到的帕累托最优解进行了比较。  
- 使用真实和合成工作流的实验表明, 该方法在大多数情况下优于帕累托最优解。


## A Truthful Reverse-Auction Mechanism for Computation Offloading in Cloud-Enabled Vehicular Network
- 智能车辆和计算密集型应用的增长为提供可靠高效的车载服务带来了挑战。
- 将应用从车辆卸载到移动边缘云可以帮助改善,但云服务的资源限制和覆盖范围约束可能仍导致性能不佳。
- 利用附近车辆的资源执行应用可以增强车辆所有者的计算能力,并减轻车载工作量。
- 但是,鼓励车辆之间共享资源仍然是一个敏感问题,因为用户的自私性。
- 本文建立了一个基于Vickrey-Clarke-Groves的反向拍卖机制的计算卸载市场,利用整数线性规划满足真实性和个体理性。
- 由于整数线性规划计算复杂度高,设计了一个具有满意次优解、真实性、个体理性和匹配稳定性的高效单边匹配机制。
- 模拟结果显示, 与基准相比, 所提出的单边匹配机制可以显著提高车辆网络的系统效率。



## An Overview of Multi-Agent Reinforcement Learning from Game Theoretical Perspective
- 2019年是多智能体强化学习(MARL)技术取得重大进展的繁荣年份。
- MARL涉及到在多智能体系统中多个智能体同时学习的问题。它与博弈论、机器学习、随机控制、心理学和优化相关。
- 虽然MARL在解决真实世界游戏中取得了可观的经验成功,但当前文献缺乏阐述MARL博弈论基础以及2010年以来最新进展的自包含概述。
- 本文提供了从博弈论角度对MARL基础知识和最新技术进行全面概述的专著。
- 第一部分涵盖了MARL的基本概念,包括形式化、解决方案和面临的挑战,使零基础读者也能掌握MARL的关键思想。
- 第二部分调研了最近的MARL算法发展,从新的分类体系入手,并着重介绍了几个现代MARL课题,如Q函数分解、软学习、网络MDP、潜在博弈等。每个课题都选择了基础和前沿算法。
- 本文旨在从博弈论视角评估当前 MARL 技术的状况, 为新入门研究者和想获取全景视野的专家服务。


## Applications of Auction and Mechanism Design in Edge Computing A Survey
- 边缘计算作为一种前景技术,可以提供更低的延迟、更高效的传输和更快的数据处理,因为边缘服务器更接近用户设备。
- 每个具有有限资源的边缘服务器可以从附近的用户设备卸载延迟敏感和计算密集型任务。
- 但是,边缘计算面临资源分配、能耗、安全和隐私等挑战。
- 拍卖机制可以在边缘计算的各种约束下很好地描述边缘服务器和用户设备之间的双向互动。
- 正如现有文献所示,在资源稀缺的场景下,拍卖和机制设计方法在满足边缘服务器和用户设备之间的互惠的同时,可以实现最佳的分配策略。
- 本文综述了最近将拍卖方法应用于边缘计算的研究。
- 首先概述了边缘计算的常见范式,如云端、雾计算和移动边缘计算,然后介绍了边缘计算系统中常用的拍卖方案的基础知识。
- 接着,按拍卖方法分类,全面综述了在边缘计算中应用基于拍卖的方法。
- 最后, 讨论了几个开放的挑战和前景研究方向。


## Deep Reinforcement Learning An Overview
- 本文概述了深度强化学习的最近一些令人兴奋的进展。
- 文章讨论了深度强化学习的六个核心要素:价值函数、策略、奖励、模型、规划和探索。
- 还讨论了六种重要机制:注意力、记忆、无监督学习、迁移学习、多智能体强化学习和分层强化学习。
- 接下来回顾了深度强化学习在12个领域的应用,包括游戏(如AlphaGo)、机器人、自然语言处理、计算机视觉、商业、金融、医疗、教育、制造业、电网、交通和计算系统。
- 提到了一些未讨论的话题,并列出了强化学习的相关资源。
- 本文是首个公开可获得的深度强化学习综述, 欢迎评论和反馈, 因为此版本还不完整。


## Deep Reinforcement Learning-Based Workload Scheduling for Edge Computing
- 边缘计算在网络边缘为移动用户提供云计算能力,帮助满足计算和延迟需求。
- 但是,边缘网络有大量设备、高用户流动性、异构应用和间歇性流量。
- 这导致资源分配不平衡,造成任务失败和性能问题。
- 为解决此问题,作者提出了基于深度强化学习的工作负载调度方法。
- 目标是平衡工作负载、降低服务时间和失败任务。
- 使用深度Q网络来处理复杂度和高维度。
- 模拟显示该DRL方法在服务时间、虚拟机利用率和失败任务方面优于其他方法。
- 基于 DRL 的方法可有效解决边缘计算的工作负载调度问题。


## Dynamic Pricing On E-commerce Platform With Deep Reinforcement Learning A Field Experiment
- 本文提出了一个端到端的基于深度强化学习的电商平台动态定价框架。
- 将动态定价问题建模为马尔可夫决策过程,使用四组不同的业务数据表示状态。
- 与现有 DRL 动态定价算法相比,本文的方法有三点贡献:
	1. 将离散价格集扩展到连续价格集。
	2. 定义了一个新的奖励函数收入转换率差异(DRCR),而不仅仅是收入。
	3. 通过预训练解决了 MDP 的冷启动问题。
- 该方法在离线阿里巴巴数据集和2018年开始、持续数月的大规模在线天猫实验中进行评估。
- 这是第一个DRL动态定价实地实验。
- 结果显示 DRCR 比收入更适合作为奖励, 连续价格优于离散价格, 该方法明显优于专家手动定价。


## Intelligent resource allocation management for vehicles network An A3C learning approach
- 提出了一个用于移动车载服务的虚拟化框架,以满足用户对车联网的高速率、低时延和高可靠性的需求。该框架采用了一种基于学习的资源分配方案。
- 使用马尔可夫链对动态变化过程建模,不需要做优化目标假设,降低了资源分配计算的复杂度。
- 提出了一种高性能的异步优势actor-critic学习算法来解决复杂的动态资源分配问题。
- 基于软件定义网络和以信息为中心的网络,该方法可以动态编排计算和通信资源,以提高虚拟无线网络的性能。
- 模拟结果验证了所提出的方案可以快速收敛, 并提高了网络运营商的总体收益。


## Learning to Bid with AuctionGym
- 在线广告拍卖是每天在网上以百亿次交易的规模进行的。参与这些拍卖的广告商需要决定一个竞价策略:对一个给定的广告展示机会他们愿意出多少价。决定这样一个策略并非一件简单的事,因为重复拍卖机制的互动性和反应性。
- 广告商不能观察到没有提交的出价对应的反事实结果,成功的广告商会根据竞争对手的出价调整自己的策略。这些特征使得仅依据日志数据就有效地学习和评估竞价策略变得复杂。
- 拍卖问题的互动性和反应性适合采用老虎机或强化学习方法,其中竞价策略可以被优化以最大化累积奖励。然后一些设计选择需要被做出,关于参数化、基于模型或无模型方法,以及目标函数的表述。
- 本工作为这类“学习出价”方法提供了一个统一的框架,展示了许多现有方法属于基于价值的范式。我们然后引入了新的基于策略和双健壮的拍卖问题表述。
- 为了不依赖敏感的专有数据而允许可靠和可重现的离线验证, 我们引入了 AuctionGym: 一个支持使用老虎机学习竞价策略的模拟环境。我们呈现了在各种环境条件下的一套实验结果, 揭示了可指导从业者选择模型类别的见解。实证观察突出了我们新提出的方法的有效性。AuctionGym 在开源许可下发布, 我们期望研究社区可以从这个工具中获益。


## Multi ‑agent deep reinforcement learning a survey
- 尽管在强化学习取得巨大进展的过程中,多智能体领域被单智能体所掩盖,但多智能体强化学习正在迅速发展,最新的成就解决了具有真实世界复杂性的问题。
- 本文概述了多智能体深度强化学习领域的当前发展。我们主要关注最近几年将深度强化学习方法与多智能体场景相结合的文献。
- 为了考察构成当代格局的工作,主要内容分为三部分。第一,我们分析了用于训练多个智能体的训练方案的结构。第二,我们考虑了在合作、竞争和混合场景中智能体行为的新兴模式。第三,我们系统地列举了多智能体领域中独有的挑战,以及用于应对这些挑战的方法。
- 最后, 我们讨论了进展、确定了趋势, 并概述了这个研究领域未来工作的可能方向。


## Performance and Cost-Efficient Spark Job Scheduling Based on Deep Reinforcement Learning in Cloud Computing Environments
- Spark 和 Hadoop 等大数据框架被广泛采用于研究和工业中的分析任务。云提供了易于管理的可负担计算资源。因此,许多组织正在向云部署其大数据计算集群转变。
- 然而,在满足各种服务级别协议(SLA)目标(如降低货币成本和提高作业性能)的前提下,作业调度是一个复杂的问题。大多数现有研究没有同时解决多个目标,也未能捕捉到固有的集群和工作负载特性。
- 在本文中,我们对云部署的Spark集群的作业调度问题进行了建模,并提出了一个新颖的强化学习(RL)模型来适应SLA目标。我们开发了RL集群环境,并在TF-Agents框架中实现了两种基于深度强化学习(DRL)的调度程序。
- 提出的基于DRL的调度代理在细粒度层面工作,在放置作业的执行器时利用了云VM实例的定价模型。此外,基于DRL的代理还可以学习不同类型作业的固有特征,以找到适当的放置位置来降低集群VM使用成本和平均作业持续时间。
- 结果表明, 所提出的基于 DRL 的算法可以将 VM 使用成本降低高达30%。


## PettingZoo Gym for Multi-Agent Reinforcement Learning
-  本文介绍了PettingZoo库和配套的Agent Environment Cycle(AEC)游戏模型。PettingZoo是一个包含多种多智能体环境的库,具有通用优雅的Python API。PettingZoo的开发目标是通过使工作更互换、可访问和可重复性来加速多智能体强化学习(MARL)研究,类似于OpenAI的Gym库为单智能体强化学习所做的。
- PettingZoo 的 API 在继承了 Gym 的许多特性的同时, 其基于新颖的 AEC 游戏模型使其成为 MARL API 中独一无二的。我们通过案例研究论证, 流行的 MARL 环境中常用的游戏模型对这些游戏的概念建模很差, 并因此可能导致难以检测的令人困惑的 bug, 而 AEC 游戏模型解决了这些问题。


## Price-Based Resource Allocation for Edge Computing A Market Equilibrium Approach
- 新兴的边缘计算范式有望提供卓越的用户体验,并支持广泛的物联网(IoT)应用。本文提出了一个新的基于市场的框架,用于有效地将异构容量受限的边缘节点(EN)的资源分配给网络边缘的多个竞争服务。
- 通过对地理分布式EN进行适当定价,所提出的框架生成市场均衡(ME)解,该解不仅最大化了边缘计算资源利用,还在服务的预算约束下向服务分配了最佳资源束。
- 当服务的效用定义为服务从其资源分配中获得的最大收入时,均衡可以通过解决Eisenberg-Gale(EG)凸规划问题集中计算。
- 我们进一步证明均衡分配是帕累托最优的,并满足期望的公平性属性,包括共享激励、比例性和无妒忌。还引入了两个有效收敛到ME的分布式算法。
- 当每个服务的目标是最大化其净利润 (即收入减成本), 而不是收入时, 我们导出了一个新的凸优化问题, 并严格证明其解恰好是一个 ME。广泛的数值结果验证了所提出技术的有效性。


## Resource Management with Deep Reinforcement Learning
- 系统和网络中的资源管理问题通常表现为困难的在线决策任务,其中合适的解决方案取决于对工作负载和环境的理解。
- 受到最近深度强化学习在AI问题上的进展的启发,我们考虑构建从经验中直接学习管理资源的系统。
- 我们提出了DeepRM,一个将具有多个资源需求的任务打包问题转化为学习问题的示例解决方案。
- 我们的初始结果表明,DeepRM的表现与最先进的启发式方法相当,适应不同的条件,快速收敛,并学习出事后看来合理的策略。
- 这为构建适应复杂现实世界约束的自学习管理系统提供了有希望的路径。

## Reverse Auction-based Computation Offloading and Resource Allocation in Mobile Cloud-Edge Computing
-  本文提出了一种新颖的基于反向拍卖的计算卸载和资源分配机制,称为RACORAM,用于移动云边缘计算。其基本思想是云服务中心(CSC)招募边缘服务器所有者来替代它为附近的资源受限移动设备(MD)提供卸载计算。
- 在RACORAM中,反向拍卖用于激励边缘服务器所有者参与卸载过程,并将基于反向拍卖的计算卸载和资源分配问题形式化为一个混合整数非线性规划(MINLP)问题,目的是最小化CSC的成本。
- 原问题被分解为等价的主问题和子问题,并提出了低复杂性算法来解决相关的优化问题。具体而言,首先提出了一个受约束的梯度下降分配方法(CGDAM)来确定计算资源分配策略,然后提出了一个基于贪心随机自适应搜索过程的中标调度方法(GWBSM)来确定计算卸载策略。
- 同时, 也给出了 CSC 对获胜边缘服务器所有者的支付确定。进行了模拟来评价 RACORAM 的性能, 结果表明 RACORAM 非常接近最优方法, 计算复杂性大大降低, 并在不同场景下降低了 CSC 的成本, 大大优于其他基准方法。


## Scheduling of Time-Varying Workloads Using Reinforcement Learning
- 在共享计算集群上运行的生产工作负载的资源使用量通常会随时间大幅波动。当同一台机器上运行的两个工作负载的资源使用量同时峰值时会导致性能下降,而机器中的未使用资源会导致浪费和计算集群不理想的运营特性。
- 以前的工作没有考虑这种时间资源波动或它们的对齐用于调度决策。由于各种时间变化的工作负载及其复杂的资源使用特性,很难为在集群中的不同机器上对其进行优化调度设计明确定义的启发式方法。
- 在本文中,我们提出了一种基于深度强化学习(DRL)的方法,以利用时间变化工作负载的各种时间资源使用模式,以及一种在大量生产工作负载中创建等价类的技术,以提高我们方法的可扩展性。
- 使用来自谷歌和阿里巴巴的真实生产跟踪的验证表明,与基线相比,我们的技术可以显着改进集群的运营卓越指标 (例如利用率、碎片化、资源耗尽等)。


## Three Dynamic Pricing Schemes for Resource Allocation of Edge Computing for IoT Environment
- 随着物联网(IoT)的广泛应用,边缘计算近年来作为一种有望解决个人 IoT 数据低延迟和安全问题的技术而兴起。
- 在这方面,许多工作关注于边缘计算服务器的计算资源分配,一些研究还针对资源分配进行了定价方案。然而,很少有文献尝试对各种定价方案进行比较。
- 此外,一些方案存在局限性,如差异化定价方案的公平性问题。为解决这些局限性,本文考虑了边缘计算IoT环境的资源分配的三种动态定价机制及其比较分析:基于出价的比例分配机制(BID-PRAM)、统一定价机制(UNI-PRIM)和公平求异定价机制(FAID-PRIM)。
- BID-PRAM新提出以克服基于拍卖的定价方案的局限性;UNI-PRIM是一种基本的统一定价方案;FAID-PRIM新提出以解决差异化定价方案的公平性问题。
- 结果验证了所提出的理论, 并对三种机制进行了比较分析。通过这些分析, 确定了每个模型的优势和劣势, 为边缘计算服务提供商提供了有关各种定价方案的指导。



## 工作负载调度
- [x]  Deep Reinforcement Learning-Based Workload Scheduling for Edge Computing
- [x] RLScheduler An Automated HPC Batch Job Scheduler Using Reinforcement Learning  
- [x] Performance and Cost-Efficient Spark Job Scheduling Based on Deep Reinforcement Learning in Cloud Computing Environments
- [x] Scheduling of Time-Varying Workloads Using Reinforcement Learning

这些文献都研究了如何使用强化学习来进行工作负载的调度, 以提高性能、降低成本等。

## 资源分配与定价
- [x] Price-Based Resource Allocation for Edge Computing A Market Equilibrium Approach
- [x] Three Dynamic Pricing Schemes for Resource Allocation of Edge Computing for IoT Environment
- [x] Resource Management with Deep Reinforcement Learning
- [x] Intelligent resource allocation management for vehicles network An A 3 C learning approach

这些文献探讨了如何利用市场均衡、拍卖等机制和强化学习进行资源的分配和定价。

## 反向拍卖计算卸载
- [x] Reverse Auction-based Computation Offloading and Resource Allocation in Mobile Cloud-Edge Computing  
- [x] A Truthful Reverse-Auction Mechanism for Computation Offloading in Cloud-Enabled Vehicular Network

这两篇文章专注于使用反向拍卖机制进行移动云边缘计算中的计算卸载。

## 动态定价
- [x] Dynamic Pricing On E-commerce Platform With Deep Reinforcement Learning A Field Experiment

这篇文章在电商平台上实际应用了基于强化学习的动态定价。

## 拍卖机制
- [x] Applications of Auction and Mechanism Design in Edge Computing A Survey
- [x] Learning to Bid with AuctionGym

这两篇综述拍卖机制在边缘计算中的应用, 以及使用强化学习进行出价学习。

## 强化学习
- [x] Multi‐agent deep reinforcement learning a survey  
- [x] An Overview of Multi-Agent Reinforcement Learning from Game Theoretical Perspective
- [x] PettingZoo Gym for Multi-Agent Reinforcement Learning

这三篇文章对多智能体强化学习进行了不同角度的综述。

## 其它
- [x] Deep Reinforcement Learning An Overview  
- [x] A Truthful Dynamic Workflow Scheduling Mechanism for Commercial Multicloud Environments

第一篇是深度强化学习的概述, 第二篇是关于科学工作流的调度机制。