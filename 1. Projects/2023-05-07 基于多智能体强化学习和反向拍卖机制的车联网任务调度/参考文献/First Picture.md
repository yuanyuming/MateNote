---
UID: 20231219104820 
tags: 
source: 
cssclass: 
created: "2023-12-19 10:48"
updated: "2023-12-19 14:39"
---

## ✍内容

---
Pang, Meiyu, Li Wang和Ningsheng Fang. 《A Collaborative Scheduling Strategy for IoV Computing Resources Considering Location Privacy Protection in Mobile Edge Computing Environment》. Journal of Cloud Computing 9, 期 1 (2020年12月): 52. https://doi.org/10.1186/s13677-020-00201-x.
![[Pasted image 20231219105051.png]]
Fig. 1 System model of multi-area multi MEC server


![[Pasted image 20231219110607.png]]
Fig. 3 Analysis of vehicle edge computing

![[Pasted image 20231219110631.png]]
Fig. 4 Interaction block diagram of reinforcement learning

With the continuous improvement of relevant standards and continuous increase of intelligent vehicles, it is foreseeable that more and more vehicles will realize network interconnection by relevant protocols in the future. With the increasing number of vehicles, road hazards have become a problem that must be faced in the development of IoV [10]. Besides, the communication transmission of vehicle safety business has higher timeliness and reliability requirements. In some application scenarios of IoV, such as automatic driving, the delay requirement even needs to be lower than 10 ms. This makes the research on the transmission strategy of IoV security services more and more important [11,12]. In the vehicle communication process based on IEEE 802.11P and LTE-V protocols, channel congestion, channel interference, shadow fading and intelligent computing processing are main factors that affect the communication performance of vehicles. How to schedule computing resources and communication resources in IoV to improve the communication performance of vehicle safety business has important research value. Besides, the proposed scheduling strategy is based on an IoV system of multi-area multi-user multi-MEC server. A vehicle distance prediction method based on Kalman filtering is proposed combined with the mobility of IoV users in this paper. Furthermore, the total cost of communication delay and energy consumption of all users is formulated as the optimization goal, the Double DQN algorithm is used to solve the optimal scheduling strategy for minimizing the total consumption cost of system.

---

