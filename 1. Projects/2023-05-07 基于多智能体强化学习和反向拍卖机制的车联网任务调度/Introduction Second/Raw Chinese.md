## Content

1. 先前研究概述
2. 现有方案局限性
3. 方法论
4. 论文的贡献

## 先前研究概述

在欧洲5G基础设施公私合作伙伴关系（PPP）的认证中，边缘计算（MEC）被确认为下一代5G网络的关键技术[^e9]。车辆边缘计算的创新重点在于通过将任务卸载到边缘服务器的道路边单元（RSU）来节省能耗并提升计算速度，当前的研究主要关注任务卸载算法的设计，以最小化响应时间或能耗。

MEC技术在车联网（IoV）中发挥着关键作用，其优势包括低延迟、高带宽、实时无线网络信息和位置感知[^e7]。在基于MEC的IoV中，计算任务从移动车辆卸载到网络边缘节点，以满足对超低延迟的需求，通过卸载到MEC服务器提高任务处理速度并节省设备能量[^e8]。

此外，MEC技术不仅在车联网中推动了计算任务的下沉，将云服务提供至无线接入网络的边缘，为行驶中的车辆提供计算服务[^e10]，而且在基于MEC的物联网中，设备可将计算任务卸载到MEC服务器，以提升任务处理速度并实现设备能量的节省[^55][^56][^57]。

未来的发展将更加关注系统的稳定性、适应性和性能优化，以更好地满足移动用户的需求[^e9]。


在移动边缘服务器和任务调度领域，不断涌现的技术和算法为应对高用户密度和资源限制等挑战提供了创新的解决方案。任务卸载算法的设计方面，各种方法如自适应算法、契约理论建模、深度强化学习等针对不同优化目标（如最小化延迟、最大化计算和通信速率、节能减排等）得到提出[^c5][^c8]。

在传统方法处理MEC中的任务调度问题方面，包括凸逼近[^61]，[^62]，博弈论[^64]，[^65]和元启发式算法[^60]，[^66]，但这些方法在大规模场景中面临挑战，如指数增长的搜索空间和沉重的计算负担。

VEC中现有的任务调度算法涵盖了多种方向，如能效调度算法、基于蚁群优化的算法、部分卸载调度和功率分配、面向计算密集型和时间敏感应用的算法[^c7][^c13][^c14][^c15]。以具体例子而言，Dai等人[^f25]提出了一种联合最优的VEC服务器选择和卸载算法，以最大化系统效用，同时，Zhou等人[^ewo]则提出了一种基于交替方向乘子法的能效资源分配算法。

当前研究主要关注移动边缘计算网络中的资源管理问题。先前的研究通常假设MEC服务器具有无限资源，但实际应用需要考虑服务器资源的限制。研究重点包括单服务器和多服务器情境下的集中和分布式资源管理算法。其中，Lyu等人[^b13] 提出了一种半分布式方法，使用启发式卸载算法（HODA），在复杂性可接受的情况下实现了卓越的系统效用。Li等人[^b16] 设计了一个基于集中式深度强化学习（DRL）的模型，但面临着行动空间激增的挑战。Chen等人[^b7] 应用了基于多智能体策略的DRL模型，以减小行动空间的维度，但这增加了计算能力较弱设备的复杂性。

大量文献集中在设计不同性能要求下的最佳策略 [^f18][^f19][^f20][^f21]。为了实现物联网网络的长期能效，[^f18] 提出了一种高效的边缘计算基础设施。[^f19] 针对随机任务到达、无线信道变化、拥塞的空中接口和禁止性反馈，提出了对网络知识陈旧具有容忍性的渐近最优调度，减轻了对反馈的严格要求。此外，[^f20] 和 [^f21] 分别提出了MEC的最优调度解决方案和能效资源分配策略。

研究重点还包括增强MEC网络的工作负载承载能力，包括集中式联合优化方法[^b10][^b11][^b12] 和涉及用户之间非合作游戏的分布式方法[^b8]。有些模型考虑了地理近距离[^b24]。设计了一种模型，边缘设备仅连接到附近的服务器，通过标准化的有线接口（Mp3）在服务器之间中继工作负载，实现了多服务器系统[^b25]。Qian等人[^b14] 设计了一个分布式算法和一个用于统计和动态信道场景的集中式在线DRL解决方案，分别优化了选择具有最小化传输成本的接入点。

在物联网系统中，车辆作为重要的用户设备，研究人员广泛探索了车辆边缘计算网络的结构和资源分配方法 [^f22][^f23][^f24][^f25][^f26]。具体地，C. Wang等人提出了一种可扩展的SDN启用的MEC架构，以减少总体延迟并卸载骨干网络的流量负载 [^f22]。为了解决计算卸载的延迟和传输成本，[^f23] 提出了一种面向车辆网络的基于云的MEC卸载框架。在 [^f24] 中，提出了一种基于MEC辅助的车辆卸载模式的目标服务器选择策略，旨在提高在车辆数据传输失败的情况下任务卸载的可靠性。在 [^f25]、[^f26] 中提出了新颖的基于MEC的车辆网络，并为不同场景设计了精心的计算卸载策略。


为了克服传统方法的局限性，一些创新性的方法被提出。其中之一是将多主体强化学习与反拍卖机制相结合。这个创新的目标是实现最佳资源匹配，通过促进车辆之间的合作，最小化整体成本。这种方法的优势在于能够更灵活地适应动态环境，并提供更智能、协同的任务调度策略。

利用深度神经网络（DNNs）的强大功能[^68]，[^69],[^71]，深度强化学习方法在处理具有连续动作空间的动态优化问题方面显示出潜力。

强化学习被用于车辆云中的长期资源供应，以解决资源的动态需求和严格的服务质量（QoS）要求 [^f27]。





总体而言，MEC在移动边缘计算和车联网领域的研究和创新持续推动着技术的进步，为解决实际问题提供了多样化的解决途径。各种任务卸载和调度算法的不断创新为解决资源限制和用户密度增加等挑战提供了有效的解决方案 [^e9].

