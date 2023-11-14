
## Abstract
This paper proposes a novel Reverse Auction-based Computation Offloading and Resource Allocation Mechanism, named RACORAM for the mobile Cloud-Edge computing. The basic idea is that the Cloud Service Center (CSC) recruits edge server owners to replace it to accommodate offloaded computation from nearby resource-constraint Mobile Devices (MDs). In RACORAM, the reverse auction is used to stimulate edge server owners to participate in the offloading process, and the reverse auction-based computation offloading and resource allocation problem is formulated as a Mixed Integer Nonlinear Programming (MINLP) problem, aiming to minimize the cost of the CSC. The original problem is decomposed into an equivalent master problem and subproblem, and low-complexity algorithms are proposed to solve the related optimization problems. Specifically, a Constrained Gradient Descent

Allocation Method (CGDAM) is first proposed to determine the computation resource allocation strategy, and then a Greedy Randomized Adaptive Search Procedure based Winning Bid Scheduling Method (GWBSM) is proposed to determine the computation offloading strategy. Meanwhile, the CSC’s payment determination for the winning edge server owners is also presented. Simulations are conducted to evaluate the performance of RACORAM, and the results show that RACORAM is very close to the optimal method with significantly reduced computational complexity, and greatly outperforms the other baseline methods in terms of the CSC’s cost under different scenarios.

**Index Terms** Computation Offloading; Resource Allocation; Reverse Auction; Mobile Cloud-Edge Computing.

## 1. INTRODUCTION

WITH the technological advancements and the popularity of Mobile Devices (MDs), Internet of Things (IoTs) has opened up a number of attractive application types with computation-intensive features, such as intelligent transportation, health care, Augmented/Virtual Reality (AR/VR), etc [1], [2], [3]. Indeed, the flourishing IoT applications always have intense requirements for users’ Quality of Service (QoS) and computation resources, which leads to higher computation loads and energy consumption than traditional applications. Furthermore, considering the physical size and cost constraints, current MDs have suffered from the limitation of computation resources, which may become an inevitable bottleneck to support these computation intensive applications in the future IoTs [4], [5], [6].

Recently, cloud computing has greatly relieved the conflict between IoT applications and resource-constraint MDs, which enables convenient access to a shared resource pool in the transmission distance in remote cloud-based processing contributes to extra transmission cost and delay [10]. Furthermore, according to Cisco’s recent report [11], the number of Mobile Devices (MDs) is expected to increase from 21.5 billion in 2019 to 28.5 billion by 2022. The CSC’s existing infrastructure is difficult to provide high-quality services for so many resource constrained devices in the future [12]. Fortunately, Mobile Edge Computing (MEC) enables MDs to offload workloads to nearby edge servers [13]. Such capability not only meets the expansion requirements of computation capabilities of MDs, but also improves the QoS of IoT applications with considerably reduced delay and cost [14], [15], [16]. By now, computation offloading in MEC networks has been well investigated in the area of system architecture [17], [18], energy efficiency [19], [20], computation resources optimization [21], [22], etc.

Nevertheless, implementing computation offloading in MEC networks still faces many critical issues. The computation offloading process inevitably consumes a lot of computation and communication resources. From the economical perspective, given that edge server owners (in this paper we refer to Small Base Stations (SBSs) equipped with edge servers) are commonly rational and selfish as they are owned by third-party companies, they have no responsibility to participate in the computation offloading process without receiving any economic reimbursement [23], [24]. Therefore, it is imperative to develop incentive mechanisms, which can encourage idle SBSs with edge servers to assist the CSC in computation offloading by offering them proper rewards for their resource consumptions.

Some researches have put forward different incentive mechanisms to resolve the incentive issues of computation offloading in MEC [25]. However, to our knowledge, the design of incentive mechanisms in mobile Cloud-Edge computing still lacks due attention. In mobile Cloud-Edge computing, we assume that MDs requesting computation offloading services have subscribed to CSC for computation offloading services and paid related fees monthly or yearly. The CSC has a lot of tasks offloaded by resource-constraint subscribed MDs to implement, while SBSs usually have idle computation resources. Long transmission distance and resource shortage caused by the increasing number of offloaded MDs may make CSC be unable to satisfy the delay requirements of MDs. Hence, CSC can recruit SBSs to replace it to accommodate offloaded computation from nearby MDs. Therefore, from the perspective of CSC, it remains open to encourage the participants of SBSs while reducing the cost of CSC. Furthermore, since the same SBS may cover multiple MDs at the same time, and the communication and computation resources of SBSs are limited, it is necessary to jointly consider the computation offloading strategy and resource allocation strategy.

Based on the above analysis, we consider the following issues in this paper: (i) How to develop the reasonable strategy of computation offloading and resource allocation with low-complexity solutions? (ii) How to stimulate SBSs to participate in the offloading process and what is the corresponding payment of the CSC to each SBS? (iii) How to minimize the cost of CSC while satisfying some specific constraints? We answer these issues by proposing a novel Reverse Auction-based Computation Offloading and Resource Allocation Mechanism, named RACORAM. In RACORAM, we use the reverse auction to stimulate SBSs to participate in the offloading process, where CSC acts as the auctioneer and SBSs act as the bidders [26]. Then, we formulate the reverse auction based computation offloading and resource allocation problem as a Mixed Integer Nonlinear Programming (MINLP) problem, aiming to minimize the cost of CSC. We further modify the constraints of the original problem appropriately and decompose the original problem into an equivalent master problem and subproblem, respectively. After that, we propose low-complexity algorithms to solve the related optimization problems. Finally, simulations are conducted to demonstrate the effectiveness of our proposed method. The key contributions are summarized as follows:

1) We propose the system architecture of RACORAM and use the reverse auction to stimulate SBSs equipped with edge servers to participate in the offloading process.
2) The reverse auction-based computation offloading and resource allocation problem is formulated as a Mixed Integer Non-Linear Programming (MINLP) problem, aiming to minimize the cost of CSC.
3) We decompose the original problem into an equivalent _master-problem_ and _sub-problem_, and propose low complexity algorithms to solve the problems. Specifically, we first propose a Constrained Gradient Descent Allocation Method (CGDAM) to determine the resource allocation strategy, and then propose a Greedy Randomized Adaptive Search Procedure based Winning Bid Selection Method (GWBSM) to determine the computation offloading strategy. Meanwhile, the CSC’s payment determination for the winning SBSs is also presented.
4) Simulation results show that RACORAM is very close to the optimal method with significantly reduced computational complexity, and greatly outperforms the other baseline methods in terms of the CSC’s cost under different scenarios.

The remainder of this paper is organized as follows. In Section 2, we review the related work. We introduce the system model in Section 3. In Section 4, we formulate the problem as a MINLP problem with the objective of minimizing the cost of the CSC. Then, we decompose the original problem into an equivalent master problem and sub-problem in Section 5, and present two low-complexity algorithms to resolve the optimization problem in Section 6. Furthermore, we introduce and analyze the simulation results in Section 7. Finally, Section 8 gives the conclusion.

## 2. RELATED WORK

Recently, MEC has attracted extensive attention and research efforts, which effectively mitigates the conflict between high resource application demands and MDs with limited resources. Especially, since the computation task processing in MEC is usually based on distributed collaboration, its core is to achieve dynamic task scheduling by effectively allocating computation, storage, and communication resources in the edge environment [27]. Some studies have investigated the resource allocation in MEC from the aspect of system utility [28]-[32]. Chen _et al._ in [28] proposed an efficient three-step algorithm to minimize the cost of computation offloading in MEC for all MDs in the system. In [29], the authors established a non-convex optimization problem to minimize the delay of all nodes under the framework of collaborative computing, and transformed the problem into convex optimization through the classical successive convex approximation method for processing. Tran _et al._ in [30] considered a multi-MEC server system that assists mobile users in computation offloading, and proposed a heuristic algorithm to maximize MDs utility from the perspective of task delay and energy consumption. In [31], the authors studied the problem of computation resource allocation based on price, and established a two-layer Stackelberg game model to maximize the utility of both the server and the user in the system. In [32], the instance provisioning of a reliability-aware Network Function Virtualization (NFV) in MEC was investigated to maximize the network throughput, which is achieved by providing a primary NFV and a secondary NFV for each MD. Some studies have also investigated the resource allocation in MEC from the aspect of energy consumption [33]-[35]. Yang et al. In [33] proposed a multi-access MEC servers system based on Orthogonal Frequency Division Multiplexing Access (OFDMA), so as to minimize the computation energy consumption of MDs. Chen _et al._ in [34] constructed an energy-saving resource allocation scheme while considering the constraints of delay, channel quality and transmission power, which aims to minimize the energy consumption of task offloading. However, these studies assume that edge server owners are cooperative.

