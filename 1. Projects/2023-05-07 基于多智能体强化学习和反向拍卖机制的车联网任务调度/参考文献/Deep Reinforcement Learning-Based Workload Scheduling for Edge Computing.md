
## Abstract

Edge computing is a new paradigm for providing cloud computing capacities at the edge of network near mobile users. It offers an effective solution to help mobile devices with computation-intensive and delay-sensitive tasks. However, the edge of network presents a dynamic environment with large number of devices, high mobility of users, heterogeneous applications and intermittent traffic. In such environment, edge computing often suffers from unbalance resource allocation, which leads to task failure and affects system performance. To tackle this problem, we proposed a deep reinforcement learning(DRL)-based workload scheduling approach with the goal of balancing the workload, reducing the service time and the failed task rate. Meanwhile, We adopt Deep-Q-Network(DQN) algorithms to solve the complexity and high dimension of workload scheduling problem. Simulation results show that our proposed approach achieves the best performance in aspects of service time, virtual machine(VM) utilization, and failed tasks rate compared with other approaches. Our DRL-based approach can provide an efficient solution to the workload scheduling problem in edge computing. 

**Keywords:** Edge computing, Computation offloading, Workload scheduling, Deep reinforcement learning

## 1. Introduction

Nowadays, with the increasing popularity of mobile devices, more novel sophisticated applications are emerging, such as face recognition, interactive gaming and augmented reality [1]. However, duo to resource constraints (processing power, battery lifetime, storage capacity), mobile devices cannot meet the needs of running these novel sophisticated applications on local [2]. Considering the powerful computing and storage capabilities of the cloud server, one suitable solution is to offload these complicated mobile applications to cloud for processing, so called mobile cloud computing (MCC) [3]. MCC can efficiently address the problems of limited processing capabilities and limited battery of the mobile devices [4]. However, the cloud server is generally far away from mobile devices, MCC inevitably suffers from high latency and bandwidth limitation [5]. Moreover, according to the prediction of Cisco, the growth rate of mobile data required to be processed will far exceed the capacity of central clouds in 2021 [6]. To resolve these issues, Edge computing has emerged as a promising technology that provides cloud computing capabilities at the edge of the network in close proximity to the mobile subscribers [7]. Compared with MCC, edge computing has the advantage of lower latency, lower core network load and more security.

Although Edge computing is a new technology with many advantages, it still has many problems to be solved. The edge of network presents a very dynamic environment with large number of devices, high mobility of users, heterogeneous applications and intermittent traffic [8]. In such environment, edge computing always encounters the problem of how to efficiently schedule incoming tasks from mobile devices to edge servers and cloud servers. To elaborate, the mobile devices consist of terminal devices and Internet of Things (IoT), which are widely distributed, numerous heterogeneous and high mobility. When these mobile devices are running, they can generate a variety of different tasks. Duo to the resource constraint of mobile devices, most of tasks need to be offloaded to the outside servers for processing. However, these offloaded tasks are unevenly distributed and random, which lead to imbalanced workloads among edge servers and impair the performance of system. For example, when massive amount of tasks are offloaded to the same edge server simultaneously, it is easy to cause single edge server paralysis and network congestion, while other edge servers may be in idle state. Therefore, how to schedule the incoming stream of offloaded tasks determines the overall efficiency and scalability of the edge computing system. Moreover, both the communications and computation resources also need to be allocated and scheduled efficiently for better system performance.

Our work focuses on the workload scheduling problem which can be defined as deciding on the destination computational unit for each offloaded task within an edge computing system. As we know, workload scheduling is an intrinsically hard, online problem [8]. Where to offload decision should take many parameters into consideration such as task property, network situation and computational resources [9]. These parameters are also highly dynamic especially under unexpected variation of the load. To solve problem, we propose DRL-based workload scheduling approach, which can learn from the previous actions and achieve best scheduling in the absence of a mathematical model of the environment. Meanwhile, we adopt DQN-based algorithms to solve the complexity and high dimension of workload scheduling problem. Finally, we carry out an experimental evaluation based on EdgeCloudSim [10]. To demonstrate the performance of our approach, we evaluated with two opponent algorithms using crucial performance metrics such as service time, failed tasks rate, and VM utilization. According to the results, our proposed method has competitive performance with respect to its opponents for the cases studied. The contributions of this paper are summarized as follows:

- We investigate workload scheduling in edge computing, aiming at balancing the workload, reducing the service time and failed task rate.
- We introduce multi-tier edge computing architecture and analyze its system model, then formulate workload scheduling problem as an NP-hard problem.
- We proposed a DRL-based workload scheduling approach with the goal of balancing the workload, reducing the service time and the failed task rate.
- We adopt DQN-based algorithms to solve the problem of complexity and high dimension in workload scheduling.

