---
tags: 
UID: 20240222114700
source: null
cssclass: null
created: "2024-02-22 11:46"
updated: "2024-02-23 15:33"
date updated: 2024-02-23 09:50
---

边缘计算（MEC）被确认为下一代 5G 网络的关键技术[^e9]。MEC 技术在车联网（IoV）中扮演着关键角色[^e7][^e10]，当前在基于 MEC 的车联网领域，学术界的研究主要聚焦于架构设计、任务卸载和资源管理方案。在 MEC 架构下，计算任务从移动车辆卸载到网络边缘节点，以满足对超低延迟的需求[^e8][^55][^56][^57]。决定何时、是否以及卸载多少计算任务是主要技术挑战之一。在车辆边缘计算（VEC）中，任务调度成为关键问题[^e9]，其挑战在于地理差异导致边缘服务器负载不平衡。未来的发展将聚焦于系统稳定性、适应性和性能优化，以更好地满足移动用户的需求。

To enhance resource utilization efficiency and optimize service quality, a rational task scheduling approach is of utmost significance. Faced with challenges such as high user dynamics and resource constraints, a multitude of technologies and algorithms have emerged continuously, creating conditions for the emergence of innovative solutions [^c5] [^[c8] [^c7]. Traditional mobile edge computing task scheduling methods, including convex approximation [^61], [^62], game theory [^64], [^65], and meta-heuristic algorithms [^60] [^66], encounter challenges such as the exponential growth of the search space and computational overhead in large-scale scenarios. To overcome the limitations of traditional methods, innovative methods based on multi-agent reinforcement learning [^f27] [^a12] have been proposed to achieve optimal resource matching and minimize overall costs. Deep reinforcement learning methods leverage the powerful capabilities of deep neural networks [^68] [^69] [^71], demonstrating potential in handling dynamic optimization problems with continuous action spaces.

In the domain of vehicle task scheduling, numerous challenges exist, such as dynamics, network instability, and heterogeneous resource constraints [^c5] [^c8]. Changes in vehicle location, state, and availability increase the complexity of scheduling [^b16] [^b7] [^b13] [^f27] [^a12]. Existing research typically focuses on the multi-dimensional resource management of low-mobility users [^a18] [^a19], but in highly mobile and dynamic vehicle-to-everything environments, this approach may be limited [^a7]. Therefore, a more comprehensive and flexible task scheduling method is required to meet the computing tasks with multi-dimensional resource requirements [^e9].

This paper presents an innovative approach that combines multi-agent reinforcement learning with the reverse auction mechanism to address task scheduling in the vehicle-to-everything network [^e9]. This method utilizes the PPO algorithm, enabling edge servers to learn and update task scheduling strategies autonomously, while providing temporal information and feature extraction through the addition of the LTSM network. Simultaneously, the reverse auction mechanism is introduced to construct a task unloading market, achieving rational resource allocation, balancing competition and cooperation, and load balancing.

为了提高资源利用效率和优化服务质量，合理的任务调度方法至关重要。在面临用户高动态性和资源限制等挑战时，多种技术和算法不断涌现，为创新解决方案的出现创造了条件[^c5][^c8] [^c7]。传统的移动边缘计算任务调度方法，如凸逼近[^61]、[^62]、博弈论[^64]、[^65]和元启发式算法[^60][^66]等，在大规模场景中面临搜索空间指数增长和计算负担等挑战。为克服传统方法的局限性，基于多主体强化学习的创新方法[^f27] [^a12]被提出，以实现最佳资源匹配并最小化整体成本。深度强化学习方法利用深度神经网络的强大功能[^68][^69][^71]，在处理具有连续动作空间的动态优化问题上显示出潜力。

在车辆任务调度领域，还面临着多方面挑战，如动态性、网络不稳定性和异构资源限制等[^c5][^c8]。车辆位置、状态和可用性的变化增加了调度复杂性[^b16][^b7][^b13][^f27][^a12]。现有研究通常侧重于低移动性用户的多维资源管理[^a18][^a19]，但在高度移动和动态的车联网环境下，这种方法可能会受到限制。[^a7]因此，需要更加全面、灵活的任务调度方法来满足多维度资源需求的计算任务[^e9]。

本文提出了一种将多智能体强化学习与反向拍卖机制相结合的创新方法，以解决车联网中的任务调度问题[^e9]。该方法使用 PPO 算法，使边缘服务器能够自主学习和更新任务调度策略，并通过添加 LTSM 网络提供时序信息和提取特征。同时，引入反向拍卖机制构建任务卸载市场，实现资源的合理分配、平衡竞争与合作以及负载均衡。

本文的主要贡献概述如下：

1. 针对 IoV 动态网络背景下的任务调度问题进行建模，将其转化为马尔可夫过程。
2. 提出基于多主体深度强化学习和反拍卖机制的资源调度方法，实现分布式、自适应的任务调度。
3. 利用 PPO+LSTM 学习单个服务器的出价策略，捕捉任务调度中的时态特征和长期依赖关系。
4. 通过模拟实验验证所提方法的有效性和优越性，并与其他基准方法进行比较。

- 完成了IoV动态网络背景下任务调度问题的建模，将提出的问题进一步制定为马尔可夫过程, 制定了基于多主体深度强化学习和反拍卖机制的边缘服务器资源调度方法。
- 运用反拍卖方法解决IoV中动态网络背景下的任务调度问题，实现了分布式、自适应的任务调度解决方案,在促进资源合理分配, 降低车辆卸载成本。
- 利用PPO+LSTM完成单个服务器出价策略的学习，将LSTM的记忆能力用于捕捉任务调度中的时态特征和长期依赖关系, 以提高竞标过程的性能和有效性。
- 进行了模拟实验，验证了所提方法的有效性和优越性。此外，评估了强化学习和反拍卖机制的优势和适用性，并与其他基准方法进行了比较。