Some studies have focused on the incentive mechanism design for MEC. In [36], the authors proposed an online incentivedriven task allocation scheme in the context of the Industrial Internet of Things, and jointly considered energy consumption, execution time, and available resources to maximize system utility. In [37], the authors utilized an optimal price-based scheme to provide computation offloading services for MDs by charging an appropriate fee, and proved that the proposed scheme can balance individual interests with the overall system interests. Liu et al. In [38] proposed a two-stage Stackelberg game between the Cloud Service Operator (CSO) and Edge Server Owners (ESO), which enables CSO to allocate computation tasks based on ESO status information. In [39], the authors proposed a fully distributed and partially distributed multi-hop network incentive mechanism, which can significantly reduce the node’s computation cost by avoiding the unreal behavior of the node. In [40], the author proposed a profit maximization-based incentive mechanism, which can maximize the profit of edge servers while ensuring the Quality of Experiment (QoE) of MDs. In [41], the authors proposed an online incentive mechanism that allows the base station to perform task scheduling, resource allocation and pricing decisions without knowing any future information, aiming to maximize the utility of the system.

Furthermore, some auction-based incentive mechanisms have been studied and applied to resource allocation, task scheduling, and other applications in MEC. Ma _et al._ in [42] proposed a truthful combined double auction mechanism, which can stimulate edge servers to provide services to nearby mobile users while ensuring budget balance. In [43], the authors introduced two double auction-based dynamic pricing strategies, named BDA and DPDA respectively, to determine the matched pairs between MDs and edge servers, as well as resource allocation schemes which meet the economic properties. The authors in [44] proposed an auction-based mechanism to stimulate edge nodes to allocate their virtual machine resources to MDs for computation offloading in MEC, aiming to maximize the total social welfare. Sun _et al._ in [45] modeled the interaction between edge servers and MDs as a breakeven and breakeven-free based double auction, so as to maximize the efficiency of the system. Le _et al._ in [46] proposed a two-stage incentive mechanism combined with the auction game to minimize the total network delay under the background of the vehicle network. In [47], the authors regarded the resource allocation in MEC as an auction problem and proposed a multitask resource allocation algorithm based on double auction to improve system utility. He _et al._ in [48] proposed an auctionbased online incentive mechanism that can optimize the long-term utility of the system without knowing the future information.

Previous studies on the auction-based incentive mechanism in MEC mainly formulate the auction from the perspective of SBSs, where some SBSs with computation capabilities act as sellers, and MDs requesting computation offloading services act as buyers. In contrast with the previous studies, this paper assumes that MDs requesting computation offloading services have subscribed to the CSC for computation offloading services and paid related fees monthly or yearly. From the perspective of the CSC, it remains open to encourage the participants of SBSs while reducing the cost of the CSC. Therefore, this paper proposes a reverse auctionbased incentive mechanism to stimulate the participation of SBSs, where the CSC acts as the auctioneer and SBSs act as bidders. Then, this paper formulates the reverse auction-based computation offloading and resource allocation problem as a MINLP problem, which aims to minimize the CSC’s cost by jointly considering the computation offloading decision and resource allocation. In addition, since emerging delay-sensitive applications have strong requirements for QoS, MDs’ QoS is also considered in the optimization problem.

## 3. SYSTEM MODEL

This section first presents the system architecture and elaborates the model involved in the system architecture. Then, a detailed definition of the wireless communication model and the model of reverse auction are given.

### 3.1 System Architecture

![[Pasted image 20230801172336.png]]
Fig. 1. System Architecture of Mobile Cloud-Edge Computation Offloading.

As shown in Fig. 1, this paper considers a three-tier mobile CloudEdge computation offloading structure, including a single-cell network, a core network, and a Cloud Service Center (CSC). The core network can communicate with the CSC in the cloud and the base stations in the cellular network through wired links, which is responsible for scheduling the computation task load. For the single-cell network, it consists of a Macro Base Station (MBS), several Small Base Stations (SBSs) equipped with edge servers, and a set of Mobile Devices (MDs). Each MD can communicate with the edge server through the wireless channel provided by the corresponding SBS, and can also communicate with CSC through the wireless channel provided by the MBS. In addition, we assume that each MD has subscribed to CSC for computation offloading services and paid related fees monthly or yearly (including traffic fees caused by data transmission, and service fees caused by occupying server computation resources, etc.).

Since the computation and communication resources of CSC are limited, the long transmission distance and resource shortages caused by the increasing number of offloaded MDs will make CSC be unable to satisfy the delay requirements of MDs. Therefore, CSC can request SBSs near MDs to assist in providing computation offloading services to reduce delay and cut down the cost, especially when the CSC is under high load. Similarly, the communication and computation resources of SBSs are also limited, so multiple MDs might compete for the same SBS simultaneously. Thus, we should jointly consider the computation offloading strategy and resource allocation strategy.

Moreover, assisting the CSC in computation offloading will inevitably generate additional resource consumptions (including communication resources, computation resources, etc.), so SBSs owned by third-party companies will not be willing to participate in computation offloading without economic compensation. In order to encourage SBSs to assist the CSC in computation offloading, the CSC should compensate for the additional resources consumed by SBSs. The specific compensation scheme will be introduced in the model of reverse auction.

![[Pasted image 20230801172512.png]]
TABLE 1. Notations and Explanation

We assume that the set of MDs and SBSs in the singlecell network are N = {1_,_2_,..., N_} and S = {1_,_2_,..., S_}, respectively. More specifically, the relevant information of MDs, SBSs and the CSC are introduced in detail as follows:

- Since each MD has subscribed to the CSC’s computation offloading service, when the MD runs a deadline-sensitive application, it first generates a computation task and then submits the task information to the CSC. We use a three tuple ![[Pasted image 20230801172958.png]] to denote the information of MD _n_’s computation task, where ![[Pasted image 20230801173009.png]] represents the maximum tolerable delay, _cn_ [_Megacycles_] represents the amount of required computation capacity, and _dn_ [_MBs_] represents the amount of input data. In addition, we assume that the computation task is atomic and cannot be divided into subtasks.
- We use a three-tuple _es_ = (_fs,φs, vs_) to represent the state information of SBS $s$ ∈ S, where _fs_ [_cycles/s_] denotes idle computation resources of SBS $s$, _φs_ denotes SBS _s_’s bid of per unit computation resource, and _vs_ denotes SBS _s_’s true value of per unit computation resource.
Note that _vs_ is the private information belonging to SBS $s$.
- The CSC provides computation services to subscribed MDs and charges service fees. However, long transmission distance and resource shortage caused by the increasing number of offloaded MDs may make the CSC unable to satisfy the delay requirements of MDs. Hence, the CSC can purchase a portion of computation resources from SBSs to assist MDs in computation offloading to reduce its cost. We use $ε$ to represent the CSC’s cost of per unit computation resource. In this paper, we clarify that $ε$ includes not only the execution cost of the task, but also the procurement and deployment cost of cloud servers. Therefore, we claim that $ε$ is much larger than _φs_, and the CSC will prioritize offloading computation tasks to SBSs for execution.

For ease of reference, we have listed the notations used in this paper and provided corresponding explanations in Table 1.

### 3.2 The Model of Wireless Transmission

For the channel model between each SBS and MDs, we consider using OFDMA as the multiple access scheme in the uplink, in which the bandwidth of each SBS is $B$ [MHz]. The bandwidth of each SBS is divided into $M$ equal sub-bands, so the bandwidth of each sub-band is $W$ = _B/M_.