The remainder of this paper is organized as follows. Related work section briefly reviews the related work. System model and problem formulation section presents the system model and problem formulation. The DQN-based workload scheduling approach section describes the proposed DRL-based workload scheduling approach. Evaluation results section elaborates on the simulation experiment design and analyzes the results. Conclusion section concludes our study and provides possible directions for future research.

## 2. Related work

In edge computing, Mobile devices can offload most tasks to the edge server for execution, which efficiently address the problems of their limited resources and reduce the core network traffic load. However, improper task offloading not only brings imbalance workload among edge servers, but also increases task latency and energy consumption. Therefore, properly scheduling computation tasks among edge servers are crucial to optimize the quality of services with high resource efficiency. The scheduling research is to choose the proper decision on the time and place where the task should be offloaded. There has been extensive work devoted to workload scheduling problem. Santoro et al. [11] propose a software platform called Foggy for workload orchestration and resource negotiation in fog computing environment. It schedules the execution location of tasks based on computational, storage or network resources. Anas et al. [12] take computational utilization and access probability into consideration, and develop a performance model based on queuing theory to address the workload balancing between service providers within a federated cloud environment. Ma et al. [13] consider cooperation among edge nodes and investigate the workload scheduling with the objective of minimizing the service response time as well as the outsourcing traffic in mobile edge computing. They propose a heuristic workload scheduling algorithm based on water-filling to reduce computation complexity. Fuzzy logic is an effective method to solve workload scheduling problem in edge computing, which has been discussed in recent years. Sonmez et al. [8] employ a fuzzy logic-based approach to solve the workload orchestration problem in the edge computing systems. Their approach takes into consideration the properties of the offloaded task as well as the current state of the computational and networking resources, and uses fuzzy rules to define the workload orchestration actions in terms of networking, computation and task requirements to decide the task execution location within the overall edge computing system.

However, Fuzzy logic-based approach needs to define various fuzzy rules in advance, which will take a lot of time and effort to measure. Therefore, in order to reduce manual intervention, some studies attempt to adopt machine learning method for workload scheduling. Nascimento, A., et al [14] propose Reinforcement Leaning(RL)-based scheduling approach for cloud-based scientific workflow execution. RL is a branch of machine learning, which focuses on how to achieve the optimal goals through learning in a dynamic environment. In RL, the agent, as a learner, perceives the current state of environment and select actions to take. When the action is executed, the agent will receive a reward or punishment from environment according to the effect of action. If receiving a reward from the environment, the agent will increase the tendency to take this action in the future to obtain more rewards. On the contrary, if receiving a punishment, the agent will reduce the tendency to take this action. To maximize the cumulative reward, agent needs to balance the exploration and exploitation steps. In exploration step, the agent tries the actions that have not been selected before and explore new state to obtain higher reward. In exploitation step, the agent takes the best action that has already observed so far [15].

Although the RL-based workload scheduling approach can reduce manual intervention and solve the problem effectively in the case of small state and action spaces, It is nearly impossible to obtain the accurate state or action values via normal reinforcement learning when the state or action spaces are very large [16]. To solve this problem, Combining deep learning and reinforcement learning, DRL algorithms, such as DQN [17], DDPG [18] and PPO [19], becomes useful for handling the problems of complexity and high dimension. In this work, We proposed a DRL-based approach for workload scheduling in edge computing, which can learn from the previous actions and achieve best scheduling in the absence of a mathematical model of the environment, Meanwhile, we adopt DQN algorithms to solve the workload scheduling problem of complexity and high dimension, aiming at balancing the workload among edge servers, reducing the service time and failed task rate.

## 3. System model and problem formulation

In this section, we first introduce the Multi-tier edge computing architecture and analyze system model, which includes task model, network model, and computing model. Then, we formulate the workload scheduling problem based on system model. The edge computing architecture as depicted in Fig. [1]
![[Pasted image 20230730165406.png]]
**Fig. 1** Multi-tier edge computing architecture with edge orchestrator

### 3.1 Multi-tier edge computing architecture

As shown in Fig. [1], we construct a multi-tier edge computing system architecture which incorporates computational resources at various levels, as well as different ranges of networks, such as local area network (LAN), metropolitan area network (MAN) and wide area network (WAN). The first tier is edge device layer, which is composed of a large number of mobile devices, IoTs and other edge devices. They communicate with local edge server via wireless local area network (WLAN). The second tier is edge server layer, which consist of edge servers and the edge orchestrator. Edge servers are interconnected through MAN. The third tier is cloud server layer, which is the global cloud server distributed around world and provide cloud service through WAN.

