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

To enhance resource utilization efficiency and optimize service quality, a rational task scheduling approach is of utmost significance. Faced with challenges such as high user dynamics and resource constraints, a multitude of technologies and algorithms have emerged continuously, creating conditions for the emergence of innovative solutions [^c5] [^c8] [^c7]. Traditional mobile edge computing task scheduling methods, including convex approximation [^61], [^62], game theory [^64], [^65], and meta-heuristic algorithms [^60] [^66], encounter challenges such as the exponential growth of the search space and computational overhead in large-scale scenarios. To overcome the limitations of traditional methods, innovative methods based on multi-agent reinforcement learning [^f27] [^a12] have been proposed to achieve optimal resource matching and minimize overall costs. Deep reinforcement learning methods leverage the powerful capabilities of deep neural networks [^68] [^69] [^71], demonstrating potential in handling dynamic optimization problems with continuous action spaces.

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




[^revbid]: Zhou, Huan, Tong Wu, Xin Chen, Shibo He, Deke Guo和Jie Wu. 《Reverse Auction-Based Computation Offloading and Resource Allocation in Mobile Cloud-Edge Computing》. _IEEE Transactions on Mobile Computing_, 2022年, 1–15. [https://doi.org/10.1109/TMC.2022.3189050](https://doi.org/10.1109/TMC.2022.3189050).
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