We define the set of available sub-bands at each SBS as M = {1_,_2_,..., M_}. Let A = {_ain, s_|_n_ ∈ N_, s_ ∈ S_, i_ ∈ M} denote the set of offloading strategies, in which $a^i_{n, s}=1$ indicates that SBS $s$ is selected to provide computation offloading service for MD $n$ on sub-band $i$, otherwise $a^i_{n, s}=0$ . Furthermore, we denote $\mathcal{N}_{s}=\{n\in\mathcal{N}|\sum_{i\in\mathcal{M}}a_{n, s}^ {{i}} =1\}$  as the set of MDs offloading their computation tasks to SBS $s$, and $\mathcal{N}_{c}=\{n\in\mathcal{N}|\sum_{s\in\mathcal{S}}a_{n, s}^ {{i}} =0\}$  as the set of MDs offloading their computation tasks to the CSC.

The Signal-to-Interference-plus-Noise Ratio (SINR) from MD $n$ to SBS $s$ on sub-band $i$ is expressed as follows:
$$
\mathrm{SINR}_{n,s}^i=\frac{a_{n,s}^ip_ng_{n,s}^i}{\sum_{v\in\mathcal{S}\setminus\{s\}}\sum_{l\in\mathcal{N}_v}a_{l,v}^ip_lg_{l,s}^i+\sigma^2}\tag1
$$

Where _σ_2 is the Gaussian noise of channel, _gn, si_ is the uplink channel gain between MD $n$ and SBS $s$ on sub-band $i$ and _pn_ is the transmission power of MD $n$ when uploading its task to the SBS. The first term at the denominator is the accumulated inter-cell interference. Then, the achievable rate of MD $n$ when uploading data to SBS $s$ is given as:
$$
r_{n,s}=W\log_2\left(1+\sum_{i\in\mathcal{M}}\text{SINR}_{n,s}^i\right),\forall s\in\mathcal{S},n\in\mathcal{N}_s.\tag2
$$

Thus, the transmission time of MD $n$ when sending its task input data _dn_ to SBS $s$ in the uplink can be calculated as:
$$
t_{n,s}^{up}=\frac{d_{n}}{r_{n,s}}. \tag3
$$
Let F = {_fn, s_|_n_ ∈ N_, s_ ∈ S} denote the computation resource allocation strategy for each SBS, in which _fn, s >_ 0 is the amount of computation resources that SBS $s$ allocates to the computation task of MD $n$. Obviously, _fn, s_ = 0, ∀_n /_∈ N_s_. When

MD $n$ offloads the computation task to SBS $s$, its execution delay $t^{exe}_{n, s}$  can be calculated as follows:
$$
t_{n,s}^{exe}=\frac{c_{n}}{f_{n,s}},\forall n\in\mathcal{N}_{s}.\tag4
$$

### 3.3 The Model of Reverse Auction

This paper uses the reverse auction to motivate SBSs to take part in the computation offloading process, where the CSC acts as the auctioneer and SBSs act as the bidders. SBSs lease their idle resources as commodities and report their status information (bids) to the CSC.

Specifically, the auction procedure includes the following three steps:

- Each MD submits the task information _qn_ to the CSC for task scheduling. Meanwhile, each SBS reports its bid vector [_fs,φs_] to the CSC.
- Based on the received task information from MDs and the bids from SBSs respectively, the CSC determines the winners of the auction from the perspective of saving its cost, and then makes the scheduling decision for the winners.
- After receiving offloaded tasks from MDs, winning SBSs will complete the tasks and return the output results back to MDs. When MDs receive the returned results, the CSC will be informed that the tasks are completed, and then the CSC will pay the corresponding rewards to SBSs.

## 4. PROBLEM FORMULATION

In this section, we formulate the objective function of the CSC, and model the reverse auction-based computation offloading and resource allocation problem as a MINLP problem, aiming to minimize the cost of the CSC.

According to Eq. (3) and Eq. (4), the total delay of MD $n$ offloading its task to SBS $s$ can be calculated as follows:
$$
t_{n,s}=t_{n,s}^{up}+t_{n,s}^{exe}=\frac{d_{n}}{r_{n,s}}+\frac{c_{n}}{f_{n,s}},\forall n\in\mathcal{N}_{s}.\tag5
$$


Note that, it is common to ignore the backhual delay of task execution result as we also assume that the task execution result data is very small, e.g., number or text [1], [2], [4]. Without loss of generality, we assume that the average upload rate of MD uploading input data to the CSC via MBS is _rn, c_. Let _fn, c >_ 0 denote the amount of computation resources that the CSC allocates to MD $n$, and _fn, c_ = 0_,_∀_n /_∈ N_c_. Then, we can get the total delay for MD $n$ to offload the computation task to the CSC as:
$$
t_{n,c}=t_{n,c}^{up}+t_{n,c}^{exe}=\frac{d_{n}}{r_{n,c}}+\frac{c_{n}}{f_{n,c}},\forall n\in\mathcal{N}_{c},\tag6
$$

where $t^{up}_{n, c}$ and $t^{exe}_{n, c}$  are the transmission delay and execution delay of the MD respectively. Thus, let _tn_(A_,_F) denote the total delay of MD $n$, which is given as: 
$$
t_n(\mathcal{A},\mathcal{F})=\begin{cases}t_{n,s}=t_{n,s}^{up}+t_{n,s}^{exe}=\frac{d_n}{r_{n,s}}+\frac{c_n}{f_{n,s}},&n\in\mathcal{N}_s\\t_{n,c}=t_{n,c}^{up}+t_{n,c}^{exe}=\frac{d_n}{r_{n,c}}+\frac{c_n}{f_{n,c}},&n\in\mathcal{N}_c\end{cases}\tag7
$$



Considering that in a realistic scenario, MDs’ QoS has a crucial impact on whether MDs will continue to subscribe to CSC’s computation offloading service in the future. In our system model, MDs’ QoS is mainly characterized by the computation task completion time. Therefore, while considering the actual cost generated in the system, we also consider the impact of MDs’ QoS on the expected revenue of CSC in the future. Then, the CSC’s cost can be given as:
$$
\begin{aligned}
Y(\mathcal{A},\mathcal{F})=& \varepsilon\sum_{n\in\mathcal{N}_{c}}f_{n,c}+\sum_{s\in\mathcal{S}}\phi_{s}\sum_{n\in\mathcal{N}_{s}}f_{n,s}  \\
&-\sum_{s\in\mathcal{S}}\sum_{n\in\mathcal{N}_{s}}\lambda_{n}\omega\left(t_{n}^{\mathrm{max}}-t_{n}(\mathcal{A},\mathcal{F})\right),
\end{aligned}\tag8
$$


Where the first term is the cost of resources consumed by CSC to assist MDs in computation offloading, the second item is the cost generated by the CSC to compensate for SBSs participating in computation offloading, and the third item represents the expected total revenue brought by QoS improvement when MDs offload computation tasks to SBSs, in which _t_max_n_ − _tn_(A_,_F) represents the total saved delay of MD $n$. In addition, $ω$ represents the revenue conversion coefficient, and _λn_ ∈ (0_,_1] represents the CSC’s preference towards MD $n$. For example, depending on the service level subscribed by MDs, the CSC will set a higher value of _λn_ for MD $n$ who has paid a higher subscription fee to provide higher-quality services (such as VIP MDs). In other words, _λn_ is used to indicate the service level of MDs. MDs with higher subscribed service levels will bring higher expected revenue to CSC. In return, CSC will provide higher-quality services.

Remark 1. _Compared with SBSs, the CSC has much more computation resources. Therefore, to guarantee MDs’ QoS and simplify the problem, we assume that the computation resources allocated by the CSC to MD_ _n (__fn, c) is a constant, which is positively related to the CSC’s preference towards MD_ _n (__λn), i.e., if_ _λn is larger, then_ _fn, c is greater, and should meet the maximum delay requirement of MD_ _n, i.e.,_ _fn, c_ ≥ _fn, cmin,_∀_n_ ∈ N_c__. To obtain_ _f__n, c__min, we first set_ _tn, c to: _
$$
t_{n,c}=t_n^{max},\forall n\in\mathcal{N}_c.\tag9
$$



