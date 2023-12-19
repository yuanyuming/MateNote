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