**任务调度:**

在边缘云计算中，普遍采用的方法包括模糊逻辑和机器学习。一种基于随机优化的分布式资源调度方法已经得到广泛研究[^24][^26][^27][^1]。然而，面临的挑战包括预定义的模糊规则、设计时间要求和静态的全局视角。传统的机器学习方法依赖于现有的调度数据，以减少手动干预，但这种方法可能缺乏对新环境的适应性。为了应对环境变化，一些研究倾向于利用在模拟环境中训练的强化学习代理，提供更灵活的解决方案[^32]。

**拍卖机制:**

最近的研究关注于车载网络中的拍卖机制，旨在制定公平的资源价格确定和高效分配的多样化机制。在移动边缘计算（MEC）领域，不断发展的研究包括在线激励驱动的任务分配方案[^3]和分布式激励机制[^5]。基于拍卖的激励机制在MEC资源分配中得到广泛应用，其中实际组合的双向拍卖机制是一个例子[^6]。引入基于反拍卖的机制，用于计算卸载和移动边缘计算中的资源分配问题[^42]。

**强化学习:**

强化学习（RL）方法在解决多约束过程调度问题方面得到广泛应用[^9][^10]。这些方法利用了博弈论和多主体训练技术中的均衡概念，以解决多约束和多目标优化问题。例如，一些研究使用基于RL的方法进行云科学工作流调度[^2]，同时DeepRM是一种用于系统资源管理的强化学习方法[^12]。


## 现有方案局限性

在基于MEC的车联网中，解决挑战是当前学术界的研究重点，主要涉及架构设计、任务卸载方案和资源管理方案。其中，主要技术挑战之一是确定何时、是否以及有多少计算任务应该被卸载。

在车辆边缘计算（VEC）中，任务调度成为一个关键问题，其挑战在于地理差异导致边缘服务器负载不平衡。已有的调度算法着眼于能效、蚁群优化和计算密集型应用等不同方向。同时，对RSU的能源效率策略的研究涵盖了休眠策略和联合小区关联等方法，以最大程度降低能耗 [^c7].

为了应对面临的挑战，研究人员和工程师采用了多种常见方法。其中之一是使用模糊逻辑，然而，这种方法需要预定义模糊规则的公式，受制于静态专业知识，可能无法很好地适应动态环境。另一种常见方法是机器学习，但由于数据集的陈旧或普遍性不足，可能会在调整任务调度策略时面临一些问题。

然而，在现有文献中，车辆主要充当MEC网络中的用户，可能导致由于庞大数量的用户设备的服务请求而产生“服务空白”。因此，本文重点设计了一种车辆边缘计算（VEC）网络，使车辆能够在传统边缘服务器之外提供计算服务。传统的边缘服务器连接到固定位置，而提出的架构旨在扩展计算服务范围，增强移动边缘计算网络的灵活性。

**IoV任务调度中的挑战:**

在物联网车辆（IoV）任务调度领域，存在一些显著的挑战需要克服。首先，车辆的动态性使得任务调度变得更加复杂，因为车辆的位置、状态和可用性不断变化。其次，波动的网络条件也是一个问题，由于网络连接的不稳定性，任务调度可能受到影响。此外，任务的及时性和复杂性增加了调度的难度，需要在有限的时间内完成复杂的任务。最后，异构资源的限制意味着不同车辆可能具有不同的性能和能力，需要有效地分配任务以最大程度利用可用资源。


**1. 介绍:**

   - 任务的随意卸载可能导致边缘服务器之间的工作负载不平衡。
   - 导致服务器收入减少和用户效用受损。
   - 在边缘服务器之间进行任务调度对于优化服务质量和资源效率至关重要。

**2. 目标:**

   - 研究基于任务需求和预算考虑的任务调度策略。
   - 将具有不同特性的任务从车辆卸载到合适的节点。
   - 提高用户满意度、边缘服务器收入和资源利用率。

   - "管理频谱，计算，存储，对用户进行任务卸载决策。[^a15][^a16][^a17]"
   - "使用传统方法，联合优化任务卸载，[^a10]，[^a15]"
   - "大多数只考虑一到两个维度资源，无法直接支持高纬度资源需求控制计算任务。[^a7]"
   - "侧重于低移动性用户的多维资源管理。[^a18]，[^a19]"
   - "MEC车联网中，车辆的高度移动性和资源需求时变性，多维资源管理计算复杂性增加。"
   - "纯优化方法在延迟敏感应用变得不可行，特别是计算复杂性较大的情况。"
   - 1. 往往忽视了边缘设备和服务器之间的地理近距离，影响了流量分布。
3. 基于DRL的解决方案可能面临不明确的行动空间激增。
4. 缺乏对长期资源平衡的考虑，阻碍了网络资源利用的进一步提高。

- **现有工作中的差距:**
  - 现有工作主要集中在任务卸载算法设计上，对任务调度的关注有限。
  - 这些工作中没有考虑边缘服务器转入休眠状态的可能性。
- **挑战和MEC服务器引入在车联网中的应用：**
  - 针对一些应用的严格延迟要求以及车辆与云计算服务器之间的无线和有线通信的巨大延迟，有时将车辆任务卸载到云计算服务器是不可行的[^d13][^d14][^d15]。
  - 与此同时，物理增加车载资源的数量会导致车辆制造成本的严重增加。
  - MEC服务器作为云计算服务器的扩展，将计算和缓存功能移到用户设备附近 [^d16][^d17][^d18][^d19]。
  - 它允许车辆通过多种无线通信技术将任务卸载到它。
  - 通过减少MEC和云计算服务器之间的通信时间，可以满足卸载任务的敏感延迟要求。
  - 然而，每个MEC装载的基站（BS）中的计算/缓存资源量通常是预设的，而车辆用户的资源需求是时变的，这在仅由MEC装载的BS支持的车辆场景中会导致资源的浪费或低使用率问题，尤其是在由一些社交活动或事件引起的突发流量存在时。
  - 许多领先公司启动的不同项目中也考虑了相关应用 [^d21]。