_Then, according to Eq._ (6)_,_ _fn, cmin can be calculated as:_
$$f_{n,c}^{m i n}=\frac{c_{n}}{t_{n}^{\operatorname*{max}}-\frac{d_{n}}{r_{n.c}}},\forall n\in\mathcal N_{c}.\tag{10}$$


Now, we formulate the optimization problem as a system cost minimization problem, which can be expressed as:
$$
\operatorname*{min}_{\mathcal{A},\mathcal{F}} Y(\mathcal{A},\mathcal{F}) \tag{11}
$$

$$
\mathrm{s.t.}\ \ \ a_{n,s}^{i}\in\{0,1\},\quad \forall n\in\mathcal{N},s\in\mathcal{S},i\in\mathcal{M}, \tag{12}
$$

$$
f_{n,s}>0,\quad \forall n\in\mathcal{N}_{s},s\in\mathcal{S},\tag{13}
$$

$$
\sum_{n\in\mathcal{N}_{s}}f_{n,s}\leq f_{s},\quad \forall s\in\mathcal{S},\tag{14}
$$

$$
\sum_{s\in\mathcal{S}}\sum_{i\in\mathcal{M}}a_{n,s}^{i}\leq1,\quad \forall n\in\mathcal{N},\tag{15}
$$

$$
\sum_{n\in\mathcal{N}}a_{n,s}^{i}\leq1,\quad \forall s\in\mathcal{S},i\in\mathcal{M}, \tag{16} 
$$

$$
t_{n}(\mathcal{A},\mathcal{F})\leq t_{n}^{max},\quad \forall n\in\mathcal{N}. \tag{17} 
$$


With $Y$ (A_, F) given in Eq. (8), the meaning of the constraints can be explained as follows: constraints (12) and (15) indicate that each MD can offload to the CSC or at most one SBS on one sub-band; constraint (16) implies that each SBS can serve at most one MD per sub-band; constraints (13) and (14) imply that each SBS must allocate a positive computation resource to the associated MDs and the total computation resources allocated to all the associated MDs must not excess the SBS’s idle computation resources; constraint (17) guarantees that the total delay of the offloaded computation task does not exceed its maximum tolerable delay. Moreover, the optimization problem has both binary variables and continuous non-integer variables. Therefore, the proposed optimization problem is a complex non-convex MINLP problem, which has been demonstrated to be a typical NP-hard problem [43], [51], [52], [53].

## 5. PROBLEM TRANSFORMATION AND DECOMPOSITION

In this section, we first modify the constraints of the original problem appropriately so that the constraints on the offloading strategy A and the resource allocation strategy F can be separated from each other. Then, we decompose the original problem into an equivalent _master-problem_ and _sub-problem_.

To meet the delay requirement of Constraint (17), we first have to obtain the minimum computation resources $f_{n, s}^{\min}$ that need to be provided if MD $n$ is assisted by SBS $s$ to perform computation offloading. According to Eq. (7), Constraints (13) and (17) can be rewritten as follows:
$$
\sum_{n\in\mathcal{N}_s}f_{n,s}^{\min}\leq f_s,\quad\forall s\in\mathcal{S},\tag{18}
$$

$$
f_{n,s}\geq f_{n,s}^{\min},\quad\forall n\in\mathcal{N}_s,s\in\mathcal{S},\tag{19}
$$

$$
f_{n,s}^{min}>0,\quad\forall n\in\mathcal{N}_s,s\in\mathcal{S},\tag{20}
$$


where $f_{n, s}^{\min}=\frac{c_n}{t^{max}_n-\frac{d_n}{r_{n, c}}}$ denotes the minimum computation resources that need to be provided if MD $n$ is assisted by SBS $s$ to perform computation offloading. Obviously, $f_{n, s}^{\min} = 0,\forall n \notin \mathcal{N}_s$  


Hence, if A and F satisfy the Constraints (18)(19)(20), the Constraints (13) and (17) are also satisfied. Thus, we can rewrite the original problem as follows:
$$
\min_{\mathcal{A}}\left(\min_{\mathcal{F}}Y(\mathcal{A},\mathcal{F})\right)\tag{21}
$$

$$
s.t.\ (12),(15),(16),(18),(20),\tag{22}
$$

$$
(14),(19). \tag{23}
$$


It is worth noting that the constraints on the offloading strategy A in (22), and the resource allocation strategy F in (23), are decoupled from each other. Now, solving the problem in (21) is equivalent to solving the following problem:
$$
\min_{\mathcal{A}}Y^*(\mathcal{A}) \tag{24}
$$

$$
\mathrm{s.t.}\quad(12),(15),(16),(18),(20),\tag{25}
$$


In which $Y$ ∗(A) corresponds to the optimal-value function when the resource allocation strategy F takes the optimal solution under the fixed offloading strategy Ae, written as:
$$
Y^*(\mathcal{A})=\min_{\mathcal{F}}Y(\widetilde{\mathcal{A}},\mathcal{F})\tag{26}
$$

$$
{s.t.}\quad(14),(19).\tag{27}
$$


Moreover, decomposing problem (21) into problems (24) and (26) can still keep the optimality of the solution. In the next section, we will propose two low-complexity algorithms to obtain the suboptimal resource allocation strategy F and offloading strategy A.

## 6. MAIN APPROACH

This section presents our low-complexity approaches to solve the above optimization problem. We first propose a computation resource allocation method, and then a winning bid selection method. Finally, we present the CSC’s payment determination for the winning SBSs.

### 6.1 Computation Resource Allocation

This part proposes a Constrained Gradient Descent Allocation Method to allocate computation resources for each MD that offloads tasks to the SBS, named CGDAM.

Once a feasible offloading strategy Ae that satisfies constraint (22) is given, then according to Eq. (8), the objective function in (26) can be expressed as follows:
$$
Y(\widetilde{\mathcal{A}},\mathcal{F})=\varepsilon\sum_{n\in\mathcal{N}_{c}}f_{n,c}+Z(\widetilde{\mathcal{A}},\mathcal{F}),\tag{28}
$$
$$
\begin{aligned}\text{where}\ Z(\widetilde{\mathcal{A}},\mathcal{F})&=\sum_{s\in\mathcal{S}}\phi_s\sum_{n\in\mathcal{N}_s}f_{n,s}-\\&\sum_{s\in\mathcal{S}}\sum_{n\in\mathcal{N}_s}\lambda_n\omega\left(t_n^{\max}-t_{n,s}\right).\end{aligned}\tag{29}
$$


The first item in Eq. (28) represents the actual cost generated by the CSC, while the second item represents the expected cost generated by SBSs. Obviously, the first item of Eq. (28) is constant when the offloading strategy Ae is fixed, so _Z_(Ae_,_F) can be regarded as a new objective function. Therefore, problem (26) can be rewritten as:
$$
\min_{\mathcal{F}}Z(\widetilde{\mathcal{A}},\mathcal{F})\tag{30}
$$

$$
\mathrm{s.t.}\quad(14),(19). \tag{31}
$$


Next, according to Eq. (29), the second-order derivative of _Z_(Ae_,_F) is calculated to get w.r.t _fn. S_, which is expressed as:
$$
\begin{array}{ll}\frac{\partial^2Z}{\partial^2f_{n,s}}=\frac{2c_n\lambda_n\omega}{f_{n,s}^3}>0,&\forall s\in\mathcal{S}n\in\mathcal{N}_s,\\
\frac{\partial^2Z}{\partial f_{n,s}\partial f_{v,w}}=0,&\forall(n,s)\neq(v,w),\end{array}\tag{32}
$$


Where the Hessian matrix of _Z_(Ae_,_F) is diagonal with strictly positive elements, so it is positive-definite. Hence, problem (30) is convex and can be solved with the Lagrangian duality and Karush-Kuhn-Tucker (KKT) conditions [49]. However, solving a multi-variable system of non-linear equations brings high complexity [50].