Li, Xuezhu. 《A Computing Offloading Resource Allocation Scheme Using Deep Reinforcement Learning in Mobile Edge Computing Systems》. _Journal of Grid Computing_ 19, 期 3 (2021年9月): 35. [https://doi.org/10.1007/s10723-021-09568-w](https://doi.org/10.1007/s10723-021-09568-w).

MEC can effectively reduce the delay cost of service delivery and network operation by deploying servers close to mobile users. And it has been certified by European 5G Infrastructure Public Private Partnership (PPP) as one of key technologies of the next-generation 5G network. The advantages of MEC include low latency, high bandwidth, realtime wireless network information and location awareness [7,8]. The MEC-based Internet of Vehicles (IoV) allows mobile vehicles to offload computing tasks to network edge nodes for processing, which helps to achieve the ultra-low latency requirements of IoV [9]. MEC sinks cloud services to the edge of wireless access network and provides computing services near moving vehicles [10]. However, in the MEC-based vehicle-connected network, there are various computationally intensive and delaysensitive computational tasks. Moreover, each task has different resource requirements, including computing resources required for task execution and communication resources required for task transmission. In this case, a suitable strategy is needed to control offloading tasks and ensure the normal operation of system. Considering the impact of offloading decision and resource allocation on computing offloading performance. In response to the above problems, a computing offloading resource allocation scheme using reinforcement learning in a MEC system is proposed,

![[Pasted image 20231219111931.png]]
Fig. 1 The system model

![[Pasted image 20231219111958.png]]
Fig. 2 The framework of reinforcement learning

---
Zhao, Jie, Maria A. Rodriguez和Rajkumar Buyya. 《A Deep Reinforcement Learning Approach to Resource Management in Hybrid Clouds Harnessing Renewable Energy and Task Scheduling》. 收入 _2021 IEEE 14th International Conference on Cloud Computing (CLOUD)_, 240–49. Chicago, IL, USA: IEEE, 2021. [https://doi.org/10.1109/CLOUD53861.2021.00037](https://doi.org/10.1109/CLOUD53861.2021.00037).

![[Pasted image 20231219112144.png]]
Fig. 2. System Architecture

![[Pasted image 20231219112111.png]]
Fig. 3. Concept Diagram of DRL

---
Chen, Juan, Huanlai Xing, Zhiwen Xiao, Lexi Xu和Tao Tao. 《A DRL Agent for Jointly Optimizing Computation Offloading and Resource Allocation in MEC》. _IEEE Internet of Things Journal_ 8, 期 24 (2021年12月15日): 17508–24. [https://doi.org/10.1109/JIOT.2021.3081694](https://doi.org/10.1109/JIOT.2021.3081694).

![[Pasted image 20231219112340.png]]
Fig. 1. Example MEC system.

![[Pasted image 20231219112416.png]]
Fig. 2. Structure of the TADPG agent.

![[Pasted image 20231219112439.png]]
Fig. 3. Structure of TFEN.

Traditional approaches, such as convex approximation [5], [6], game theory [7]–[9], and metaheuristics [4], [10], are not suitable for addressing dynamic JCORA problems in MEC. These methods usually suffer from exponentially increasing search space and heavy computational burdens, especially in large-scale scenarios. Adopting deep reinforcement learning (DRL) to handle JCORA problems has attracted increasingly more research interests because of the powerful deep neural networks (DNNs) [3], [12]–[20]. Deep deterministic policy gradient (DDPG) [16], [18] shows excellent potential when coping with dynamic optimization problems with a continuous action space. More details can be found in Section II. 

In the traditional DDPG, both the actor and critic networks are based on fully connected networks (FCNs). However, FCNs generally suffer from two drawbacks. One is the huge number of trainable parameters, which increases the difficulty for training and significantly consumes computing resources. The other is that FCNs only extract the global discriminative state and action policy features, ignoring the temporal variation of task sequences that may contain useful shapelets for function approximation. Moreover, experience transitions are uniformly sampled from the replay buffer. This approach treats all experiences equally, regardless of their significance. However, ignoring the importance of valuable experiences usually leads to poor stability and slow convergence during training. 

To overcome the disadvantages above, this article proposes temporal attentional deterministic policy gradient (TADPG), an improved DDPG agent for tackling the decentralized JCORA problem in a dynamic MEC environment. Running a TADPG agent on each MD requires fewer control costs between this MD and its corresponding MEC server. It is thus more suitable for large-scale scenarios, compared with those centralized JCORA methods. Our main contributions are summarized as follows.

---

Liwang, Minghui, Shijie Dai, Zhibin Gao, Yuliang Tang和Huaiyu Dai. 《A Truthful Reverse-Auction Mechanism for Computation Offloading in Cloud-Enabled Vehicular Network》. _IEEE Internet of Things Journal_ 6, 期 3 (2019年6月): 4214–27. [https://doi.org/10.1109/JIOT.2018.2875507](https://doi.org/10.1109/JIOT.2018.2875507).
![[Pasted image 20231219115009.png]]
Fig. 1. Multibuyer–multiseller cloud-enabled vehicular network framework.

However, mobile edge servers may still experience signal coverage limitations and resource constraints in cases of high user density, especially during high-traffic periods. Therefore, mobile device cloud (MDC) [7], [8] technology has been applied as a strategy for offloading computation-intensive applications to nearby mobile devices with idle resources. Compared with location-fixed mobile edge clouds, the offloading scheme in an MDC environment possesses advantages of infrastructure independency and economic efficiency.

In this paper, we investigate a Vickrey–Clarke–Groves (VCG)-based reverse auction mechanism for V2V computation offloading that addresses the aforementioned issues while considering specific features such as opportunistic connections and different V2V channel conditions in cloud-enabled vehicular networks. Specifically, we envision an offloading market containing several auction groups1 with multiple buyers (service requestors) and sellers (service providers). Groups are managed by centralized brokers (RSUs) with innovative policies that can preserve truthfulness and individual rationality. This paper makes the following contributions.

![[Pasted image 20231219141124.png]]
TABLE II OPTIMAL VCG-BASED REVERSE AUCTION

![[Pasted image 20231219141141.png]]
TABLE III PROPOSED MAT C H I N G ALGORITHM IN REVERSE AUCTION

---
Peng, Haixia, 和Xuemin Shen. 《Deep Reinforcement Learning Based Resource Management for Multi-Access Edge Computing in Vehicular Networks》. _IEEE Transactions on Network Science and Engineering_ 7, 期 4 (2020年10月1日): 2416–28. [https://doi.org/10.1109/TNSE.2020.2978856](https://doi.org/10.1109/TNSE.2020.2978856).

![[Pasted image 20231219141736.png]]
Fig. 1. An illustration of MEC-based vehicular network model.

![[Pasted image 20231219141846.png]]
Fig. 2. Dynamic spectrum management frameworks.

![[Pasted image 20231219141920.png]]
Fig. 3. The fundamental deep RL architecture in the MEC-based vehicular Network.

![[Pasted image 20231219141942.png]]
Fig. 4. The architecture of the DDPG learning.

![[Pasted image 20231219142015.png]]

![[Pasted image 20231219142031.png]]


To address the challenges on implementing MEC-based vehicular networks, many research works have been performed recently, including design of architecture, task offloading scheme, resource management scheme, and so on. For example, the MEC-based hierarchical vehicular network framework, comprised of vehicle level’s on-board computing/ storing resources and server level’s resources (resources placed at the MEC and cloud-computing servers), has been investigated in [10], [12], [14]–[16]. To better manage the spectrum/computing/storing resources among and make task offloading decisions to vehicle users, task offloading and resource management schemes have been proposed in [10], [15]–[17]. Since task offloading and spectrum/computing resource allocation are coupled with each other, the objectives of the most existing works have been achieved by jointly optimizing these two parts with traditional optimization methods [10], [15]. However, only one or two dimensions of resources have been considered in most of the existing schemes, which cannot be directly adopted to support some vehicular applications where high dimensional resources are involved, such as the computing tasks generated by the leading vehicle for platoon/convoy control [7]. Moreover, there are also some works focusing on multi-dimensional resources management in the scenarios with low mobility users [18], [19]. For MEC-based vehicular networks, the computational complexity of multi-dimensional resource management problem increases due to the high vehicle mobility and time-varying demand on resources, therefore increasing the time consumption on the resource management scheme itself. Thus, it is infeasible to adopt the pure optimization approachbased schemes to achieve multi-dimensional resource management in MEC-based vehicular networks, especially for the scenarios with delay-sensitive applications. How to design practical and QoS-oriented multi-dimensional resource management schemes for the MEC-based vehicular networks still needs efforts.

As is known, artificial intelligence (AI) technology, especially reinforcement learning (RL), can be exploited to solve resource management problems quickly [20]–[23]. Q-learning [16], [24], deep Q-learning [25]–[27], actor-critic [18], [28], and other deep RL algorithms have been widely exploited for resource management in wireless communication networks. Inspired by the existing works and considering the dynamic vehicular network environment caused by high vehicle mobility and heterogeneous applications, we investigate how to exploit deep RL to jointly manage the spectrum, computing, and storing resources to support delay-sensitive applications in the MEC-based vehicular network [12] in this paper. Specifically, the main contributions of this work can be summarized as follows,

---
Liu, Yi, Huimin Yu, Shengli Xie和Yan Zhang. 《Deep Reinforcement Learning for Offloading and Resource Allocation in Vehicle Edge Computing and Networks》. _IEEE Transactions on Vehicular Technology_ 68, 期 11 (2019年11月): 11158–68. [https://doi.org/10.1109/TVT.2019.2935450](https://doi.org/10.1109/TVT.2019.2935450).

![[Pasted image 20231219142802.png]]
Fig. 1. System model of vehicle-assisted MEC Network.

In MEC based IoT network, the devices can offload all/part of the computation tasks to the MEC server which can speed up the processing of the tasks and save energy for devices [15]–[17]. Then, the main technical problem becomes whether/when/how many computation tasks should be offloaded. Numerous literatures are devoted to design the optimal strategy to solve this problem under different performance requirements [18]–[21]. Considering the long-time energy efficiency while using IoT network, an efficient edge computing infrastructure is proposed in [18]. Due to stochastic task arrivals and wireless channels, congested air interface, and prohibitive feedbacks from thousands of IoT devices, authors in [19] generate asymptotically optimal schedules tolerant to out-of-date network knowledge, thereby relieving stringent requirements on feedbacks. The optimal schedule and energy efficient resource allocation policies for MEC are proposed in [20] and [21], respectively.

Since the vehicle is an important type of User Equipment (UE) in IoT system, the vehicular edge computing network structure and related resource allocation methods are studied by many researchers [22]–[27]. C. Wang et al., propose a scalable SDN-enabled MEC architecture that integrates a heterogeneous vehicular network to decrease the overall delay and offload the traffic load from the backbone network [22]. To reduce both the latency and the transmission cost of the computation offloading, a cloud-based MEC offloading framework is proposed for vehicular networks in [23]. In [24], based on the MEC-assisted vehicular offloading mode, a target server selection policy is presented to improve task offloading reliability in the case of vehicular data transmission failure. Some novel MEC-based vehicular networks are proposed in [25], [26], in which the computation offloading policies are carefully designed according to different scenarios. The reinforcement learning is used for long-term resource provision in vehicular cloud to deal with dynamic demands for the resources and stringent QoS requirements [27]. However, in the existing literatures, the vehicles play the role as users in the MEC network in which the edge servers are statically deployed and may cause “service hole” due to the explosion of service requests of tremendous number of UEs.

The focus of this paper is to design a Vehicle Edge Computing (VEC) network in which the vehicles are able to provide computation services as well as the traditional edge servers. As the traditional edge server, generally connected to road side units, small-cell base stations, etc., has fixed locations, the proposed architecture can extend the computation services range and improve flexibility of the MEC network. Then, we propose an efficient computation offloading scheme for UEs while considering the delay of the computation tasks generated by UEs. Accordingly, we formulate an optimization problem to maximize the total utility of the proposed VEC network. 

To solve the problem, the stochastic traffic and communication uncertainty in vehicular communication environment should be carefully addressed. The Q-learning method is one of the model-free reinforcement learning methods which are not based on the environment elements are already known [32]. Such feature makes Q-learning method suitable for solving the proposed problem in the vehicle edge computing network. The crucial part of Q-learning is to accurately and efficiently estimate the Q value, which may lead to the curse of dimensionality as the increasing of state space. Deep reinforcement learning (DRL), which approximates the Q-function by using deep neural networks, has more advantageous than Q-learning for providing greater performance and more robust learning [33]–[36]. Hence, the proposed problem is further formulated as a semi-Markov process and two reinforcement learning methods: Q-learning based method and deep reinforcement learning (DRL) method are proposed to determine the policies of computation offloading and resource allocation.

In this paper, we propose a VEC network to enhance the flexibility and scalability of the MEC based IoT system with main contributions summarized as follows: 
1.  We propose a vehicle edge computing network architecture in which the vehicles can provide computation services for UEs as well as the traditional edge server. 
2. We propose an efficient offloading scheme for the vehicle edge computing network while considering both delay and limited computation capabilities of vehicles and edge servers. Accordingly, we formulate an optimization problem to maximize the total utility of the vehicle edge computing network. 
3. Taking into account of the stochastic traffic and uncertain communication conditions, we reformulated the proposed problem as a semi-Markov process and propose Q-learning based reinforcement learning method and DRL method to find the policies of computation offloading and resource allocation.

---
Chen, Ying, Zhiyong Liu, Yongchao Zhang, Yuan Wu, Xin Chen和Lian Zhao. 《Deep Reinforcement Learning-Based Dynamic Resource Management for Mobile Edge Computing in Industrial Internet of Things》. _IEEE Transactions on Industrial Informatics_ 17, 期 7 (2021年7月): 4925–34. [https://doi.org/10.1109/TII.2020.3028963](https://doi.org/10.1109/TII.2020.3028963).

![[Pasted image 20231219151419.png]]
Fig. 1. MEC-enabled industrial IoT network.

---
Liu, Yujiong, Shangguang Wang, Qinglin Zhao, Shiyu Du, Ao Zhou, Xiao Ma和Fangchun Yang. 《Dependency-Aware Task Scheduling in Vehicular Edge Computing》. _IEEE Internet of Things Journal_ 7, 期 6 (2020年6月): 4961–71. [https://doi.org/10.1109/JIOT.2020.2972041](https://doi.org/10.1109/JIOT.2020.2972041).
![[Pasted image 20231219151523.png]]
Fig. 1. Architecture of VEC.

![[Pasted image 20231219151604.png]]

There has been some research works on VEC. Zhang et al. [12] proposed a task offloading scheme based on the Stackelberg game theory to maximize the utilities of both vehicles and MEC servers. Zhang et al. [13] introduced an efficient predictive combination-mode offloading mechanism to reduce the offloading cost. Dai et al. [14] developed a joint optimal VEC server selection and offloading algorithm to maximize the system utility. Zhou et al. [15] proposed an energy-efficient resource allocation algorithm based on the alternating direction method of multipliers. Zhu et al. [16] developed a dynamic task allocation solution to ensure the quality of service. The prior studies assume that applications consisting of independent tasks are offloaded to RSUs for execution. However, task execution order depends on task dependency and the effect of task dependency on the execution time of applications has not been considered in the previous research works. For an augmented vehicular reality system with the following major components: object tracking, model mapping, object recognition, perspective transformation, and merging processing, there are some task dependencies among the components, e.g., only after one vehicle is tracked, the surrounding environmental model of the vehicle can be built and only after one vehicle is recognized, the process of perspective transformation and merging processing can be executed. To ensure that multiple vehicular applications can be completed in time, it is necessary to take task dependency into account for task scheduling policies design.

To overcome the above drawbacks, in this article, we consider the task dependency and the completion time constraints when scheduling tasks into multiple MEC servers. The goal of the work is to identify task scheduling decision that minimizes the average completion time of multiple applications, subject to their respective completion time constraints. We first present a VEC architecture. Then, we specify the completion time constraint of each application and the task dependency requirements of tasks. Finally, we propose an efficient task scheduling algorithm to minimize the average completion time of multiple applications.

The main contributions of this article are as follows. 
1. We propose a VEC architecture which consists of multiple vehicles, multiple RSUs, and multiple MEC servers. Each vehicle has a computation-intensive and delay-sensitive application. Each RSU is equipped with multiple MEC servers. Multiple vehicles can offload their computation-intensive and delay-sensitive applications to MEC servers on RSUs for execution where applications are independent of each other but tasks (belonging to the same application) have processing dependence. 
2. We formalize the task scheduling decision problem as an optimization problem which is NP-hard, and then propose an efficient multiple applications multiple tasks scheduling (MAMTS) algorithm to solve the optimization problem. Furthermore, we prioritize multiple applications to meet their respective completion time constraints and prioritize multiple tasks for satisfying their processing dependency requirements. 
3. We evaluate the proposed task scheduling algorithm with extensive simulations. The simulation results show that our proposed algorithm can significantly reduce the average completion time of multiple applications compared with benchmark algorithms.

---
Li, Haiyuan, Karcius Day R. Assis, Shuangyi Yan和Dimitra Simeonidou. 《DRL-Based Long-Term Resource Planning for Task Offloading Policies in Multiserver Edge Computing Networks》. _IEEE Transactions on Network and Service Management_ 19, 期 4 (2022年12月): 4151–64. [https://doi.org/10.1109/TNSM.2022.3191748](https://doi.org/10.1109/TNSM.2022.3191748).

![[Pasted image 20231219153006.png]]
Fig. 1. MEC Network Architecture.

![[Pasted image 20231219153039.png]]
Fig. 2. Overall Solution of Task Offloading Management (P1: Optimization of long-term resource scheduling; P2: Joint optimization of offloading decision and resources allocation).

![[Pasted image 20231219153105.png]]
Fig. 3. DQN Centralized Training and Centralized Execution Architecture.

![[Pasted image 20231219153123.png]]
Fig. 4. The Structure of DRL Multi-Agent Actor-Critic.

![[Pasted image 20231219153145.png]]
Fig. 5. MADDPG Centralized Training and Distributed Execution Architecture.

In previous studies, some of the task offloading algorithms assumed infinite computing resources on the MEC server for offloading operations [6], [7]. However, exploding computingintensive tasks and the imbalanced request distribution are challenging the computing capability of MEC servers in bearer networks [8], [9]. The limited MEC resources require offload policies to consider long-term rewards and bring collaboration between multiple MECs. On the other side, to improve the utilization of limited MEC server resources, a large body of literature has focused on designing offloading resource management algorithms based on centralized [7], [10]–[12] and distributed approaches [8], [13], [14].

According to the number of servers, MEC systems in the current papers are divided into single-server [13], [15]–[17] or multiple-server [9]–[11], [18], [19] systems. Meanwhile, the techniques to tackle computation offloading and resource allocation in those models are classified into optimizationbased [10], [11], [13], [19] or machined learning based [16], [17], [20], respectively.

Regarding the single-server system, Lyu et al. [13]introduced a semi-distributed approach that jointly optimizes offloading decisions and resource allocation problems. With a heuristic offloading algorithm (HODA), they achieved superior system utility with an acceptable complexity of O(K 3). Nevertheless, the single-server system cannot deal with the coexistence between idle and over occupied servers because of the inevitable unbalanced request distribution [21], [22]. Under the same system model, Li et al. [16] designed a centralizedbased DRL-based model to simultaneously resolve offloading decisions and computing resource allocations. However, excess users will cause the explosion of the action space of the DRLbased algorithm, which causes the model fail to converge. In comparison, Chen et al. [7] applied multi-agent policybased DRL model that distributed the artificial intelligence (AI) agent to the edge devices to reduce the dimension of action space. However, this approach comes at the expense of complexity and might bring burdens on the devices because of their weak computing abilities.

In order to further improve the workload carrying capability of the MEC network, multiple access in RAN was introduced as a promising technology to achieve the multi-server system. Li et al. [10], Nduwayezu et al. [12] and Xue and An [11] explored the centralized joint optimization approach for the multi-access system. First fit (FF) algorithm [23] was used to select the offloading destination for the offloading requests in the network. In comparison, Apostolopoulos et al. proposed a distributed approach towards determining the optimal data oflfoading of each user within a multiple MEC servers system by non-cooperative game among the users [8]. However, their assumption that all edge devices have access to the same set of servers neglected the geographical proximity factor in practical networks. In contrast, Kan et al. [24] designed a model where edge devices can only connect to their proximate servers. The multi-server system was achieved by relaying the workload among servers via the wired interface (Mp3) which is designed and standardized for the workload transition between MEC servers by the European Telecommunications Standards Institute (ETSI) [25]. Furthermore, Qian et al. designed a distributed algorithm and a centralized online DRL-based solution for statistic and dynamic channel scenarios, respectively, which can realized the selection of access point with minimized transmission cost [14].

Although extensive research has been carried out on the offloading management technology in single and multiple server scenarios, few studies have been reported with consideration of long-term resource balance for offloading operations. Offloading without long-term resource balance will prefer instant high reward at the expense of the resource shorting for following offloading requests.

In summary, three critical issues need to be resolved in designing efficient offloading management policies. First, the prior joint offloading algorithms in multi-server systems ignored the geographic proximity between edge devices and servers. FF-based solutions did not fundamentally deal with the unbalanced traffic distribution. Second, the possible action space explosion in DRL-based solutions remained unclear. Last but not least, the lack of consideration of long-term reward in the current studies hindered further improvement in network resource utilization. To overcome these obstacles, the main contributions of this paper are as follows:

To the best of our knowledge, this is the first time that the optimization-based method and DRL have been geared together to solve two interrelated subproblems and find the policies that maximize long-term offloading benefits. Regarding the joint solution between edge devices in one time slot, our results show that there is a great benefit in the execution time by sorting the execution order of requests and reusing the released resources for the on processing workloads. In addition, a period of continuous time slots is taken to illustrate the long-term reward of random allocation, over allocation, and three DRL-based allocation policies. We prove that over-allocation used by the prior studies can not get reliable results as it pursues higher rewards at the expense of future loss. In comparison, DRL-based algorithms can adapt to the diversity of future network states and obtain resource allocation strategies with better performance. Furthermore, of these three DRL algorithms, compared to single-agent DQN, the cooperative multi-agent model is able to more accurately account for interactions between servers on limited resources and achieve higher average rewards. In the end, the value of server cooperation is also justified.

---
Wu, Yalan, Jigang Wu, Long Chen, Jiaquan Yan和Yuchong Luo. 《Efficient Task Scheduling for Servers with Dynamic States in Vehicular Edge Computing》. _Computer Communications_ 150 (2020年1月): 245–53. [https://doi.org/10.1016/j.comcom.2019.11.019](https://doi.org/10.1016/j.comcom.2019.11.019).
![[Pasted image 20231219154046.png]]
Fig. 1. The architecture of vehicular edge computing.

In VEC, it is critical to save energy consumption and accelerate the computation process by offloading a particular task to the roadside unit (RSU) which is placed with an edge server [7]. Therefore, most existing works in VEC focus on the algorithm design of task offloading, to minimize the response time of tasks or energy consumption. Authors in [5,8] propose adaptive algorithms for task offloading to minimize the average response time of tasks. Authors in [9] propose an efficient algorithm by contract theoretical modeling to minimize the network delay. Authors in [10] propose an intelligent offloading ∗ Corresponding author. E-mail address: asjgwucn@outlook.com (J. Wu). system by leveraging deep reinforcement learning to maximum the total computation and communication rates. Authors in [11] propose an energy-efficient algorithm for resource allocation in VEC. In addition, the offloading algorithm is proposed to minimize the weighted sum of energy consumption and latency [12].

Due to geographical difference of vehicles, the tasks are distributed in different locations. Therefore, the load of edge servers is serious unbalanced, which results in high latency of tasks and energy consumption. However, the task scheduling algorithm in edge servers is only considered in few existing works on VEC. A heuristic algorithm for energy-efficient scheduling is proposed to minimize the energy consumption [7]. A scheduling algorithm based on ant colony optimization is proposed to minimize the completion time of jobs [13]. An algorithm for partial offloading scheduling and power allocation is proposed to minimize the weighted sum of the execution delay and energy consumption in mobile edge computing [14]. Meanwhile, authors in [15] propose a task scheduling algorithm for the applications with computation intensive and time-sensitive to minimize the completion time of tasks.

The RSUs, placed with edge servers, are densely distributed in the VEC system to guarantee the quality of service. Besides, the spatial distribution of vehicles has much difference. For example, vehicles are mainly distributed in city, especially in hot spots, instead of the remote districts. Thus, the task requests are greatly varied in space. For saving energy, some RSUs switch their state into sleep state, when there are few task requests [16–19]. Authors in [20,21] propose algorithms to maximize the energy efficiency by designing the sleeping strategies for base stations. Authors in [22] propose an efficient algorithm to minimize the energy consumption by jointing the cell association and on–off scheme. Authors in [23] propose a novel user-centric energyaware mobility management scheme to minimize the delay of tasks in the mobile edge computing, in which the candidate base stations randomly switch their states between sleep and work. 

To the best of our knowledge, the existing works in VEC mainly target on the area in the algorithm designing for task offloading, only a few of them investigate the algorithms for task scheduling. Meanwhile, none of the existing works in VEC consider that the edge servers may turn to sleep state in some cases. Therefore, in this paper, we investigate the problem of scheduling the tasks in VEC to minimize the response time, in the case of that the edge servers may switch their state between sleep and work according to the traffic of the requests. The contributions of this paper are summarized as follows.

• We propose a novel problem of task scheduling for minimizing the total delay of tasks in VEC, with considering that the edge servers in RSUs can dynamically switch their states between sleep and work. Meanwhile, we model task requests generated by vehicles as an independent Poisson stream, and we model an edge server in the RSU as a simple M/M/1 queuing system. Besides, the proposed problem of minimizing the total delay of tasks is formulated and the NP-hardness is proved in this paper. 
• To solve the proposed problem, we contribute a greedy algorithm by carefully choosing the edge server so that the response time of the task arrived at the current time is minimum. Meanwhile, we customize a tabu search algorithm, which can successfully refine the solution generated by the greedy algorithm. 
• We also propose a deep Q-network based algorithm by utilizing the deep reinforcement learning algorithm to learn the optimal scheduling policy for minimizing the total delay of tasks, without having a priori knowledge of dynamic statistics. 
• Simulation results show that, our proposed algorithms outperform the random algorithm also proposed in this paper in terms of the total response time of tasks. Especially, the deep Q-network based algorithm performs better than the other algorithms in terms of the total response time of tasks. For example, for the case of that the maximum tolerant response time of each task is 14 s, the total response time of tasks decreases by 24.13%, 28.73% and 35.95%, compared with the customized tabu search algorithm, the greedy algorithm and the random algorithm, respectively.

---
Peng, Haixia, 和Xuemin Shen. 《Multi-Agent Reinforcement Learning Based Resource Management in MEC- and UAV-Assisted Vehicular Networks》. _IEEE Journal on Selected Areas in Communications_ 39, 期 1 (2021年1月): 131–41. [https://doi.org/10.1109/JSAC.2020.3036962](https://doi.org/10.1109/JSAC.2020.3036962).

![[Pasted image 20231219154714.png]]
Fig. 1. An illustration of the MEC- and UAV-assisted vehicular network.

![[Pasted image 20231219154745.png]]
Fig. 2. A simplified MEC- and UAV-assisted vehicular network scenario for multi-dimensional resource management.

![[Pasted image 20231219154818.png]]
Fig. 3. The MADDPG framework in the MEC- and UAV-assisted vehicular network.