In this architecture, each edge server can provide computing services for users within its WLAN coverage, while cloud server can provide remote computing services for all users. Moreover, nearby edge servers can also provide computing services for neighbor LAN users in domain. When an edge server cannot provide sufficient resources or computation capacity, the computation tasks can be scheduled to the nearby edge servers that are under-utilized or the cloud for processing. In this process, the edge orchestrator acts as the workload coordinator among servers to monitor the environment information and make scheduling decisions for each task to coordinate workload of servers.

To elaborate, we take the university campus application scenario as an example. According to this architecture, the students and other participants are assumed to carry and/or wear the mobile devices, such as smart phone, Google glasses, Smart Bracelet, etc., on which applications run and continuously generate tasks to be processed. Duo to the limited processing capacity of a single device, these devices have to offload some tasks to external servers. To meet this need, a number of edge servers are deployed at different places (such as classroom buildings, dormitories, and library) on campus to provide coverage for request services. In the real scene, the places on campus may have different user densities according to the time of day. For example, students concentrated their classes in the classroom buildings in the morning, and they may gather together in the library for reading in the afternoon, and most of them are likely stay in dormitories at night. The user density can directly affect the amount of requested and workload. Typically, the user’s mobile devices select the nearest local edge server to offload tasks via the WLAN, such as Wi-Fi hotspots or cellular base stations. In our system, we define the places with three type attractiveness levels, which are based on user’s device density. If the attractiveness level of the place is high, such as an auditorium during the conference, lots of students may wear the mobile device and gather there. Duo to the high device density and excessive task offloading, both the network and the computational resources are likely to be congested in LAN. To deal with this problem, the local edge server also needs to offload these tasks which beyond its capacity to the nearby edge servers or cloud server. However, how to schedule these tasks to achieve the desired optimization objectives is not an easy problem.

### 3.2 System model

To investigate workload scheduling problem, we should first model the edge computing system according to the above architecture, including task model, network model and computing model. We set that the system consists of $k$ mobile devices, $m$ edge servers and one remote cloud server. $k$ and $m$ denote the number of mobile devices and edge servers respectively. For each device, there is only one local edge server which can be accessible via WLAN and (m − 1) nearby edge severs which can be accessible via MAN. Each task offloaded from mobile device can be scheduled to execute on local edge server, nearby edge server, or cloud server. In general, the local server is the first choice due to the advantages of short distance and low latency. However, when local edge server cannot provide sufficient resources or computing power, the corresponding tasks should be scheduled to the nearby edge servers or cloud for processing. In this process, the edge orchestrator acts as the workload coordinator among servers to monitor the environment information and make scheduling decisions for each task to coordinate workload of servers.

#### 1 Task Model

Each mobile device can produce different tasks, which may be compute-intensive, I/O intensive or both. To better represent the tasks, we describe a _$task_i$_ in a four-field notation $(∂_i, β_i, c_i, τ_i)$, which _$∂_i$_ denotes the input data size (in bits), _$β_i$_ denotes the output data size (in bits), and _$c_i$_ denotes the total number of CPU cycles that is required to complete the _$task_i$_, and _$τ_i$_ denotes the delay constraint of _$task_i$_ . We assume that all the tasks are indivisible and offloaded as a whole to edge server or cloud for execution, and the tasks are independent of each other.

#### 2 Network Model

As shown in Fig. [1], In our edge computing system, tasks can be scheduled to execute on any server, such as local edge server, nearby edge servers or cloud server. Therefore, tasks may pass through multiple networks during scheduling process, such as WLAN, MAN or WAN. Considering the difference of bandwidth, transmission rate and interference among different networks, these will have a certain impact on the transmission delay and performance of task scheduling. We calculate the communication delay generated by scheduling tasks to local edge server, nearby edge servers and cloud server, respectively: If the local edge server is selected as offloading destination, the mobile device first uploads the computing to the local edge server through a wireless channel, and then edge server returns the result to the mobile device after the task is completed. In this process, the communication delay on WLAN is mainly caused by transmission delay of _$task_i$_, which can be expressed as:
$$\begin{array}{l l}{{t_{c o m}^{i}\approx t_{t d}^{i}=t_{u p}^{i}+t_{d o w n}^{i}}}\\ {{t_{u p}^{i}=\frac{\partial_{i}}{R_{w I a n}};\quad t_{d o w n}^{i}=\frac{\beta_{i}}{R_{w I a n}};\qquad}}\end{array} \tag{1}$$