In order to reduce the algorithm complexity, we design Algorithm 1 to solve this _sub-problem_. We first divide the computation resources of each SBS into many tiny atomic pieces, denoted by $ϕ$, and then allocate these computation resources pieces to each MD one by one. The key of the Algorithm 1 is to allocate computation resources pieces to the MD with the fastest change (which means that the gradient is negative and smallest) in each assignment. It is worth noting that the smaller the division of computation resources, the closer the final solution is to the optimal solution. More details are shown in Algorithm 1.

Remark 2. _(Complexity Analysis of Algorithm 1)_

_In Algorithm 1, we denote $f^{rem}_{s}$ 
_as the remaining computation resources of SBS s under a fixed offloading strategy_ Ae_, and $\mathcal{S}^{win}=\{s\in\mathcal{S}|\sum_{n\in\mathcal{N}}\sum_{i\in\mathcal{M}}a_{n, s}^{i}>0\}$ 
_as the set of winning_

_bids in the reverse auction. The complexity of Algorithm 1 depends on_ |S_win_| _and the number of computation resources pieces_ _νs (which is calculated by $\varphi$ and $f_s^{rem}$). In the worst case, the loop complexity of the inner layer is up to_ _O_(_νs_)_, while the complexity of the outer layer is_ _O_(|S_win_|)_. In summary, we can know that the maximum complexity of Algorithm 1 is_ _O_(|S_win_| × _ν_)_._

![[Pasted image 20230801221446.png]]

### 6.2 Winning Bid Selection

With Algorithm 1, we can obtain the solution of computation resource allocation strategy F∗ under the fixed offloading strategy. Then, according to Eqs. (26), (28) and (30), we have:
$$
Y^*(\mathcal{A})=\varepsilon\sum_{n\in\mathcal{N}_c}f_{n,c}+Z(\mathcal{A},\mathcal{F}^*).\tag{33}
$$

According to Eq. (33), we can rewrite the problem in (24) as:
$$
\min_{\mathcal{A}}\varepsilon\sum_{n\in\mathcal{N}_c}f_{n,c}+Z(\mathcal{A},\mathcal{F}^*)\tag{34}
$$

$$
\mathrm{s.t.}\quad(12),(15),(16),(18),(20). \tag{35}
$$

Obviously, it is very difficult to solve this combinatorial optimization problem in polynomial time. The simplest way to solve this problem is by using the exhaustive method, but it takes 2_N_×_S_×_M_ times to search all the solutions, which is obviously impractical. Therefore, we design a Greedy Randomized Adaptive Search Procedure based Winning Bid Selection Method, named GWBSM to solve this _master-problem_, which can find approximate solutions in polynomial time. We first give some related definitions.

**Definition 1.** _We define_ $cost_{n, s}^i$ to indicate the minimum actual cost generated by MD n offloading the computation task to SBS s on sub-band i, which is given as:_
$$
cost_{n,s}^i=\phi_s\hat{f}_{n,s}^{min}=\frac{\phi_sc_n}{t_n^{\max}-\frac{d_n}{\hat{r}_{n,s}}},\tag{36}
$$

_where_ $\hat{f}_{n, s}^{min}=\frac{c_n}{t_n^{\max}-\frac{d_n}{\hat{r}_{n, c}}}$  denotes the minimum computation resource required when SBS_ _s provides offloading services to MD_ _n without considering inter-cell interference._

**Definition 2.** _Similar to Definition 1, we define_ $cost_{n, c}$ 
_to indicate the minimum actual cost for MD_ _n to offload the computation task to the CSC, which is given as:_
$$
cost_{n,c}=\varepsilon f_{n,c}^{min}=\frac{\varepsilon c_{n}}{t_{n}^{\max}-\frac{d_{n}}{r_{n,c}}}.\tag{37}
$$


**Definition 3.** _According to Definition 1 and Definition 2, we define_ $profit^i_{n, s}$
_to represent the cost saved (also called the increased profit) for the CSC when the computation task of MD_ _n is offloaded to SBS_ _s on sub-band_ _i, which is given as:_
$$
profit_{n,s}^i=cost_{n,c}-cost_{n,s}^i.\tag{38}
$$


As shown in Algorithm 4, each iteration of GWBSM mainly includes two stages: construct greedy randomized solution and local search. The construction stage is mainly used to generate a feasible solution, and then its solution will be put into the local search for neighborhood search until a local optimal solution is found. Next, we introduce these two stages in detail.

#### 6.2.1 Construct Greedy Randomized Solution

A simple way to construct the greedy solution is to select the offloading strategy that can bring the largest profit to the CSC according to Definition 3. However, the solution obtained in this way will make GWBSM fall into a local optimum, so we introduce a random factor that is the greedy value denoted by $θ$ ∈ (0_,_1).

![[Pasted image 20230801221803.png]]

According to Definition 3, we first evaluate the profits of offloaded tasks to SBSs by each MD. Then, we build a Restricted Candidate List (RCL) based on the greedy value $θ$ (Lines 5-6), and randomly select an element from RCL to determine whether it can be added to the current offloading strategy (Lines 7-16). In each while-loop of the selection of the element from RCL, regardless of whether this element is added to the current offloading strategy or not, the relevant element needs to be removed from the remaining optional elements to ensure that the constraints (15)(16) are satisfied (Lines 17-18). More details are shown in Algorithm 2.

#### 6.2.2 Local Search

![[Pasted image 20230801222308.png]]
In the first stage of construction, the feasible solution obtained may not be optimal, so a local search should be performed in the neighborhood of the feasible solution. The basic idea of this stage is to search the neighborhood of the feasible solution generated in the construction stage, and replace the current feasible solution with the optimal adjacent solution to find the current optimal solution (Lines 7-9 and Lines 16-18). The design of the specific neighborhood operator is introduced in Line 4 and Line 13 of Algorithm 3. More details are shown in Algorithm 3.

It can be found that GWBSM has two main parameters: greedy value $θ$ and Max-Iteration. The number of elements in RCL depends on $θ$. $θ$ = 0 means that any feasible element will be randomly selected in the construction stage, which will make the solution search range too wide and difficult to find the optimal solution. On the contrary, $θ$ = 1 means that only the elements with the largest profits will be selected, which makes GWBSM fall into a local optimum. For the Max-Iteration, it is the condition for the termination of GWBSM. In each iteration, GWBSM will find a new solution to replace the current optimal solution (Lines 4-8 in Algorithm 4), but the probability that the new solution is better than the current solution will decrease as the number of iterations increases. Therefore, the larger the value of Max-Iteration, the better the quality of the final solution. However, the complexity of GWBSM is linearly related to Max-Iteration, so how to set a proper Max-Iteration is also crucial. The detail of the proposed GWBSM is shown in Algorithm 4.

Remark 3. _(Complexity Analysis of Algorithm 4)_ _Obviously, the complexity of Algorithm 4 depends on Algorithm 2, Algorithm 3, and Max-Iteration. For Algorithm 2, only one layer of while-loop is included, and its maximum complexity is_ _O_(_N_)_. For Algorithm 3, its complexity depends on Algorithm 1 and the neighborhood size of the current feasible solution. Then, according to Remark 2, we can get the complexity of Algorithm 3 as_ $O (\frac{M|S^{win}| (|S^{win}+M)}2 \times |S^{win}| \times\nu)$

_We use_ _ξ to represent Max-Iteration and let_ |S_win_| _be equal to_ _W. Since the complexity of Algorithm 2 is too small to be ignored, the complexity of_ _Algorithm 4 can be obtained as_ $O (\frac{MW^2 (W+M)\times\nu\times\xi}2)$
_Furthermore, since GWBSM is a multi-start heuristic algorithm, and the solution in each iteration can be computed independently, the runtime can be greatly reduced by utilizing parallel computing._

### 6.3 Payment Determination

For each winning bid, the CSC needs to make a reasonable payment determination to ensure that each SBS will honestly report the value of its resources. In this paper, we adopt a payment rule based on the standard Vickrey-Clarke-Groves (VCG) scheme for GWBSM [26]. The proposed payment rule can encourage SBSs to participate in computation offloading, while ensuring the individual rationality and truthfulness properties.

