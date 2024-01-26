## Content

1. 先前研究概述
2. 现有方案局限性
3. 方法论
4. 论文的贡献

## 先前研究概述

在基于MEC的物联网中，设备可以将计算任务卸载到MEC服务器，提高任务处理速度并节省设备能量 [^55][^56][^57]。

在自动驾驶等场景中，延迟要求可能要低于10ms.[^51][^52]

**3. IoV任务调度中的挑战:**

   - 车辆的动态性。
   - 波动的网络条件。
   - 任务的及时性和复杂性。
   - 异构资源的限制。

**4. 常用方法:**

   - 模糊逻辑: 需要预定义模糊规则的公式，受制于静态专业知识。
   - 机器学习: 根据数据集的陈旧或普遍性不足面临调整任务调度策略的问题。

**5. 提出的创新方法:**

   - 将多主体强化学习与反拍卖机制相结合。
   - 目标: 实现最佳资源匹配，促进合作，最小化总体成本。

传统方法处理MEC中的JCORA问题包括凸逼近[^61]，[^62]，博弈论[^64]，[^65]和元启发式算法[^60]，[^66]。面临挑战，如指数增长的搜索空间和沉重的计算负担，尤其是在大规模场景中。

利用深度神经网络（DNNs）的强大功能[^68]，[^69],[^71]。深度强化学习方法在处理具有连续动作空间的动态优化问题方面显示出潜力。

- Dai等人[^jlbo] 开发了一种联合最优的VEC服务器选择和卸载算法，以最大化系统效用。
- Zhou等人[^ewo] 提出了一种基于交替方向乘子法的能效资源分配算法。

强化学习被用于车辆云中的长期资源供应，以解决资源的动态需求和严格的服务质量（QoS）要求 [^627]。

**任务调度:**

- 边缘云计算中普遍采用的方法包括模糊逻辑和机器学习。
- 基于随机优化的分布式资源调度方法[^24][^26][^27][^1]。
- 挑战包括预定义的模糊规则、设计时间要求和静态的全局视角。
- 传统机器学习方法利用现有调度数据，减少手动干预。
- 然而，学习数据集可能缺乏对新环境的适应性。
- 在模拟环境中训练的强化学习代理提供了应对环境变化的解决方案[^32]。

**拍卖机制:**

- 近期关注于车载网络中的拍卖机制。
- 努力制定公平的资源价格确定和高效分配的多样化机制。
- 移动边缘计算（MEC）研究的发展。
- 例如，包括在线激励驱动的任务分配方案[^3]和分布式激励机制[^5]。
- 基于拍卖的激励机制广泛应用于MEC资源分配，例如实际组合的双向拍卖机制[^6]。
- 引入了基于反拍卖的机制，用于计算卸载和移动边缘计算中的资源分配[^42]。

**强化学习:**

- 在多约束过程调度问题中广泛应用强化学习（RL）方法[^9][^10]。
- 利用博弈论和多主体训练技术中的均衡概念。
- 解决多约束和多目标优化问题的挑战。
- 例如，基于RL的云科学工作流调度[^2]和用于系统资源管理的DeepRM[^12]。

## 现有方案局限性

**1. 介绍:**

   - 任务的随意卸载可能导致边缘服务器之间的工作负载不平衡。
   - 导致服务器收入减少和用户效用受损。
   - 在边缘服务器之间进行任务调度对于优化服务质量和资源效率至关重要。

**2. 目标:**

   - 研究基于任务需求和预算考虑的任务调度策略。
   - 将具有不同特性的任务从车辆卸载到合适的节点。
   - 提高用户满意度、边缘服务器收入和资源利用率。

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

## 论文的贡献

本文的主要贡献概述如下：

- 实施了IoV背景下任务调度问题的建模，制定了基于多主体强化学习和反拍卖机制的边缘服务器资源调度方法。
- 运用反拍卖方法解决IoV中的任务调度问题，实现了分布式、自适应的任务调度解决方案。
- 设计了一个利用PPO+LSTM的出价策略，利用LSTM的记忆能力捕捉任务调度中的时态特征和长期依赖关系。该策略旨在提高竞标过程的性能和有效性。
- 进行了模拟实验，验证了所提方法的有效性和优越性。此外，评估了强化学习和反拍卖机制的优势和适用性，并与其他基准方法进行了比较。




[^627]: M. A. Salahuddin, A. Al-Fuqaha, and M. Guizani, “Reinforcement learning for resource provisioning in the vehicular cloud,” IEEE Wireless Commun., vol. 24, no. 4, pp. 128–135, Aug. 2016.
[^jlbo]:Y. Dai, D. Xu, S. Maharjan, and Y. Zhang, “Joint load balancing and offloading in vehicular edge computing and networks,” IEEE Internet Things J., vol. 6, no. 3, pp. 4377–4387, Jun. 2019. 
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
[^1]:Sonmez C, Ozgovde A, Ersoy C (2019) Fuzzy Workload Orchestration for Edge Computing. IEEE Trans Netw Serv Manag 16(2):769–782. <https://doi>. org/10.1109/TNSM.2019.2901346
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