- **MEC-Based车联网的挑战:**
  - 在基于MEC的车联网中，存在各种计算密集型和延迟敏感的任务。
  - 每个任务都具有不同的资源需求，包括计算和通信资源。
- **需要卸载策略和资源控制:**
  - 需要合适的策略来控制卸载任务，确保系统的正常运行。
  - 考虑卸载决策和资源分配对计算卸载性能的影响。

车辆位置的地理差异导致边缘服务器负载不平衡，从而引起高延迟和能耗增加。少数现有工作考虑VEC系统中的任务调度算法。


## 方法论

**6. 多主体强化学习:**

   - 先进的机器学习技术。
   - 多个代理协同利用深度学习技术。
   - 使车辆能够基于本地和全局信息自主学习和更新任务调度策略。

**7. 反拍卖机制:**

   - 资源交易机制。
   - 卖方（边缘服务器）根据潜在买方（车辆）的报价选择合适的交易。
   - 通过资源分配和价格协商促进合作。
   - 目标: 在竞争和合作之间取得平衡，增强系统效率，确保公平性，并促进合理的资源分配。

   - "人工智能，强化学习作为快速资源管理的解决方案。[^a20][^a21][^a22][^a23]"
   - "在这些方法的启发下，并考虑到动态的车辆网络环境，本文研究了使用深度RL来共同管理频谱、计算和存储资源，以支持基于MEC的车联网中对延迟敏感的应用 [^a12]。"
   - 本文提出了一种针对用户设备（UEs）的高效计算卸载方案，考虑到由UEs生成的计算任务的延迟。

- 制定了一个优化问题，旨在最大化提出的VEC网络的总效用。
- 车辆通信环境中的随机流量和通信不确定性是需要解决的关键挑战。
- 选择了Q学习方法，这是一种无模型的强化学习方法，由于其适用于车辆边缘计算网络中环境元素未知的问题 [^f32]。
- 本文引入了深度强化学习（DRL），使用深度神经网络来近似Q函数，提供更高的性能和更强大的学习 [^f33][^f34][^f35][^f36]。
- 将提出的问题进一步制定为半马尔可夫过程，并提出了两种强化学习方法（Q学习和DRL）来确定计算卸载和资源分配的策略。
- **传统DDPG的缺点:**
  - 演员和评论家网络都依赖于全连接网络（FCNs）。
  - FCNs存在缺点：大量的可训练参数，使训练困难，以及仅具有提取全局判别状态和动作策略特征的有限能力。
  - 忽视任务序列的时间变化，可能忽视用于函数逼近的有用的形状特征。
  - 从回放缓冲区均匀采样经验转换，将所有经验视为相等，而不考虑其重要性。
- **引入TADPG:**
  - 引入时序注意力确定性策略梯度（TADPG）以解决传统DDPG的缺点。
  - 设计用于动态MEC环境中的分散JCORA问题。
  - TADPG代理部署在每个移动设备（MD）上，以降低与集中式方法相比的控制成本。
  - 更适用于大规模场景。
- - **拍卖机制:**
  - 设想一个具有多个拍卖组的卸载市场，每个组包含买方（服务请求者）和卖方（服务提供者）。
  - 这些组由中央经纪人（RSUs）管理，采用创新策略确保拍卖的真实性和个体合理性。
  - - 针对上述挑战，提出了一种计算卸载资源分配方案。
  - 该方案利用MEC系统中的强化学习来优化卸载决策和资源分配，以应对任务和资源需求的动态多样性。

## 论文的贡献

本文的主要贡献概述如下：

- 实施了IoV背景下任务调度问题的建模，制定了基于多主体强化学习和反拍卖机制的边缘服务器资源调度方法。
- 运用反拍卖方法解决IoV中的任务调度问题，实现了分布式、自适应的任务调度解决方案。
- 设计了一个利用PPO+LSTM的出价策略，利用LSTM的记忆能力捕捉任务调度中的时态特征和长期依赖关系。该策略旨在提高竞标过程的性能和有效性。
- 进行了模拟实验，验证了所提方法的有效性和优越性。此外，评估了强化学习和反拍卖机制的优势和适用性，并与其他基准方法进行了比较。

   - "在这些方法的启发下，并考虑到动态的车辆网络环境，本文研究了使用深度RL来共同管理频谱、计算和存储资源，以支持基于MEC的车联网中对延迟敏感的应用 [^a12]。"
   - - 调查了基于VCG的反向拍卖机制，用于V2V计算卸载。

- 处理信号覆盖限制、资源约束以及诸如机会连接和不同的V2V信道条件等特定特征。
- 解决了云启用的车载网络中的问题，包括机会连接和不同的V2V信道条件。
- 设想了一个具有中央经纪人管理的卸载市场，以实现经济效益7.\4。