where, $t^i_{com}$ represent the communication delay of $task_i$ , $t^i_{td}$ represent the transmission delay of $task_i$ , $t_{u p}^{i}$ represent the upload time of $task_i$ ,andti down represent the result download time of taski ,Rwlan represent WLAN transmis sion rate. In our system, we assume that the upload and download transmission rate between mobile devices and local edge server are the same. The WLAN transmission rate is quantified as:
$$R_{w l a n}=\omega_{w l a n}\mathrm{log}_{2}\left(1+\frac{p_{n}h_{n,s}}{N_{0}+\sum_{n=1}^{M}p_{n}h_{n,s}}\right)\tag2$$

Where, ωwlan is the bandwidth of WLAN, pn is the transmission powers of edge device, hn,s is the channel gains between the nth mobile device and the sth edge server, N0 is the noise power. According to the above formulas, we can see that the WLAN transmission rate is closely related to the band width. For example, if too many mobile devices choose the same channel to communicate with the base station and the interference between them will increase, which will affect the transmission rate. If the nearby edge server is selected as offloading destination, the $task_i$ will be scheduled to the nearby edge server via the MAN, the transmission delay is mainly affected by the MAN bandwidth. The transmission delay of the taski on MAN can be expressed as:
$$t_{t d}^{i}=t_{u p}^{i}+t_{d o w n}^{i}=\frac{\partial_{i}+\beta_{i}}{R_{m a n}}\tag3$$

Where, Rman represent the MAN transmission rate. If the remote cloud server is selected as offloading des tination, the taski will be uploaded to the cloud server via the WAN. In general, there is a long distance between the cloud server and the user, the propagation delay of signal back and forth cannot be ignored. Therefore, the communication delay includes transmission delay ttd and propagation delay tpd. The communication delay of the on WAN can be expressed as:
$$\begin{array}
{rl}
t_{c o m}^{i}&=t_{t d}^{i}+t_{p d}^{i}\\
{{\ }}&{{=t_{u p}^{i}+t_{d o w n}^{i}+t_{p d}^{i}}}\\
{{\ }}&{{=\frac{\partial_{i}+\beta_{i}}{R_{w a n}}+t_{p d}^{i}}}
\end{array}
\tag4$$

The propagation delay is much longer than the trans mission delay (tpd>>ttd). Thus, the communication delay is mainly determined by the propagation delay.

#### 3 Computing Model

For workload scheduling, an important indicator is service time, which represents the time it takes for the task to upload to the server until it is completed. Service time consists of task waiting time and execution time. In this section, we will calculate the service time required on the local edge server, nearby edge server and the cloud, respectively. When a task is uploaded to the local edge server, it first will be generally arranged in the task queue of server to wait for processing. There is a waiting time between the uploading to server and starting execution. The waiting time is related to the VM utilization of the local edge server. If VM utilization is low, which means that the current local edge server is relatively idle, the task can get VM resources quickly and its waiting time will be short. On the contrary, if VM utilization is high, which means that the current local edge server is relatively busy, and the waiting time will be long. Thus, the service time of taski on local edge server can be expressed as:
$$t_{s}^{i}=t_{w a i t}^{i}+t_{e x e}^{i},~t_{e x e}^{i}=\frac{c_{i}}{f_{n b}}\tag6$$

Where, fnb represents nearby edge server computing power. ti wait represents waiting time between the upload ing to nearby edge server and starting execution. When the taski is offloaded to the cloud, we consider that cloud resources are always sufficient, the waiting time of tasks can be ignored. Thus, the service time on cloud sever can be expressed as
$$t_{s}^{i}\approx t_{e x e}^{i}={\frac{c_{i}}{f_{c}}}\tag7$$
Where, fc represents cloud computing power. Accord ing to the above analysis, as we know that the main factors that affect the service time are the amount of computa tion required for the task, VM utilization and computing power of the server. 4) Definition of task Failure Each task has its own delay constraint τ, if the running time exceeds this constraint value, the task is considered to be failure. We define the condition for task failure as follows:
$$F=\left\{t a s k_{i}\left|t_{c o m}^{i}+t_{e x e}^{i}>\tau_{i},i\in N\right\}\right.\tag8$$

### 3.3 Problem formulation and analysis 