In the standard VCG scheme, each winner will pay the “opportunity cost” caused to other participants. The “opportunity cost” of bidder $s$ is defined as the total bids of all the other bidders that would win without the participation of bidder $s$, minus the sum of bids of all the other actual winning bidders. Next, we introduce the following definitions:

Definition 4. _We define_ _βs to represent the increment in CSC’s revenue after choosing SBS_ _s to participate in the computation offloading, which is given as:_
$$\beta_{s}=\varepsilon\sum_{n\in N_{s}}f_{n,c}^{m i n}+\sum_{n\in N_{s}}\lambda_{n}\omega\left(t_{n}^{\mathrm{max}}-t_{n}(A,{\mathcal{F}})\right).\tag{39}$$


Definition 5. _We define_ _αs to represent the sum cost of SBS_ _s by serving its associated MDs, which is given as:_
$$
\alpha_s=\phi_s\sum_{n\in\mathcal{N}_s}f_{n,s}.\tag{40}
$$

![[Pasted image 20230801222643.png]]

According to Definition 4 and Definition 5, we define _Y_S−_s_(A_,_F) as the optimal solution without considering the profit brought by SBS $s$, which can be expressed as:
$$
Y_{\mathcal{S}}^{-s}(\mathcal{A},\mathcal{F})=Y_{\mathcal{S}}(\mathcal{A},\mathcal{F})+(\beta_s-\alpha_s).\tag{41}
$$


Furthermore, we use _Y_S\{_s_}(A_,_F) to denote the new optimal solution without considering the participation of SBS $s$. Then, the payment paid to SBS $s$ is given as:
$$
p_s=\beta_s-\left(Y_{\mathcal{S}}^{-s}(\mathcal{A},\mathcal{F})-Y_{\mathcal{S}\setminus\{s\}}(\mathcal{A},\mathcal{F})\right).\tag{42}
$$

Let _σs_ = _vs_ P_n_∈N_s_ _fn, s_ denote the sum of the true valuation consumed by SBS $s$ in the computation offloading process. Then, the utility of each SBS $s$ ∈ S_win_ is defined as:

$$
\delta_s=p_s-\sigma_s.\tag{43}
$$


We define the payment of those SBSs _s /_∈ S_win_ as 0, then the details of the proposed Payment Determination are shown in Algorithm 5.
Remark 4. _(Complexity Analysis of Algorithm 5)_ _According to Remark 3, we know that the complexity of_ _Algorithm 5 is_ $O (\frac{MW^3 (W+M)\times\nu\times\xi}2)$

### 6.4 Proof of Properties

In this part, we prove that the payment rule satisfies two crucial properties: individual rationality and truthfulness. The individual rationality guarantees that each winner can get a non-negative utility, which is essential for SBSs to participate in the computation offloading process. The truthfulness prevents SBSs obtaining higher utility by bidding untruthfully.

Theorem 1. _(Individual Rationality). The payment rule defined in Eq._ (42) _satisfies the individual rationality property, i.e.,_ ∀_s_ ∈S_,δs_ = _ps_ − _σs_ ≥ 0_._
_Proof._ Based on Eq. (42), we can get:
$$
\begin{aligned}
p_{s}& =\beta_{s}-\left(Y_{\mathcal{S}}^{-s}(\mathcal{A},\mathcal{F})-Y_{\mathcal{S}\setminus\{s\}}(\mathcal{A},\mathcal{F})\right)  \\
&=\beta_{s}-\left(Y_{\mathcal{S}}(\mathcal{A},\mathcal{F})-Y_{\mathcal{S}\setminus\{s\}}(\mathcal{A},\mathcal{F})+\beta_{s}-\alpha_{s}\right) \\
&=Y_{\mathcal{S}\setminus\{s\}}(\mathcal{A},\mathcal{F})-Y_{\mathcal{S}}(\mathcal{A},\mathcal{F})+\alpha_{s}.
\end{aligned}
$$
When each SBS $s\in S$ bids truthfully, i.e., $\alpha_s=\sigma_s$, we can obtian:
$$
\begin{aligned}
\delta_{s}& =p_{s}-\sigma_{s}  \\
&=Y_{\mathcal{S}\setminus\{s\}}(\mathcal{A},\mathcal{F})-Y_{\mathcal{S}}(\mathcal{A},\mathcal{F}) \\
&\geq0.
\end{aligned}
$$

Hence, the individual rationality property is satisfied.

Theorem 2. _(Truthfulness). The payment rule defined in Eq._ (42) _satisfies the truthfulness property, i.e., it is a weakly dominant strategy for each SBS to set the bid_ _φs_ = _vs__._
_Proof._ We assume that a certain SBS $s$ declares the bid $\phi'_s$ untruthfully, i.e., $\phi'_s > v_s$. According to Eq. (43), the utility that SBS $s$ receives becomes:
$$
\begin{aligned}
\delta_{s}^{\prime}& =p_{s}^{\prime}-\sigma_{s}  \\
&=\beta_{s}^{\prime}-\left(Y_{\mathcal{S}}^{-s}(\mathcal{A}^{\prime},\mathcal{F}^{\prime})-Y_{\mathcal{S}\setminus\{s\}}(\mathcal{A},\mathcal{F})\right)-v_{s}\sum_{n\in\mathcal{N}_{s}}f_{n,s}.
\end{aligned}
$$
Then, the difference of SBS $s\in \mathcal{S}^{win}$ 's utility after submitting the untruthful bid and the truthful bid is given by:
$$
\begin{aligned}
\hat{\delta}_{s}& =\delta_{s}^{\prime}-\delta_{s}  \\
&=\beta_{s}'-\left(Y_{\mathcal{S}}^{-s}(\mathcal{A}',\mathcal{F}')-Y_{\mathcal{S}\setminus\{s\}}(\mathcal{A},\mathcal{F})\right)-v_{s}\sum_{n\in\mathcal{N}_{s}}f_{n,s} \\
&-\left(Y_{\mathcal{S}\setminus\{s\}}(\mathcal{A},\mathcal{F})-Y_{\mathcal{S}}(\mathcal{A},\mathcal{F})+\alpha_{s}-v_{s}\sum_{n\in\mathcal{N}_{s}}f_{n,s}\right) \\
&=\beta_{s}^{\prime}-Y_{\cal S}^{-s}(\mathcal{A}^{\prime},\mathcal{F}^{\prime})+Y_{\cal S}(\mathcal{A},\mathcal{F})-\alpha_{s} \\
&=\beta_{s}^{\prime}-(Y_{\cal S}(\mathcal{A}^{\prime},\mathcal{F}^{\prime})+\beta_{s}^{\prime}-\alpha_{s}^{\prime})+Y_{\cal S}(\mathcal{A},\mathcal{F})-\alpha_{s} \\
&=Y_{\cal S}({\cal A},{\cal F})-\alpha_{s}-(Y_{\cal S}({\cal A}^{\prime},{\cal F}^{\prime})-\alpha_{s}^{\prime}).
\end{aligned}
$$
Since $\mathcal{S}^{win}$ is the solution that minimizes the objective function Eq. (8), we have
$$
Y_{\mathcal{S}}(\mathcal{A},\mathcal{F})-\alpha_{s}\leq Y_{\mathcal{S}}(\mathcal{A}',\mathcal{F}')-\alpha_{s}'.
$$

Therefore, _δ_ˆ_s_ ≤ 0, which means SBSs cannot increase their utility by bidding untruthfully.

## 7. PERFORMANCE EVALUATION

The optimization problem in this paper belongs to NP-hard, and it is impossible to obtain the optimal solution in polynomial time. Therefore, we cannot obtain the optimality gap of the proposed algorithm theoretically. We analyze the optimality gap of the proposed algorithm through simulation. This section evaluates the performance of RACORAM as well as compares it with other baseline methods, and studies the impact of parameters on the performance of RACORAM.

### 7.1 Simulation Settings