[^ewo]:Z. Zhou, P. Liu, Z. Chang, C. Xu, and Y. Zhang, “Energy-efficient workload offloading and power control in vehicular edge computing,” in Proc. IEEE Wireless Commun. Netw. Conf. Workshops (WCNCW), Apr. 2018, pp. 191–196. 
[^51]:Jabri I, Mekki T, Rachedi A et al (2019) Vehicular fog gateways selection on the internet of vehicles: a fuzzy logic with ant colony optimization based approach. Ad Hoc Netw 91(08):1–16
[^52]:Lianyong Qi, Wanchun Dou, Chunhua Hu, Yuming Zhou and Jiguo Yu. A Context-aware Service Evaluation Approach over Big Data for Cloud Applications, IEEE Transactions on Cloud Computing, 2015. DOI: https://doi.org/10.1109/TCC.2015.2511764
[^41]: Applications of Auction and Mechanism Design in Edge Computing A Survey
[^42]:Zhou, H., Wu, T., Chen, X., Guo, D., & Wu, J. (n.d.). Reverse Auction-based Computation Offloading and Resource Allocation in Mobile Cloud-Edge Computing.
[^31]:Wang X, Wang X, Liang C, Huang C. A Survey on Mobile Edge Networks: Convergence of Computing, Caching and Communications. IEEE Access. 2017;5:6757-74.
[^32]:Shyalika C, Silva T, Karunananda A. Reinforcement Learning in Dynamic Task Scheduling: A Review. SN Computer Science. 2020 Sep;1(5):1-9.
[^24]:  WANG C, LIANG C, YU F R, et al. Computation Offloading and Resource Allocation in Wireless Cellular Networks With Mobile Edge Computing[J/OL]. IEEE Transactions on Wireless Communications, 2017, 16(8): 4924-4938. DOI:10.1109/TWC.2017.2703901.
[^25]:  URGAONKAR R, WANG S, HE T, et al. Dynamic service migration and workload scheduling in edge-clouds[J/OL]. Performance Evaluation, 2015, 91: 205-228. DOI:10.1016/j.peva.2015.06.013.
[^26]:  SORKHOH I, EBRAHIMI D, ATALLAH R, et al. Workload Scheduling in Vehicular Networks With Edge Cloud Capabilities[J/OL]. IEEE Transactions on Vehicular Technology, 2019, 68(9): 8472-8486. DOI:10.1109/TVT.2019.2927634.
[^27]:  ZHANG Q. Multihop Transmission-Oriented Dynamic Workflow Scheduling in Vehicular Cloud[J/OL]. Wireless Communications and Mobile Computing, 2022, 2022: 1-14. DOI:10.1155/2022/2033644.
[^1]:Sonmez C, Ozgovde A, Ersoy C (2019) Fuzzy Workload Orchestration for Edge Computing. IEEE Trans Netw Serv Manag 16(2):769–782. <https://doi>.org/10.1109/TNSM.2019.2901346
[^3]: W. Hou, H. Wen, N. Zhang, J. Wu, W. Lei, and R. Zhao, "IncentiveDriven Task Allocation for Collaborative Edge Computing in Industrial Internet of Things," IEEE Internet Things J., vol. PP, no. 99, pp. 1-1, 2021.
[^4]: L. Li, T. Q. S. Quek, J. Ren, H. H. Yang, Z. Chen, and Y. Zhang, "An Incentive-Aware Job Offloading Control Framework for Multi-Access Edge Computing," IEEE Trans. Mobile Comput., vol. 20, no. 1, pp. 63-75, 1 Jan. 2021.
[^5]: R. Chattopadhyay, and C. Tham, "Fully and Partially Distributed Incentive Mechanism for a Mobile Edge Computing Network," IEEE Trans. Mobile Comput., vol. PP, no. 99, pp. 1-1, 2020.
[^6]: L. Ma, X. Wang, X. Wang, L. Wang, Y. Shi and M. Huang, "TCDA: Truthful Combinatorial Double Auctions for Mobile Edge Computing in Industrial Internet of Things," IEEE Trans. Mobile Comput., vol. PP, no. 99, pp. 1-1, 2021.
[^7]: W. Sun, J. Liu, Y. Yue, and H. Zhang, "Double Auction-Based Resource Allocation for Mobile Edge Computing in Industrial Internet of Things, " IEEE Trans. Ind. Inf., vol. 14, no. 10, pp. 4692 - 4701, 2018.
[^8]: G. Gao, M. Xiao, J. Wu, H. Huang, S. Wang, and G. Chen, "Auction based VM allocation for deadline-sensitive tasks in distributed edge cloud," IEEE Trans. Services Comput., vol. PP, no. 99, pp. 1-1, 2020.
[^9]: .Kang Yang, Rongyu Cao, Yueyuan Zhou, Jiawei Zhang, En Shao, Guangming Tan, "Deep Reinforcement Agent for Failure-aware Job scheduling in High-Performance Computing", *2021 IEEE 27th International Conference on Parallel and Distributed Systems (ICPADS)*, pp.442-449, 2021.
[^10]: Seiju Yasuda, Chonho Lee, Susumu Date, "An Adaptive Cloud Bursting Job Scheduler based on Deep Reinforcement Learning", *2021 International Conference on High Performance Big Data and Intelligent Systems (HPBD&IS)*, pp.217-224, 2021.
[^2]:Nascimento A, Olimpio V, Silva V, Paes A, de Oliveira D (2019) A Reinforcement Learning Scheduling Strategy for Parallel Cloud-Based Workflows. In: 2019 IEEE International Parallel and Distributed Processing Symposium Workshops (IPDPSW). pp 817–824. <https://doi.org/10.1109/> IPDPSW.2019.00134
[^11]: Li X, Zhang Y, Wang Y, Zhang J. Cluster-Enabled Cooperative Scheduling Based on Reinforcement Learning for Vehicular Networks. IEEE Transactions on Vehicular Technology. 2020 Oct 26;70(1):1018-30.
[^12]:Mao, Hongzi, Mohammad Alizadeh, Ishai Menache, and Srikanth Kandula. 2016. “Resource Management with Deep Reinforcement Learning.” In Proceedings of the 15th ACM Workshop on Hot Topics in Networks. doi:10.1145/3005745.3005750.
[^13]:Jeunen, Olivier, et al. Learning to Bid with AuctionGym.
[^14]: Erich Kutschinski, Thomas Uthmann, and Daniel Polani. Learning competitive pricing strategies by multi-agent reinforcement learning. Journal of Economic Dynamics and Control, 27(11-12):2207–2218, 2003.
[^a7]: H. Peng, L. Liang, X. Shen, and G. Y. Li, “Vehicular communications: A network layer perspective,” IEEE Trans. Veh. Technol., vol. 68, no. 2, pp. 1064–1078, Feb. 2019.
[^a10]: J. Wang, D. Feng, S. Zhang, J. Tang, and T. Q. Quek, “Computation offloading for mobile edge computing enabled vehicular networks,” IEEE Access, vol. 7, pp. 62 624–62 632, May 2019.
[^a15]: J. Zhao, Q. Li, Y. Gong, and K. Zhang, “Computation offloading and resource allocation for cloud assisted mobile edge computing in vehicular networks,” IEEE Trans. Veh. Technol., vol. 68, no. 8, pp. 7944–7956, Aug. 2019. 
[^a16]: Y. Liu, H. Yu, S. Xie, and Y. Zhang, “Deep reinforcement learning for offloading and resource allocation in vehicle edge computing and networks,” IEEE Trans. Veh. Technol., vol. 68, no. 11, pp. 11 158–11 168, Nov. 2019.
[^a12]: H. Peng, Q. Ye, and X. Shen, “SDN-based resource management for autonomous vehicular networks: A multi-access edge computing approach,” IEEE Wireless Commun., vol. 26, no. 4, pp. 156–162, Aug. 2019.
[^a17]: H. Peng, Q. Ye, and X. Shen, “Spectrum management for multi-access edge computing in autonomous vehicular networks,” IEEE Trans. Intell. Transp. Syst., vol. 21, no. 7, pp. 3001–3012, Jul. 2020.
[^a18]: Y. Wei, F. R. Yu, M. Song, and Z. Han, “Joint optimization of caching, computing, and radio resources for fog-enabled IoT using natural actorcritic deep reinforcement learning,” IEEE Internet Things J., vol. 6, no. 2, pp. 2061–2073, Apr. 2019.
[^a19]: J. Zhang et al., “Joint resource allocation for latency-sensitive services over mobile edge computing networks with caching,” IEEE Internet Things J., vol. 6, no. 3, pp. 4283–4294, Jun. 2019.
[^a20]: H. Li, K. Ota, and M. Dong, “Deep reinforcement scheduling for mobile crowdsensing in fog computing,” ACM Trans. Internet Technol., vol. 19, no. 2, pp. 1–18, Apr. 2019.
[^a21]: L. Liang, H. Ye, G. Yu, and G. Y. Li, “Deep-learning-based wireless resource allocation with application to vehicular networks,” Proc. IEEE, vol. 108, no. 2, pp. 341–356, Feb. 2020. 
[^a22]: C. Jiang, H. Zhang, Y. Ren, Z. Han, K.-C. Chen, and L. Hanzo, “Machine learning paradigms for next-generation wireless networks,” IEEE Wireless Commun., vol. 24, no. 2, pp. 98–105, Apr. 2017. 
[^a23]: Y. He et al., “Deep-reinforcement-learning-based optimization for cache-enabled opportunistic interference alignment wireless networks,” IEEE Trans. Veh. Tech., vol. 66, no. 11, pp. 10 433–10 445, Nov. 2017. 
[^a24]: T. Q. Dinh, Q. D. La, T. Q. Quek, and H. Shin, “Learning for computation offloading in mobile edge computing,” IEEE Trans. Commun., vol. 66, no. 12, pp. 6353–6367, Dec. 2018. 
[^a25]: L. T. Tan and R. Q. Hu, “Mobility-aware edge caching and computing in vehicle networks: A deep reinforcement learning,” IEEE Trans. Veh. Technol., vol. 67, no. 11, pp. 10 190–10 203, Nov. 2018. 
[^a26]: Y. Sun, M. Peng, and S. Mao, “Deep reinforcement learning-based mode selection and resource management for green fog radio access networks,” IEEE Internet Things J., vol. 6, no. 2, pp. 1960–1971, Apr. 2019. 
[^a27]: Y. He, N. Zhao, and H. Yin, “Integrated networking, caching, and computing for connected vehicles: A deep reinforcement learning approach,” IEEE Trans. Veh. Tech., vol. 67, no. 1, pp. 44–55, Jan. 2018. 
[^a28]: N. Cheng et al., “Space/aerial-assisted computing offloading for IoT applications: A learning-based approach,” IEEE J. Sel. Areas Commun., vol. 37, no. 5, pp. 1117–1129, May 2019.
[^b7]: J. Li, H. Gao, T. Lv, and Y. Lu, “Deep reinforcement learning based computation offloading and resource allocation for MEC,” in Proc. IEEE Wireless Commun. Netw. Conf. (WCNC), 2018, pp. 1–6.
[^b8]: P. A. Apostolopoulos, E. E. Tsiropoulou, and S. Papavassiliou, “Riskaware data offloading in multi-server multi-access edge computing environment,” IEEE/ACM Trans. Netw., vol. 28, no. 3, pp. 1405–1418, Jun. 2020.
[^b10]: S. Li, Y. Liu, X. Qin, Z. Zhang, and H. Li, “Task offloading and resource allocation in heterogeneous edge computing systems,” in Proc. IEEE Wireless Commun. Netw. Conf. Workshops (WCNCW), 2021, pp. 1–6.
[^b11]: J. Xue and Y. An, “Joint task offloading and resource allocation for multi-task multi-server NOMA-MEC networks,” IEEE Access, vol. 9, pp. 16152–16163, 2021.
[^b12]: M. Nduwayezu, Q.-V. Pham, and W.-J. Hwang, “Online computation offloading in NOMA-based multi-access edge computing: A deep reinforcement learning approach,” IEEE Access, vol. 8, pp. 99098–99109, 2020.
[^b13]: X. Lyu, H. Tian, C. Sengul, and P. Zhang, “Multiuser joint task offloading and resource optimization in proximate clouds,” IEEE Trans. Veh. Technol., vol. 66, no. 4, pp. 3435–3447, Apr. 2017.
[^b14]: L. Qian, Y. Wu, F. Jiang, N. Yu, W. Lu, and B. Lin, “NOMA assisted multi-task multi-access mobile edge computing via deep reinforcement learning for Industrial Internet of Things,” IEEE Trans. Ind. Informat., vol. 17, no. 8, pp. 5688–5698, Aug. 2021.
[^b16]: J. Li, H. Gao, T. Lv, and Y. Lu, “Deep reinforcement learning based computation offloading and resource allocation for MEC,” in Proc. IEEE Wireless Commun. Netw. Conf. (WCNC), 2018, pp. 1–6.
[^b24]: T.-Y. Kan, Y. Chiang, and H.-Y. Wei, “QoS-aware mobile edge computing system: Multi-server multi-user scenario,” in Proc. IEEE Globecom Workshops (GC Wkshps), 2018, pp. 1–6.
[^b25]: Mobile Edge Computing (MEC); Framework and Reference Architecture, vol. 3, ETSI, Sophia Antipolis, France, 2016.
[^c5]: Y. Sun, X. Guo, J. Song, S. Zhou, Z. Jiang, X. Liu, Z. Niu, Adaptive learning-based task offloading for vehicular edge computing systems, IEEE Trans. Veh. Technol. 68 (4) (2019) 3061–3074, http://dx.doi.org/10.1109/TVT.2019.2895593.
[^c7]: Z. Ning, J. Huang, X. Wang, J. Rodrigues, L. Guo, Mobile edge computingenabled internet of vehicles: Toward energy-efficient scheduling, IEEE Netw. (2019) http://dx.doi.org/10.1109/MNET.2018.1800309.
[^c8]: Q. Qi, J. Wang, Z. Ma, H. Sun, Y. Cao, L. Zhang, J. Liao, Knowledge-driven service offloading decision for vehicular edge computing: A deep reinforcement learning approach, IEEE Trans. Veh. Technol. 68 (5) (2019) 4192–4203, http: //dx.doi.org/10.1109/TVT.2019.2894437.
[^c9]: Z. Zhou, P. Liu, J. Feng, Y. Zhang, S. Mumtaz, J. Rodriguez, Computation resource allocation and task assignment optimization in vehicular fog computing: A contract-matching approach, IEEE Trans. Veh. Technol. 68 (4) (2019) 3113–3125, http://dx.doi.org/10.1109/TVT.2019.2894851.
[^c10]: Z. Ning, P. Dong, X. Wang, J. Rodrigues, F. Xia, Deep reinforcement learning for vehicular edge computing: An intelligent offloading system, ACM Trans. Intell. Syst. Technol. 1 (1) (2019) 1–25, http://dx.doi.org/10.1145/3317572.
[^c11]: M. Shojafar, N. Cordeschi, E. Baccarelli, Energy-efficient adaptive resource management for real-time vehicular cloud services, IEEE Trans. Cloud Comput. 7 (1) (2019) 196–209, http://dx.doi.org/10.1109/TCC.2016.2551747.
[^c12]: J. Zhang, X. Hu, Z. Ning, E.C.. Ngai, L. Zhou, J. Wei, J. Cheng, B. Hu, Energylatency tradeoff for energy-aware offloading in mobile edge computing networks, IEEE Internet Things J. 5 (4) (2018) 2633–2645, http://dx.doi.org/10.1109/ JIOT.2017.2786343.
[^c13]: J. Feng, Z. Liu, C. Wu, Y. Ji, AVE: Autonomous vehicular edge computing framework with ACO-based scheduling, IEEE Trans. Veh. Technol. 66 (12) (2017) 10660–10675, http://dx.doi.org/10.1109/TVT.2017.2714704.
[^c14]: Z. Kuang, L. Li, J. Gao, L. Zhao, A. Liu, Partial offloading scheduling and power allocation for mobile edge computing systems, IEEE Internet Things J. (2019) 1–13, http://dx.doi.org/10.1109/JIOT.2019.2911455.
[^c15]: Y. Deng, Z. Chen, X. Yao, S. Hassan, J. Wu, Task scheduling for smart city applications based on multi-server mobile edge computing, IEEE Access 7 (2019) 14410–14421, http://dx.doi.org/10.1109/ACCESS.2019.2893486.
[^c16]: A. Bousia, A. Antonopoulos, L. Alonso, C. Verikoukis, ‘‘Green’’ distance-aware base station sleeping algorithm in LTE-advanced, in: IEEE International Conference on Communications, 2012, pp. 1347–1351, http://dx.doi.org/10.1109/ICC. 2012.6364240.
[^c17]: J. Gong, S. Zhou, Z. Niu, P. Yang, Traffic-aware base station sleeping in dense cellular networks, in: IEEE 18th International Workshop on Quality of Service, 2010, pp. 1–2, http://dx.doi.org/10.1109/IWQoS.2010.5542725.
[^c18]: M. Feng, S. Mao, T. Jiang, Base station ON-OFF switching in 5g wireless networks: Approaches and challenges, IEEE Wirel. Commun. 24 (4) (2017) 46–54, http://dx.doi.org/10.1109/MWC.2017.1600353.
[^c19]: A. Alnoman, G.H.S. Carvalho, A. Anpalagan, I. Woungang, Energy efficiency on fully cloudified mobile networks: Survey, challenges, and open issues, IEEE Commun. Surv. Tutor. 20 (2) (2018) 1271–1291, http://dx.doi.org/10.1109/ COMST.2017.2780238.
[^c20]: C. Liu, B. Natarajan, H. Xia, Small cell base station sleep strategies for energy efficiency, IEEE Trans. Veh. Technol. 65 (3) (2016) 1652–1661, http://dx.doi. org/10.1109/TVT.2015.2413382.
[^c21]: J. Kim, W.S. Jeon, D.G. Jeong, Base-station sleep management in open-access femtocell networks, IEEE Trans. Veh. Technol. 65 (5) (2016) 3786–3791, http: //dx.doi.org/10.1109/TVT.2015.2445922.
[^c22]: E. Chavarria-Reyes, I.F. Akyildiz, E. Fadel, Energy consumption analysis and minimization in multi-layer heterogeneous wireless systems, IEEE Trans. Mob. Comput. 14 (12) (2015) 2474–2487, http://dx.doi.org/10.1109/TMC.2015. 2393352.
[^c23]: Y. Sun, S. Zhou, J. Xu, EMM: Energy-aware mobility management for mobile edge computing in ultra dense networks, IEEE J. Sel. Areas Commun. 35 (11) (2017) 2637–2646, http://dx.doi.org/10.1109/JSAC.2017.2760160.
[^d13]: H. Peng, Q. Ye, and X. Shen, “Spectrum management for multi-access edge computing in autonomous vehicular networks,” IEEE Trans. Intell. Transp. Syst., vol. 21, no. 7, pp. 3001–3012, Jul. 2020.
[^d14]: Why Autonomous Vehicles Will Rely on Edge Computing and Not the Cloud? Accessed: Jul. 13, 2020. [Online]. Available: [https://www.zdnet.com/article/why-autonomous-vehicles-will-relyon-edge-computing-and-not-the-cloud/](https://www.zdnet.com/article/why-autonomous-vehicles-will-relyon-edge-computing-and-not-the-cloud/)
[^d15]: F. Lyu et al., “LEAD: Large-scale edge cache deployment based on spatio-temporal WiFi traffic statistics,” IEEE Trans. Mobile Comput., early access, Apr. 2, 2020, doi: 10.1109/TMC.2020.2984261.
[^d16]: Y. Du, K. Yang, K. Wang, G. Zhang, Y. Zhao, and D. Chen, “Joint resources and workflow scheduling in UAV-enabled wirelessly-powered MEC for IoT systems,” IEEE Trans. Veh. Technol., vol. 68, no. 10, pp. 10187–10200, Oct. 2019.
[^d17]: W. Zhuang, Q. Ye, F. Lyu, N. Cheng, and J. Ren, “SDN/NFV-empowered future IoV with enhanced communication, computing, and caching,” Proc. IEEE, vol. 108, no. 2, pp. 274–291, Feb. 2020.
[^d18]: X. Xiong, K. Zheng, L. Lei, and L. Hou, “Resource allocation based on deep reinforcement learning in IoT edge computing,” IEEE J. Sel. Areas Commun., vol. 38, no. 6, pp. 1133–1146, Jun. 2020.
[^d19]: M. Min, L. Xiao, Y. Chen, P. Cheng, D. Wu, and W. Zhuang, “Learning-based computation offloading for IoT devices with energy harvesting,” IEEE Trans. Veh. Technol., vol. 68, no. 2, pp. 1930–1941, Feb. 2019.
[^d20]: Z. Yang, C. Pan, K. Wang, and M. Shikh-Bahaei, “Energy efficient resource allocation in UAV-enabled mobile edge computing networks,” IEEE Trans. Wireless Commun., vol. 18, no. 9, pp. 4576–4589, Sep. 2019.
[^d21]: Building an Ecosystem for Responsible Drone Use and Development on Microsoft Azure. Accessed: Sep. 19, 2020. [Online]. Available: [https://azure.microsoft.com/en-ca/blog/building-an-ecosystem-forresponsible-drone-use-and-development-on-microsoft-azure/](https://azure.microsoft.com/en-ca/blog/building-an-ecosystem-forresponsible-drone-use-and-development-on-microsoft-azure/)
[^e7]: Abbasi, M., Pasand, E.M., Khosravi, M.R.: Workload allocation in IoT-fog-cloud architecture using a multi-objective genetic algorithm[J]. J Grid Comput. 18(1), 43–56 (2020) 
[^e8]: Lei, K., Fang, J., Zhang, Q., Lou, J., du, M., Huang, J., Wang, J., Xu, K.: Blockchain-based cache poisoning security protection and privacy-aware access control in NDN vehicular edge computing networks[J]. J Grid Comput. 18(6), 593–613 (2020)
[^e9]: Wang, P., Chao, Y., Zheng, Z., et al.: Joint task assignment, transmission, and computing resource allocation in multilayer Mobile edge computing systems[J]. IEEE Internet Things J. 6(2), 2872–2884 (2019)
[^e10]: Feng, W., Hong, X., Jie, X: Optimal Resource Allocation for Wireless Powered Mobile Edge Computing with Dynamic Task Arrivals[C]// ICC 2019–2019 IEEE international conference on communications (ICC). Shanghai: IEEE Press, 1–7, (2019)
[^f15]: Z. Cui et al., “Joint optimization of energy consumption and latency in mobile edge computing for Internet of Things,” IEEE Internet Things, vol. 6, no. 3, pp. 4791–4803, Jun. 2019. 
[^f16]: H. Li, K. Ota, and M. Dong, “Learning IoT in edge: Deep learning for the Internet of Things with edge computing,” IEEE Netw., vol. 32, no. 1, pp. 96–101, Jan./Feb. 2018. 
[^f17]: H. Guo, J. Liu, J. Zhang, W. Sun, and N. Kato, “Mobile-edge computation offloading for ultra-dense IoT networks,” IEEE Internet Things,vol.5, no. 6, pp. 4977–4988, Dec. 2018. 
[^f18]: Y. Liu, C. Yang, L. Jiang, S. Xie, and Y. Zhang, “Intelligent edge computing for IoT-based energy management in smart cities,” IEEE Netw., vol. 33, no. 2, pp. 111–117, Mar. 2019. 
[^f19]: C. You, K. Huang, H. Chae, and B. Kim, “Energy-efficient resource allocation for mobile-edge computation offloading,” IEEE Trans. Wireless Commun., vol. 16, no. 3, pp. 1397–1411, Mar. 2017. 
[^f20]: X. Lyn et al., “Optimal schedule of mobile edge computing for Internet of Things using partial information,” IEEE J. Sel. Areas Commun., vol. 35, no. 11, pp. 2606–2615, Mar. 2017. 
[^f21]: C. You, K. Huang, H. Chae, and B. Kim, “Energy-efficient resource allocation for mobile-edge computation offloading,” IEEE Trans. Wireless Commun., vol. 16, no. 3, pp. 1397–1411, Mar. 2017. 
[^f22]: C. Wang, Y. Li, D. Jin, and S. Chen, “On the serviceability of mobile vehicular cloudlets in a large-scale urban environment,” IEEE Trans. Intell. Transp. Syst., vol. 17, no. 10, pp. 2960–2970, Oct. 2016. 
[^f23]: J. Liu et al., “A scalable and quick-response software defined vehicular network assisted by mobile edge computing,” IEEE Commun. Mag., vol. 35, no. 11, pp. 94–100, Jul. 2017. 
[^f24]: K. Zhang, Y. Zhu, S. Leng, Y. He, S. Maharjan and Y. Zhang, “Deep learning empowered task offloading for mobile edge computing in urban informatics,” IEEE Internet Things J., vol. 6, no. 5, pp. 7635–7647, Oct. 2019. 
[^f25]: Y. Dai, D. Xu, S. Maharjan, and Y. Zhang, “Joint load balancing and offloading in vehicular edge computing and networks,” IEEE Internet Things, vol. 6, no. 3, pp. 4377–4387, Jun. 2019. 
[^f26]: H. Guo and J. Liu, “Collaborative computation offloading for multi-access edge computing over fiber-wireless networks,” IEEE Trans. Veh. Technol., vol. 67, no. 5, pp. 4514–4526, May 2018. 
[^f27]: M. A. Salahuddin, A. Al-Fuqaha, and M. Guizani, “Reinforcement learning for resource provisioning in the vehicular cloud,” IEEE Wireless Commun., vol. 24, no. 4, pp. 128–135, Aug. 2016.
[^f32]: A. C. Barto et al., “Learning to act using real-time dynamic programming,” Dept. Comput. Inf. Sci., Univ. Massachusetts, Amherst, MA, USA, Tech. Rep. 93-02, 1993. 
[^f33]: V. Mnih et al., “Human-level control through deep reinforcement learning,” Nature, vol. 518, no. 7540, pp. 529–533, 2015. 
[^f34]: H. Li, T. Wei, A. Ren, Q. Zhu, and Y. Wang, “Deep reinforcement learning: Framework, applications, and embedded implementations: Invited paper,” in Proc. IEEE/ACM Int. Conf. Comput.-Aided Des., 2017, pp. 847–854. 
[^f35]: Y. Dai, D. Xu, S. Maharjan, Z. Chen, Q. He, and Y. Zhang, “Blockchain and deep reinforcement learning empowered intelligent 5G beyond,” IEEE Netw. Mag., vol. 33, no. 3, pp. 10–17, May/Jun. 2019. 
[^f36]: Y. Xu, J. Yao, H. Jacobsen, and H. Guan, “Cost-efficient negotiation over multiple resources with reinforcement learning,” in Proc. IEEE/ACM 25th Int. Symp. Quality Service, 2017, pp. 1–6. 
[^f37]: L. Jiang et al., “Self-paced curriculum learning,” in Proc. 29th AAAI Conf. Artif. Intell., 2015, pp. 2694–2700.
[^60]: T.-X. Tran and D. Pompili, “Joint task offloading and resource allocation for multi-server mobile-edge computing networks,” IEEE Trans. Veh. Technol., vol. 68, no. 1, pp. 856–868, Jan. 2019.
[^61]: A. S. Bi and Y. J. A. Zhang, “Computation rate maximization for wireless powered mobile-edge computing with binary computation offloading,” IEEE Trans. Wireless Commun., vol. 17, no. 6, pp. 4177–4190, Jun. 2018.
[^62]: G. Ahani and D. Yuan, “BS-assisted task offloading for D2D networks with presence of user mobility,” in Proc. IEEE 89th Veh. Technol. Conf. (VTC-Spring), Kuala Lumpur, Malaysia, 2019, pp. 1–5.
[^64]: Z. Hong, W. Chen, H. Huang, S. Guo, and Z. Zheng, “Multi-hop cooperative computation offloading for industrial IoT–edge–Cloud computing environments,” IEEE Trans. Parallel Distrib. Syst., vol. 30, no. 12, pp. 2759–2774, Dec. 2019.
[^65]: J. Zheng, Y. Cai, Y. Wu, and X. Shen, “Dynamic computation offloading for mobile cloud computing: A stochastic game-theoretic approach,” IEEE Trans. Mobile Comput., vol. 18, no. 4, pp. 771–786, Apr. 2019.
[^66]: F. Guo, H. Zhang, H. Ji, X. Li, and V. C. Leung, “An efficient computation offloading management scheme in the densely deployed small cell networks with mobile edge computing,” IEEE ACM/Trans. Netw., vol. 26, no. 6, pp. 2651–2664, Dec. 2018.
[^68]: H. Lu, C. Gu, F. Luo, W. Ding, and X. Liu, “Optimization of lightweight task offloading strategy for mobile edge computing based on deep reinforcement learning,” Future Gener. Comput. Syst., vol. 102, pp. 847–861, Jan. 2020.
[^69]: H. Lu, X. He, M. Du, X. Ruan, Y. Sun, and K. Wang, “Edge QoE: Computation offloading with deep reinforcement learning for Internet of Things,” IEEE Internet Things J., vol. 7, no. 10, pp. 9255–9265, Oct. 2020.
[^71]: Z. Chen, and X. Wang, “Decentralized computation offloading for multiuser mobile edge computing: A deep reinforcement learning approach,” EURASIP J. Wireless Commun., vol. 188, no. 2020, pp. 1–21, Sep. 2020, doi: 10.1186/s13638-020-01801-6.
[^55]: Z. Cui et al., “Joint optimization of energy consumption and latency in mobile edge computing for Internet of Things,” IEEE Internet Things, vol. 6, no. 3, pp. 4791–4803, Jun. 2019. 
[^56]: H. Li, K. Ota, and M. Dong, “Learning IoT in edge: Deep learning for the Internet of Things with edge computing,” IEEE Netw., vol. 32, no. 1, pp. 96–101, Jan./Feb. 2018. 
[^57]: H. Guo, J. Liu, J. Zhang, W. Sun, and N. Kato, “Mobile-edge computation offloading for ultra-dense IoT networks,” IEEE Internet Things,vol.5, no. 6, pp. 4977–4988, Dec. 2018. 