Based on the analysis of the task, network and computing model, we calculator the total delay of task scheduling to local edge server, nearby edge server and cloud server respectively. The total delay on local edge server:
$$
\begin{aligned}
t_{local}^{i}& =t_{com}^{i}+t_{s}^{i}  \\
&=t_{up}^{i}+t_{wait}^{i}+t_{exe}^{i}+t_{down}^{i}  \\
&=\frac{\partial_{i}+\beta_{i}}{R_{wlan}}+\frac{c_{i}}{f_{l}}+t_{wait}^{i}
\end{aligned}\tag9
$$
The total delay on nearby edge server:
$$
\begin{aligned}
t_{nb}^{i}& =t_{com}^{i}+t_{s}^{t}  \\
&=t_{up}^{i}+t_{wait}^{i}+t_{exe}^{i}+t_{down}^{i} \\
&=\frac{\partial_{i}+\beta_{i}}{R_{man}}+\frac{c_{i}}{f_{nb}}+t_{wait}^{i}
\end{aligned}\tag{10}
$$
The total delay on cloud server:
$$
\begin{aligned}
t_{cloud}^{i}& =t_{com}^{i}+t_{s}^{t}  \\
&=t_{up}^{i}+t_{exe}^{i}+t_{down}^{i}+t_{pd}^{i} \\
&=\frac{\partial_{i}+\beta_{i}}{R_{wan}}+\frac{c_{i}}{f_{c}}+t_{pd}^{i}
\end{aligned}\tag{11}
$$
According to total delay of local edge server, nearby edge server and cloud server. Our optimization objective of the workload scheduling problem is to reduce the total delay and failure rate of the task. The optimization problem is formulated as follows:
$$
\begin{array}\min\ t=\sum_{i=1}^n\lambda_1t_{local}^i+\lambda_2t_{nb1}^i...\lambda_mt_{nb(m)}^i+\lambda_{m+1}t_{cloud}^i
\\s.t\quad t_{com}^i+t_{exe}^i<\tau_i
\\\\\lambda_l,\ldots\lambda_{m+1}\in\{0,1\}\end{array}\tag{12}
$$
Where, $λ_1,...λ_{m+1}$ represent the scheduling decision variables. Since tasks are indivisible, these scheduling decision variable are integer variables of 0 and 1, but only one decision variable can be 1 in each decision, which represents the selected offloading destination. For example, If $λ_1 = 1$ and the others are 0, which means the local edge server is selected as the offloading destination. If $λ_i = 1\ (i ∈[2,m])$,  , which means the $i$-th nearby edge server is selected. If $λ_{m+1} = 1$ and the others are 0, which means the cloud is selected as offloading destination. Since the decision variables are integer variables, the optimal solution can be found by traversing when the number of tasks is small. However, with the increasing of tasks, the scale of solution space will increase rapidly and become too large. In this case, Equation (12) is no longer a convex optimization problem, but a NP-hard. Moreover, the effect of task scheduling is affected by many parameters, such as network bandwidth, VM utilization, and task attributes. These parameters can be highly dynamic especially under unexpected variation of the load. In the next subsection, we propose a workload scheduling approach based on deep reinforcement learning to solve the problem.

## 4. The DQN-based workload scheduling approach
According to the above analysis, we conclude that work load scheduling in edge computing is an online and NP-hard problem. In this section, we will introduce our proposed DRL-based approach for workload scheduling problem. Specifically, the DQN is one of DRL algorithms in order to tackle the complex and high dimension problem. The DQN modeling is based on the Markov decision processes (MDP), which includes State space S, action space A, and reward function R. In order to apply DQN in the edge computing scenario, we need to specifically design different components of MDP as described below:

### State space
In DRL approach, the first step is to define the state of the system environment. As far as we know, our multitier edge computing system has thousands of time-varying parameters at runtime. Therefore, how to select key parameters to accurately describe the current system environment is crucial to task scheduling. According to the previous analysis, the VM utilization status of the servers and the network conditions from users to servers should be considered. These parameters can be highly dynamic especially under unexpected variation of the workload. Moreover, the characteristics of task also play an important role on the system performance [7]. In our work, the state space S contains all of environment states, and each state includes three parameters: server states, network states and tasks characteristic.
$$
\begin{aligned}
&S=\{s_{1},s_{2}\cdots s_{n}\} \\
&s_{t}=\{server_{t},network_{t},task_{t}\},s_{t}\in S
\end{aligned}\tag{13}
$$
Where, $server_t$ represents the states of all servers at step t: $server_t =\{u_1,u_2, ···,u_n\}$ ,the $u_n$ is the VM utilization of $n$-th server. The $network_t$ is the states of networks at step t: $network_t$ ={ωt WAN,ωt MAN,ωt WLAN} ,th eωt WAN, ωt MAN and ωt WLAN represent the bandwidth of WAN, MAN and WLAN at step t, respectively. $task_t$ is the task that need to be scheduled at step t : $task_t =\{∂_t,β_t,c_t,τ_t\}$, which $∂_t$ denotes the input data size (in bits), $β_t$ denotes the output data size (in bits), and $c_t$ denotes the total number of CPU cycles that is required to complete the task, and $τ_t$ denotes the corresponding delay constraint of $task_t$ .