In the simulation, we consider that in a single-cell scenario, there are several SBSs uniformly distributed and multiple MDs randomly distributed. Parameters in the simulation are mainly set according to the parameters in [1], [2], [4], [5]. For each SBS, unless otherwise specified, we assume that the uplink bandwidth is set to $B$ = 20_/_40 MHz, and the idle computation resources _fs_ is in the range of [10_,_20] GHz. For the uplink channel gain, we use the distance-dependent path-loss model to calculate, which is given as _L_[dB] = 140_._7 + 36_._7 log 10 _d_[km] [54], and the log-normal shadowing standard deviation is set to 8 dB. The background noise power is set to _σ_2 = −100 dBm, and the MDs’ transmission power is set to _pn_ = 20 dBm. In addition, each SBS’s bid of per unit computation resource _φs_ is normally distributed over [0_._1_,_0_._2] monetary units (e.g., US dollars, or RMB)_/_(_Megacycle_). Similarly, the CSC’s cost of per unit computation resource $ε$ is set to 0_._3_/_(_Megacycle_). We assume that there are three types of computation tasks generated by MDs, and the specific information is shown in Table 2. In the simulations, unless stated otherwise, the computation tasks generated by each MD will randomly be one of the three types.

![[Pasted image 20230801223118.png]]
TABLE 2. Computation Task Type

### 7.2 Compared Baselines

The proposed RACORAM is compared with the following baselines.

- _Exhaustive Offloading and Joint CGDAM_ (EOJC): As we mentioned before, the exhaustive method takes 2_N_×_S_×_M_ times to find out the optimal offloading strategy. Because of the enormous computational complexity of this method, we only evaluate its performance in the sparse network. Furthermore, CGDAM is used to allocate computation resources.
- _Random Offloading and Joint CGDAM_ (ROJC): The computation tasks of MDs are randomly assigned to the nearby SBSs, and tasks which cannot be handled by the SBSs will be uploaded to the CSC. Meanwhile, CGDAM is also used to allocate computation resources.
- _Greedy Offloading and Joint Minimum Resource Allocation_ (GOJMRA): In GOJMRA, offloaded tasks prioritize selecting the offloading strategy that can bring the largest profits to the CSC according to Definition 3. Moreover, the computation resources allocated to each task offloaded to SBSs only meet their maximum delay requirements.
- _ALL Cloud Execution_ (ACE): All computation tasks are served by the CSC. Certainly, this method performs worst, and will not be analyzed in the following performance evaluation.
- _Winning Bid Selection_ (WBS) [44]: WBS is divided into two phases. In phase 1, the bid set and the SBS set are updated, and the bids which cannot satisfy the delay constraints are removed; In phase 2, an _n_-to-one weighted bipartite graph with capacity constraints is constructed, the CSC selects suitable SBSs to form a maximum matching with the approximately maximum weight. The computation resources for each MD are allocated according to Algorithm 1, and phases 1 and 2 are repeated until the suitable SBS set is empty.

For fairness, the payment rules of the above five methods are the same as that in RACORAM, which has been shown in Algorithm 5.

### 7.3 Impact of Greedy Value and Max-Iteration

This part evaluates the impact of greedy value $θ$ and MaxIteration on the performance of the proposed RACORAM. We design four types of RACORAM with different greedy values, which are {0_._2_,_0_._4_,_0_._6_,_0_._8} respectively. Meanwhile, the value of Max-Iteration is in the range of [1_,_30]. We set the number of MDs as $N$ = 25, the number of SBSs as $S$ = 8, and each SBS has $M$ = 4 sub-bands.

![[Pasted image 20230802085121.png]]
Fig. 2. The cost of the CSC under RACORAM with different greedy values.

Fig. 2 shows the performance comparison of four types of RACORAM in terms of the CSC’s cost with the increase of the value of Max-Iteration. It can be found that with the increase of the value of Max-Iteration, the quality of the final solution found by RACORAM is better, so the CSC’s cost will decrease continuously. However, as the solution found by RACORAM tends to the optimal solution, the CSC’s cost will gradually stabilize. Furthermore, as the greedy value $θ$ increases, the minimum value of Max-Iteration required to stabilize the cost of the CSC decreases. This is because the increase of $θ$ will reduce the size of RCL, so RACORAM only needs a smaller value of Max-Iteration to find the corresponding suboptimal solution. On the other hand, as $θ$ decreases, the CSC’s cost becomes smaller when it stabilizes. This is because reducing $θ$ will increase the size of RCL, so the higher probability of a better solution of RACORAM is found.

Considering the CSC’s cost and the running time of RACORAM, we set greedy value $θ$ = 0_._6 and Max-Iteration = 10 in the following simulations.

### 7.4 Performance Comparison

In this part, the performance of RACORAM is compared with the optimal solution obtained by EOJC and also with the other baseline methods in terms of the CSC’s cost. Then, we compare the performance of RACORAM with ROJC, GOJMRA, ACE, and WBS in terms of the CSC’s cost under different scenarios, while the EOJC method is omitted due to the enormous computational complexity.

#### 7.4.1 Suboptimality

Firstly, we verify the suboptimal nature of our proposed RACORAM. Although EOJC can obtain the optimal solution, its enormous computational complexity makes the simulation only available in the sparse network. Therefore, we set the number of MDs as $N$ = 6, the number of SBSs as $S$ = 4, and each SBS has $M$ = 2 sub-bands.

![[Pasted image 20230802085303.png]]
Fig. 3. Comparison of the CSC’s cost under different computation task types.

Fig. 3 shows the performance comparison of RACORAM with other baseline methods in terms of the CSC’s cost under different computation task types. Since some tasks may be more sensitive to delay, or have larger data size, or have larger required CPU cycles, we use the task type to represent different types of tasks generated in the system. Through this process, we can evaluate whether our proposed solution is suitable for general situations. For the abscissa, Type 1 (or Type 2, Type 3) means that all computation tasks generated by MDs in the system are Type 1 (or Type 2, Type 3), but Mixed Type means that the computation tasks generated by each MD will randomly be one of the three types. It can be found that the performance of RACORAM is very close to the optimal solution EOJC, and its performance is significantly better than other baseline methods. In addition, the average running time of EOJC is more than 100 times that of RACORAM in such a small network. This is because the greedy randomized adaptive search procedures used by RACORAM have excellent convergence stability and global exploration capabilities, and can obtain a suboptimal solution that is comparable to the exhaustive method in a short time. We also observe that with the increase of the maximum tolerable delay required for different types of computation tasks, the performance superiority of RACORAM compared to other baseline methods is more obvious. The main reason is that RACORAM considers the improvement of MDs’ QoS in the optimization problem.

#### 7.4.2 The CSC’s Cost Under Different Number of MDs

This part compares RACORAM with ROJC, GOJMRA, ACE, and WBS in terms of the CSC’s cost under different number of MDs. We set the number of SBSs as $S$ = 12, and each SBS has $M$ = 4 sub-bands. Meanwhile, the number of MDs is in the range of [10_,_40].

![[Pasted image 20230802085446.png]]
Fig. 4. Comparison of the CSC’s cost under different number of MDs.

Fig. 4 shows the performance comparison of RACORAM, ROJC, GOJMRA, ACE, and WBS in terms of the CSC’s cost under different number of MDs. It can be found that with the increase of the number of MDs, more computation tasks will be offloaded by MDs, so the cost of the CSC will increase continuously. The CSC’s cost in RACORAM increases slowly as the number of MDs increases, compared with other baselines, which illustrates that RACORAM performs best. When the number of MDs increases to a large value, the CSC’s cost of our proposed RACORAM is close to GOJMRA and WBS. This is because when the SBS serves too many MDs, the idle computation resources of the SBS cannot meet or only meet the maximum delay of MDs. For WBS, since it cannot avoid the local optimum problem in the selection of the offloading strategy and does not consider the improvement of MDs’ QoS, it performs worse than our proposed RACORAM. For GOJMRA, since the CSC selects the SBS with the largest utility for each MD in turn, without considering allocating additional computation resources to MDs, the performance of GOJMRA is slightly worse than WBS. For ROJC, SBSs have sufficient idle resources to provide high-quality services to nearby MDs when the number of MDs is small, so the current performance of ROJC is close to RACORAM and better than WBS and

GOJMRA. However, the randomly generated offloading strategies in ROJC cannot meet the resource constraints of SBSs when the number of MDs is larger, which causes most MDs to offload their computation tasks to the CSC. In this case, ROJC’s performance is the worst compared with RACORAM, WBS, and GOJMRA.

#### 7.4.3 The CSC’s Cost Under Different Number of SBSs

This part compares RACORAM with ROJC, GOJMRA, WBS, and ACE in terms of the CSC’s cost under different number of SBSs. We set the number of MDs as $N$ = 25, and each SBS has $M$ = 4 sub-bands. Meanwhile, the number of SBSs is in the range of [0_,_12].

![[Pasted image 20230802085515.png]]
Fig. 5. Comparison of the CSC’s cost under different number of SBSs.

Fig. 5 shows the performance comparison of RACORAM, ROJC, GOJMRA, WBS, and ACE in terms of the CSC’s cost under different number of SBSs. With the increase of the number of SBSs, more SBSs can assist the CSC to offload computation tasks, so the cost of the CSC will decrease continuously. Our proposed RACORAM still performs best. This is because RACORAM uses a GWBSM algorithm to obtain the near-optimal offloading strategy in each SBS’s coverage area, and considers the improvement of MDs’ QoS in the optimization problem, so the CSC has a greater possibility to select more valuable SBSs to participate in computation offloading. In contrast, WBS only considers assigning computation tasks to the SBS that can bring the maximum profit, while ignoring the potential impact of channel conditions and unassigned computation tasks. Therefore, WBS can only find the local optimal solution. For GOJMRA, it assigns computation tasks to the SBS that can bring the maximum profit in turn, while ignoring the impact of the resource allocation. Therefore, the performance of GOJMRA is worse than WBS. Furthermore, it’s obvious that ROJC performs worst. The main reason is that ROJC randomly assigns the computation tasks of each MD to nearby SBSs, resulting in a large number of SBSs unable to provide services under delay constraints.

#### 7.4.4 The CSC’s Cost Under Different Idle Computation Resources of SBSs

This part compares RACORAM with ROJC, GOJMRA, WBS, and ACE in terms of the CSC’s cost under different idle computation resources of SBSs. We set the number of MDs as $N$ = 25, the number of SBSs as $S$ = 12, and each SBS has $M$ = 4 sub-bands. Meanwhile, the idle computation resources of each SBS is in the range of [0_,_20] GHz.

![[Pasted image 20230802085628.png]]
Fig. 6. Comparison of the CSC’s cost under different idle computation resources of SBSs.

Fig. 6 shows the performance comparison of RACORAM, ROJC, GOJMRA, WBS, and ACE in terms of the CSC’s cost under different idle computation resources of SBSs. With the increase of the idle computation resources of SBSs, more MDs can be served by SBSs, so the CSC’s cost will decrease continuously. Furthermore, the cost of the CSC in RACORAM decreases significantly as the idle computation resources of SBSs increase, compared with that of WBS, GOJMRA, and ROJC, which demonstrates that RACORAM performs best. When the idle computation resources of SBSs increase to a large value, i.e, 18 GHz, the CSC’s cost in RACORAM, WBS, and ROJC still slowly decrease while GOJMRA is almost unchanged. This is because when the idle computation resources of SBSs are sufficient, each SBS can meet the computation resource requirements of all MDs in its coverage area under the maximum tolerable delay. We know that the computation resources allocated to MDs in GOJMRA only meet their maximum tolerable delay requirements, so if the idle computation resources of SBSs are sufficient to complete the computation task within the maximum tolerable delay, then GOJMRA will almost unchange. In contrast, RACORAM and ROJC use the CGDAM algorithm to allocate additional idle computation resources when the idle computation resources of SBSs are sufficient, thereby reducing the expected cost of the CSC. Obviously, ROJC still performs worst.

### 7.5 Evaluation of Individual Rationality and Truthfulness

In this part, we verify the individual rationality and truthfulness properties of the proposed payment determination in RACORAM. Firstly, we verify the individual rationality by comparing the payment of each winning SBS and its corresponding true valuation of cost in computation offloading. Then, we verify the truthfulness by randomly selecting a winning SBS to observe how its utility (according to Eq. (43)) evolves with the variant of bidding price.

![[Pasted image 20230802091040.png]]
Fig. 7. Payment & True Valuation of Winning SBSs.

Fig. 7 shows the individual rationality of the proposed payment determination in RACORAM. It can be found that the payment of each winning SBS is higher than its true valuation of the cost in computation offloading, which means that each winning SBS can get a positive utility when its bidding price is truthful. Therefore, we verify that the proposed payment determination can guarantee the individual rationality of the winning SBSs in RACORAM.

![[Pasted image 20230802091134.png]]
Fig. 8. Utility & Bidding Price of Wining SBSs.

Fig. 8 shows the truthfulness of the proposed payment determination in RACORAM. We randomly select a winning SBS according to RACORAM, and its true valuation of cost in computation offloading is estimated to be 81_._27 or 0.12 per unit of computation resource. Then, it can be found that when the bidding price of the SBS (per unit of computation resource) is lower than its true cost, it will not be selected as the winning bidder to ensure the property of individual rationality. However, when the bidding price of the SBS is much higher than its true cost, it will not be selected as the winning bidder either. This SBS can be selected as the winning bidder only when its bidding price is equal to or close to its true cost (0.12), i.e., within the range of [0_._12_,_0_._15]. And even if SBS’s bidding price increases, the payment provided by the CSC is always equal to 107_._8 $>$ 81_._27, which proves that the SBS cannot get higher payment from untruthful bidding price. Therefore, we verify that the proposed payment determination can guarantee the truthfulness of the winning SBSs in RACORAM.

### 7.6 Computational Efficiency

![[Pasted image 20230802091256.png]]
TABLE 3. Running Time (ms)

This part investigates the computational efficiency of RACORAM, and records the running time of RACORAM and other baseline methods in different network scenarios, as shown in Table 3. For each network scenario, we perform 50 iterations of each method and take the average of the running time to measure the computational efficiency.

From the table, $N$ represents the number of MDs, and $S$ and $M$ represent the number of SBSs and each SBS’s sub-bands respectively. We observe that the running time of RACORAM gradually rises as the network scenario grows from sparse to ultradenser. It is worth noting that the relationship between the growth rate of running time and the network size is not exponential. This is consistent with the claim that RACORAM follows a polynomial computation time with respect to the scale of the network, which is shown in Remark 4. On the one hand, RACORAM can find sub-optimal solutions in a shorter time than EOJC. On the other hand, compared with GOJMRA, ROJC, and WBS, RACORAM further reduces the cost of the CSC with an acceptable increase in the computational overhead. Furthermore, RACORAM can greatly reduce running time through parallel computing.

To summarize, the greedy value $θ$ and Max-Iteration have a significant impact on the performance of RACORAM, and RACORAM is very close to the optimal method EOJC while it significantly outperforms the other baseline methods under different scenarios. In addition, RACORAM is superior to EOJC in terms of the computational efficiency. Furthermore, we prove that the proposed payment determination can guarantee the individual rationality and truthfulness properties.

## 8. CONCLUSION

In this paper, we have proposed a novel Reverse Auction-based Computation Offloading and Resource Allocation Mechanism, named RACORAM for the mobile Cloud-Edge computing. The optimization problem is formulated as a Mixed Integer Nonlinear Programming (MINLP) problem, aiming to minimize the cost of the CSC. We decomposed the original problem into an equivalent master problem and subproblem, and proposed low-complexity algorithms to solve the related optimization problems. Specifically, a Constrained Gradient Descent Allocation Method (CGDAM) is first proposed to determine the computation resource allocation strategy, and then a Greedy Randomized Adaptive Search Procedure based Winning Bid Scheduling Method (GWBSM) is proposed to determine the computation offloading strategy. Meanwhile, a VCG scheme-based payment determination for the winning SBSs is also presented. Simulation results illustrate that RACORAM is very close to the optimal method EOJC with significantly reduced computational complexity, and greatly outperforms the other baseline methods in terms of the CSC’s cost under different scenarios.