### Action space
The next step is to define the action space A. Actions determine the transfer rules between states. When a task arrives, it needs to decide which the suitable server should be choice to execute the task. Therefore, the action space includes all servers. In our system, the server consists of local edge server, multiple nearby edge servers and a cloud server. In nearby edge servers, we select the nearby edge server with the least loaded. At the decision step $t$, the action space can be simplified as follows:
$$
A_t=\{a_l,a_n^1\ldots a_n^{m-1},a_c\}\tag{14}
$$
Where, al represent the action that allocate task to the local edge server, a1n ...am−1 n represent the action that allocate task to one of the nearby edge severs, (m-1) represent the number of nearby edge servers, ac represent the action that allocate task to the cloud server.

### Reward function

The reward function is used to describe the immediate reward from one state to another state after an action is taken, based on which to evaluate the action. For a reward function, the first thing to do is to determine what the optimization goal is, and judge the positive reward or negative reward according to its goal.

In this paper, our optimization goal is to reduce the total delay and failure rate of the task. As far as we can see, the main reason of task failure is the unreasonable task allocation, which leads to the task waiting for execution or the transmission time is too long and exceed its deadline. Therefore, we can evaluate the reward according to following formula:
$$R_{t}=\frac{(\tau_{t}-T_{t})}{\frac{1}{n}\sum_{1}^{n}|(\tau_{i}-T_{i})|}\tag{15}$$
where, Tt represents the total delay of current task, τt rep resents the corresponding delay constraint of taskt .First of all, we judge whether to reward or punish by whether the task can be completed within the deadline. If τt > Tt ,which means the current task is completed within its deadline and receive a positive reward. If τt < Tt , which means the current task exceed its deadline and receive a negative reward or punishment. The size of the reward is measured by reference to the average.

### DQN-based workload scheduling algorithm

Based on the components defined above, our goal is to balance the workload and reduce the service time. Our algorithm scheme is shown in Fig. [2]. We adopt two neural networks in DQN, one is called the online network and the other is called target network, they have the same structure but different parameters. Online network uses the latest parameters $θ_i$, which are updated according to the loss Function. The target network uses parameters θi_−, which are copied from the online network at every N step.

DQN uses a deep convolution network to calculate the action-value function of online network, which can be expressed as Q(st,at,θi). The action-value function of target network can be expressed as:
$$y_{i}=r_{t}+\gamma\;\mathrm{max}\,Q\left(s_{t+1},a,\theta_{i}^{-}\right)\tag{16}$$
where,Rt represents the reward received after taking action at, γ ∈ {0,1} is the discount factor, which is used for function converge. the max Q-value action a is selected to execute in the current state st and transfer to the next state st+1. In the training of DQN, the loss function of each experi enceisdefinedasthemeansquareerrorbetweenthevalue function of online network and target network:
$$L_{i}\left(\theta_{i}\right)=\operatorname{E}\left[\left(y_{i}-Q(s_{t},a_{t},\theta_{i})^{2}\right)\right]\tag{17}$$
Take the partial derivative of parameter and the gradient is as follows:
$$\nabla_{\theta_{i}}L\left(\theta_{i}\right)=E\left[\left(y_{i}-Q\left(s,a,\theta_{i}\right)\right)\nabla_{\theta_{i}}Q\left(s,a,\theta_{i}\right)\right]\tag{18}$$

DQN reduces the loss to a limited range through gradient descent, and both the value function and the gradient value are in the normal range, which ensures the stability of the algorithm.

To perform experience replay we store the agent’s experiences _e_t_ = _(_s_t_ , _a_t_ , _r_t_ , _s_t_+1_)_ at each time-step t in replay memory _D_t_ = _(_e_1, _..._ , _e_t_). During training, some empirical data are randomly selected from the replay memory D to update the parameters of the network by stochastic gradient descent. The advantage of this experience playback mechanism can break data correlations and make neural network update more efficient.

Our DQN-based Workload Scheduling algorithm is presented in Algorithm 1, which is divided into six stepsand we describe each step as follow:

- Step 1: Input variables and initialize parameters. The variables include Nmin , Nmax , , α , γ , ε . Nmin is the minnumberofmobiledevices,Nmax is the max number of mobile devices, representsthenumberofdevices increased each time. Thus, the number of iterations can be calculated as M = Nmax−Nmin ;wealsoneedtoset the learning rate α, the discount factor γ and the greedy coefficient ε.
- Step 2: Initialize replay memory D to capacity N, which is used to store experience sample(transition) for experi ence replay, then initialize action-value function Q with randomweightsθ andtargetaction-value function ˆQ with weights θ = θ−.
- Step 3: Adopt the ε-greedy strategy to select action at according to the state s,then execute action at and observe reward rt and next state st+1 to store transition (st, at, rt, st+1) into replay memory D
- Step 4: After each network output, start training by randomly sampling a number of Batch data from replay memory D,update the action value of online network. Set target network output according to equation(16). Step5:Performagradientdescentsteponequation(17) with respect to the network parameters.
- Step 6: Afterseveralstepsofeachiteration, copy param eter θ of the online network to the target network as the new parameter θ−.

## 5. Evaluation results

In this section, we conducted a large number of experiments to evaluate the performance of proposed DQNbased workload scheduling algorithm. To illustrate the effectiveness of our algorithm, we compare our algorithm with other algorithms in term of the average number of failed tasks, average service time, average VM utilization and average network delay. Before presenting the evaluation results, we first introduce the competitor algorithms and evaluation setup.

### Competitor algorithms

In order to benchmark the proposed DQN-based solution, we compare it with another two DRL algorithms, which are the DDPG-based and PPO-based workload scheduling algorithms.
![[Pasted image 20230730171135.png]]
1) The DDPG-based algorithm combines the actorcritic method, deterministic strategy gradient method, and experience playback mechanism to learn the optimal strategy in model-free continuous control. Action network and criticism network are used in DDPG online decision stage, and experience replay and target network are used in offline training stage. The DDPG-based workload scheduling algorithm is presented in Algorithm 2.
![[Pasted image 20230730171153.png]]
2) The PPO-based algorithm is under Actor-Critic structure and alternate between sampling data through interaction with the environment, and optimizing a surrogate objective function using stochastic gradient ascent [19]. The core idea of PPO is to restrict the update range of the old and new policies to improve stability [20]. The PPO-based Workload Scheduling Algorithm is presented in Algorithm 3.
![[Pasted image 20230730171210.png]]
### Evaluation setup

In this work, all experiments are performed on the EdgeCloudSim [10], which provide a simulation environment specific to Edge Computing scenarios. Based on CloudSim [16], EdgeCloudSim adds considerable functionality such as network modeling, load generation as well as workload orchestrator, so that it can accurately simulate the real edge computing environment [21].

In the experiment, we adopt edge computing architecture is a two-tier with orchestrator, which is composed of 1 cloud servers, 14 edge servers and a large number of mobile devices. The cloud server has 4 Virtual Machine (VM) with 100 giga instruction per seconds (GIPS) of CPU power, 32GB of random access memory (RAM) and 1000 GB storage. Each edge server has one host that operates 4 VM with 10 GIPS of processing capacity, 2 GB of RAM and 16GB storage to handle the offloaded tasks. In order to simulate different loads, we initialize the number of mobile devices as $N_min = 200$, and increase 200 each time to reach the maximum $N_max = 2000$.

Each mobile device can run four different applications, namely augmented reality, infotainment, and health monitoring applications. Each application represents different task size, latency tolerance, and task length. The task has random input/output file sizes to upload/download and have random lengths.

![[Pasted image 20230730170950.png]]
**Fig. 2** The DQN-based workload scheduling scheme

According to the attractiveness of user, we divide places into three different levels, which directly affects the dwell time that the user spends in the related places. We set the mean waiting time of type 1, 2 and 3 respectively as 60, 30 and 15 minutes. We also set WAN Propagation Delay as 100ms and Lan Internal Delay as 5ms.We set the related parameters in simulations in Table [1].
![[Pasted image 20230730171043.png]]

### Results and analysis

In order to illustrate the effectiveness of our proposed DRL-based workload scheduling approach. We compared it with PPO-based and DDPG-based scheduling approaches in terms of average service time, and average VM utilization, failed tasks rate. The results are shown in Fig. [3].
![[Pasted image 20230730171502.png]]
**Fig. 3** Comparison of the three aspects: **a** Average Service Time. **b** Average VM Utilization. **c** Failed Tasks

Figure [3](a) shows the average service time of different approaches. We can see that the average service time for each approach increases with the number of mobile devices. At the beginning, the longest of the average service time is PPO-based approach, which is 0.8 seconds, followed by DDPG-based approach is 0.75 seconds, and the shortest is DQN-based approaches, which is 0.7 seconds. As the number of devices increases, the average service time of the three approaches increases. When the number of devices increases to 2000, the average server of DDPG-based approach is the longest, reaching 3 seconds, followed by PPO-based approach reaching 2.5 seconds, and DQN-based approach is 1.9 seconds. Compared with other approaches, our proposed DQN-based approach achieves the shortest average service time among these three approaches and the curve stays relatively flat during the whole experiments, which shows that our proposed DRL-based approach makes the task distribution more balanced.

Figure [3](b) shows the average VM Utilization of different approaches. At the beginning, the lowest of the average VM utilization is PPO-based approach, and the average VM utilization of each approach increases with the number of devices. When the number of devices increases to 1000, the lowest of the average VM utilization is replaced by DQN-based approach, and stayed there until the end, reaching about 24%.

Figure [3](c) shows the failed tasks rate of different approaches. As can be seen from the figure, when the number of mobile devices changes from 200 to 1600, the failed tasks rate of all approaches can be kept below 1% and relatively stable. When the number of mobile devices changes from 1400 to 2000, the failed tasks rate of each approach increases with the number of mobile devices. Among them, the PPO-based approach has the fastest growing, and reaches 6% at 2000 devices, followed by DDPG-based approach, reaching 4%. Compared with other approaches, our proposed DQN-based approach achieves the lowest failed task rate of only 3%.

Although we can see the failed tasks rate of different approaches from Fig. [3](c), we don’t know the reasons of task failure from figure. Next, we will analyze the reasons for task failure. In our simulations, Task failure is due to the following reasons:

1) The lack of VM capacity. If the VM utilization is too high, the server does not have enough VM capacity to meet new coming tasks, which make task waiting time too long to failure.
2) The mobility of users. If the user leaves his location before getting the response of the previously requested tasks, the tasks will fail because the user is out of the previous WLAN coverage and cannot receive the response from servers.
3) The lack of network resource. If a large number of users simultaneously use the same network resources (such as WLAN, MAN or WAN), it will cause insufficient network bandwidth or even network congestion, resulting in packets loss, and eventually lead to task failure.
![[Pasted image 20230730171646.png]]
**Fig. 4** The Reasons for Task Failure

The reasons for tasks failure are shown in Fig. [4]. It can be clearly seen that, In the PPO-based approach, the main reason for task failure is due to lack of VM capacity. When the number of users reaches 1600, the mobility of users becomes the main reason for task failure. In the DDPGbased approach, the main reason for task failure is due to lack of WAN resource. When the number of users reaches 800, Lack of VM capacity becomes the main reason of task failure In our DQN-based approach, the main reason for task failure is due to MAN failure, followed by mobility of users. In all approaches, there is almost no transmission failure in the WLAN, so the reason of the tasks failure due to the WLAN can be negligible.

Given the above observation, our proposed DQN-based workload Scheduling approach has the best performance in aspects of service time, and VM utilization, failed tasks rate among these three approaches. Especially, When the number of users is large (above 1600), our proposed DQN-based approach still can keep the lowest task failure rate, which shows that the task allocation is more reasonable and effective, and ensures the stability of the system

### Convergence analysis
![[Pasted image 20230730171729.png]]
**Fig. 5** The Convergence of the proposed DQN-based algorithm

In this section, we will analyze the convergence of our proposed DQN-based algorithm by observing the change of training curves in the training process. Figure [5] presents the training curve of average reward under the DQNbased algorithm during 400 training episodes. It can be seen that the curve always fluctuate upward and downward at the first of 150 training episodes, because the agent is in the exploration stage and the reward value is unstable. As the number of training episodes increases, the agent is changed from the exploration phase enters the learning phase using experience, the algorithm begins to converge and the reward value tends to stabilize.

## 6. Conclusion

In this paper, we have investigated workload scheduling in edge computing, aiming at balance the workload, reduce the service time and minimize failed task rate. Considering that edge computing system is a very dynamic environment and affected by several factors. We analyze system model, which includes task model, network model, computational model, according to the Multi-tier edge computing architecture, and formulate the workload scheduling problem based on system model as a hard and online problem. To deal with the challenges of workload scheduling problem, we proposed a DRL-based approach, which can learn from the previous actions and achieve best scheduling in the absence of a mathematical model of the environment. Simulation results show that our proposed approach achieves the best performance in aspects of service time, virtual machine utilization, and failed tasks rate compared with other approaches. Our DRLbased approach can provide an efficient solution to the workload scheduling problem in edge computing.

![[Pasted image 20230730171829.png]]
