## ABSTRACT
With the increasing demand of users for high-speed, low-delay and high-reliability services in connected vehicles network, wireless networks with communication, caching and computing convergence become the trend of network development in the future. To improve the quality of services of vehicles network, we propose a virtualized framework for mobile vehicle services, which using a learning-based resource allocation scheme. The dynamic change processes are modeled as Markov chains without making assumptions about the optimization goal and reducing the complexity of resource allocation computing. A high performance asynchronous advantage actor–critic learning algorithm is proposed to solve the complex dynamic resource allocation problem. Base on software-defined networking and information-centric networking, the method can dynamic orchestration of computing and communication resources to enhance the performance of virtual wireless networks. Simulation results verify that the proposed scheme can converge at a fast speed and improve the network operator’s total rewards.

## 1. Introduction

In recent years, a large number of researchers have promoted the development of wireless mobile networks, most of which focus on improving the ability of wireless network to provide communication services \[\[1\]–\[4\]\]. For early wireless mobile services, such as voice and short message, higher wireless link capacity or system throughput means better service quality and more satisfied users, thus bringing more revenue to mobile service operators. However, with the rapid development of wireless mobile networks, the types of services provided are also expanding rapidly. They have changed from traditional connection-centric services (such as telephone services) to content-centric services (such as live video broadcasting).

The researches of urban Traffic Flows [5], utility-aware data transmission [6], Energy Harvesting [7] in the Internet of things have widely attention. The Cisco Visual Network Index report predicts that video traffic will account for 72% of global network data traffic by 2019 [8]. At present, some popular new mobile applications, such as virtual reality (VR), augmented reality (AR), connected vehicle (CV), Internet of Things (IoT), cognitive Information and other wireless mobile applications [[9]–[13]], often require higher data transmission rate, lower transmission delay and stronger computing power. Due to the limitation of wireless spectrum resources, the growth rate of wireless network capacity always lags behind the growth rate of network services. However, congestion and inefficiency of large-scale content delivery in wireless networks can hardly be solved by simply improving the network’s communication capability [14]. However, data security is very important in network service and trust computing [15], road networks with privacy [16] and privacy-preserving in vehicle network [17] have been widely studied. Furthermore, some technology [[18]–[21]] are proposed to solve above network problems.

Another promising technology, information-centric networking (ICN), which can efficiently reduce the duplicate content transmission in networks [22]. Recent advances in computing also have profound impacts on networks as well [[23]–[25]]. In order to cope with the change from wireless network to ‘‘content-centric’’ services demand, a novel design paradigm beyond the current ‘‘connection-centric’’ network architecture is needed, and mobile edge computing (MEC) [26] is used to allocate computing resources closer to terminal mobile devices. In the current mobile network, both at the base station and at the user mobile device, caching and computing capabilities have been widespread. Computing and caching resources are abundant, sustainable and cost effective, unlike communication energy limited by wireless spectrum resources. These ‘‘green resources’’ have been following Moore’s law for decades. Through information-centric network (ICN) technology and mobile edge computing (MEC) technology, making full use of the caching and computing capabilities of edge network nodes (e.g., base stations or user equipment), it is possible to fundamentally change the architecture of future wireless networks.

By integrating the cache into the edge nodes of the wireless network, the system can support flexible and efficient content retrieval, significantly reduce the transmission of duplicate content in the network, and reduce the transmission delay and the energy consumption of the content acquired by users. Meanwhile, the mobility, flexibility and security of green information-centric networking and edge networking in smart city can be improved [[27],[28]]. In addition, convergent computing will enable wireless networks to have powerful data processing capabilities and to execute computationally intensive applications in the network. By migrating all or part of the computing tasks of mobile devices to edge nodes with computing power, compared with migrating to cloud servers with rich remote computing resources, it can significantly reduce the execution time of tasks, reduce the risk of network crash or service interruption, and improve the stability and robustness of the network.

Although the wireless network system which integrates communication, caching and computing has important application value and is the development trend of the future network, there are still many important challenges to be solved before the system is widely deployed and applied. These include how to meet the needs of time delay, bandwidth constraints, different resource interaction interfaces, mobile mobility management, and some non-technical issues, such as government regulations. Especially, in this fusion system, how to manage and allocate three different types of resources, namely, communication, caching and computing, in order to meet the needs of different users and different services efficiently is a key issue of the fusion system. There are mutual influences and constraints among communication, caching and computing. For instance, cache hits can save communication and computing resources. The quality of communication directly affects the benefits of caching and computing decisions. Computing can reduce the use of communication resources and save caching space. Therefore, considering these three kinds of resources and their corresponding functions, and optimizing the allocation of resources together, the total benefit of the end of the network can be optimized.

At present, many resource allocation problems in wireless networks are mainly solved by Jordan optimization, dynamic programming and game theory. Usually these methods need to make assumptions about the objective function or data distribution. As the wireless networks become more and more complex, these assumptions are often quite different from the actual situation, and their reference value to reality will become less and less. Meanwhile, with the large increase of the number of variables in the objective function, a large number of variables pose a serious challenges to the calculation based on mathematical methods and memory space. Deep Reinforcement Learning (DRL) [[29]– [33]] is an advanced machine learning algorithm. It combines the perception ability of in-depth learning and the decision-making ability of reinforcement learning. It can solve the decision-making problem in complex high-dimensional state spaces by using function approximation without making assumptions about the optimization goal or reducing the complexity of sub-optimization. Therefore, the use of deep reinforcement learning is expected to solve the problems of end-user management and control in complex, changeable and heterogeneous mobile environments.

Wang [34] et al. has studies the vehicular services in IoT. To expand their researches, we propose a scheme of virtual vehicular network with asynchronous advantage actor–critic algorithm. The main contributions of this scheme are as follows:

1.  Base on software-defined networking and information-centric networking, we introduce a method in which can dynamic orchestration of computing and communication resources to enhance the performance of virtual wireless networks.
2.  Resource allocation problem is essentially an optimization problem. In our model, we defined the resource allocation strategy as a Markov decision process and using function approximation without making assumptions about the optimization goal and reducing the complexity of resource allocation computing.
1.  Because of the complexity of the dynamic system, we use the high performance asynchronous advantage actor–critic learning algorithm to solve the resource allocation problem.
2.  According to experiment theoretical analysis, the experiment results show that our proposed scheme can achieve the better performance and the effectiveness compared with the scheme without learning-based algorithms.
The rest of this paper is organized as follows. In Section [2], the overview of the preliminaries and background is introduced. In Section [3], the system model is presented. In Section [4], the resource allocation problem of network is defined as a DRL Markov decision process. Experiment results are described and analyzed in Section [5]. Finally, conclusions and future work are presented in Section [6].

## 2. Related work

### 2.1. Markov decision process

![[Pasted image 20230731185639.png]]
**Table 1** A list of variables.

In the RL environment, agents make decisions based on signals from environments called environmental states. A reinforcement learning assignment that satisfies the Markov property is called a Markov decision process (MDP). In particular, if the action spaces and state spaces are finite, it is called finite Markov decision process. An MDP is denoted as a tuple $𝑀 = (𝑆,𝐴,𝑝,𝑅)$, where $S$ represents a set of states, $A$ is a set of actions, $p$ is a transition probability from state $s$ to $𝑠′$ when executed action $a$. To be more specific, when an agent executes an action $𝑎 ∈ 𝐴$ and receives a reward $𝑟  ∈  𝑅$, the environment transitions from state $𝑠  ∈  𝑆$ to $𝑠 ′∈  𝑆$. $R$ is the reward obtained after action $a$ is executed. If the Markov property holds in the reinforcement learning environment, which means the transition to the next state _𝑠_′ is only determined by the current action $a$ and state $s$. A list of variables used in the following is also shown in [Table] [1].

### 2.1. Reinforcement learning

There are two types of reinforcement learning: value-based reinforcement learning and strategy-based reinforcement learning. In addition, the actor–critic reinforcement learning method is a combination of value-based reinforcement learning method and strategy-based reinforcement learning method. Furthermore, according to whether the environmental elements (i.e. state transition probability and reward function) are known, reinforcement learning can be divided into model-free reinforcement learning and model-based reinforcement learning. Model-free reinforcement learning has recently been successfully applied to deep neural networks [[35]–[37]].

Value-based reinforcement learning. As we know, the Q-learning is a well-known value-based reinforcement learning algorithm, which finding an optimal action-value function _𝑄_(_𝑠, 𝑎_). Furthermore, using deep neural network to approximate the action-value function _𝑄_(_𝑠, 𝑎_; _𝜃_) is called the DNQ [38] and asynchronous Q-learning [39]. The valuebased reinforcement learning algorithms update the parameters by minimizing the mean-squared error loss.

![[Pasted image 20230731185722.png]]
**Fig. 1.** The relationship of value-based and policy-based.

Policy-based reinforcement learning. Literature [[40],[41]] introduced the policy-based reinforcement learning. Compare with value-based reinforcement learning, policy-based algorithm can directly optimize the policy. The core idea of policy-based is that it maps a state to an action, and then optimizes the parameters to maximize long-term returns. The preponderance of policy-based algorithms is that they can have stochastic policies, which may lead to optimal policy for some problems. The variations of the policy-based methods include proximal policy optimization (PPO) [40], trust region policy optimization (TRPO) [41], and so on. The relationship of value-based and policy-based is shown in Fig. 1.

For deep Q-learning, the agent will adopt a neural network (NN) to define the Q function, which is written as _𝑄_(_𝑠, 𝑎_; _𝜃_). The parameter $𝜃$ is considered as weights of the NN. Through updating the parameter $𝜃$, the Q network is trained at each episode to approximate _𝑄_(_𝑠, 𝑎_).Although NNs allow great flexibility, they pay the cost for the stability of Q-learning. Recently, the deep Q network is proposed to replace Q function approximation by deep neural network, and it has been proved that it has more robust ability and higher performance. In order to transform the Q-learning into a deep Q-learning, some conditions should be satisfied:

1.  Using multiple layers convolution networks, because they can extract high-level features from the original input data by adopting hierarchical convolution filter to utilize local spatial relevance. This can make the agent learn from the past experience.
2.  Using experience replay. In deep Q-network, system store the data _𝑒_ (_𝑡_) = {_𝑠_ (_𝑡_) _,_ _𝑎_ (_𝑡_) _,_ _𝑟_ (_𝑡_) _,_ _𝑠_(_𝑡_ + 1)} into a experience pool _𝐷_ = {_𝑒_ (1) _,_ … _,_ _𝑒_(_𝑡_)}. When training start, agent randomly samples from $D$ to update the parameters of networks, instead of using the consecutive samples.
3.  Establish a target Q network in the training process, which is used to calculate the loss function. If only one network is used to estimate target Q value and Q value, which will be falling into feedback loops. Therefore, the weights of the target network are fixed and updated regularly to ensure stable training.
## 3. System model

In this section, we present the reinforcement learning within the MDP framework and then discuss the optimal solutions. In this pa per, the asynchronous advantage actor–critic (A3C) algorithm is the product of combining policy and value Function. The advantages and disadvantages of policy-based approach are summarized as follows:

Advantages:

1.  More effective in high dimension and continuous action spaces;
2.  Better convergence properties;
3.  Can learn stochastic policies. Disadvantages:
1.  Evaluation policies are usually not very efficient and high variance;
2.  Typically converge to a local rather than global optimal.
In the fundamental settings of reinforcement learning, there are agent, environment, action, state, reward and other basic elements. The agent interacts with the environment and generates trajectory, which changes the state _𝑠_ → _𝑠_′ by executing action. And agent will receive a reward from environment. By continuing these interactions, agents accumulate more and more experiences, and then update the policy.

For convenience, some defines is given as following:

1.  Stochastic policy _𝜋_(s) determine agent’s action, which means that its output is not a single action, but the distribution of probability over actions.
(2)|   _𝜋_(_𝑠_ _𝑎_) represents the probability of selecting action $𝑎$ with the state $𝑠$.
We know that the objective of the agent is to maximize the reward. In probability distribution P, the expected return of value $𝑋$ can be written as:
$$E_{P}\left(X\right)=\sum_{i}P_{i}X_{i}\tag1$$
where, _𝑋__𝑖_ is the all possible values of $𝑋$, _𝑃__𝑖_ is the probability of each value _𝑋__𝑖_. If exist a pool of values $𝑋$, the probability of which was given by $𝑃$ , and we randomly selected a number of these, we would expect the mean of them to be _𝐸𝑃_ (_𝑋_). Let us define value function _𝑉_ (_𝑠_) of policy _𝜋_:
$$V\left(s\right)=E_{\pi(s)}[R+\gamma V(s^{\prime})]\tag2$$
Meanwhile, the action value function _𝑄_(_𝑠, 𝑎_) can be defined as:
$$Q\left(s,a\right)=R+\gamma V(s^{\prime})\tag3$$
Furthermore, the Bellman equation recursive relationship of _𝑄_(_𝑠, 𝑎_) can be written as:
$$Q\left(s_{t},a_{t}\right)=E[r\left(s_{t},a_{t}\right)+\gamma E[Q\left(s_{t+1},a_{t+1}\right)]]\tag4$$

The policy gradient algorithm is probably the most popular reinforcement learning algorithm for continuous action. These algorithms update the parameters $𝜃$ of the policy in the direction of the performance gradient ∇_𝜃 𝐺_(_𝜃_). The ∇_𝜃 𝐺_ (_𝜃_) can be written as:
$$\nabla_{\theta}G\left(\theta\right)=E_{s\sim\rho^{\pi},a\sim\pi}[\nabla_{\theta}l o g\pi_{\theta}(a|s)Q^{\pi}(s,a)]\tag5$$
where the _𝜌__𝜋_ is the state distribution, which depends on the policy parameters. ([5]) is also called the policy gradient theorem [20]. The theorem simplifies the computation of gradient to a simple expected value, which has important practical value. Furthermore, ([5]) has been used to derive a variety of policy gradient algorithms [21].

The actor–critic is another architecture reinforcement learning algorithm based on the policy gradient, which consists of actor and critic two components. The actor updates the parameters $𝜃$ of the stochastic policy $𝜋_𝜃$ (_𝑠_) by ([5]). Instead of the unknown true actionvalue function _𝑄__𝜋_ (_𝑠, 𝑎_), an action-value function _𝑄__𝑤_(_𝑠, 𝑎_) is used with parameter vector w. Using an appropriate policy evaluation, the critic estimates _𝑄__𝑤_(_𝑠, 𝑎_) ≈ _𝑄__𝜋_ (_𝑠, 𝑎_). That is, the actor executes the action and critic evaluates it, saying that the choice of the action is good or bad. The gradient of actor parameter can be written as:
$$L o s s={\frac{1}{N}}\sum_{t}(r+m a x Q\left(s_{t+1},a_{t+1})-Q\left(s_{t},a_{t}\right)\right)^{2}\tag6$$

However, if only a single agent is used to sample the samples, the samples we get are highly correlated, which will make machine learning model out of order.

![[Pasted image 20230731190245.png]]
**Fig. 2.** The execution process of actor–critic.

The execution processes of actor–critic as shown in Fig. 2. The structure of actor net is the same as that defined by policy gradient. It is a double-layer full connected neural network. In order to achieve higher reward, actor needs a strategy: input state and output action. Critic net needs to feed back a TD value to the actor to determine whether the action selected by the actor is good or bad. If the TD value is large, it means that the surprise degree of the action selected by the current actor is high, and more appearances are needed to reduce the TD value.

Because the condition of machine learning is that sample is independent distributed and cannot be highly related. Therefore, a baseline _𝑏_(_𝑠_) ≈ _𝑉_ (_𝑠_) is added to the value function to get a much lower variance estimate of the policy gradient. When using the approximation function as baseline, the system need two networks to estimate _𝑉_ (_𝑠_) and $𝑄_𝜋$ (_𝑠, 𝑎_). The $𝑟_𝑡$ − $𝑏_𝑡$ used to scale the policy gradient, which can be considered as an estimate of the advantage of $𝑎_𝑡$ in $𝑠_𝑡$. That is:
$${A}\left(s_{t},a_{t}\right)={Q}\left(s_{t},a_{t}\right)-V(s_{t})\tag7$$

As we know, the iteration speed of policy gradient is very slow. In order to make full use of computing resources, the asynchronous Advantage Actor–Critic (A3C) method is used to maintain a policy $𝜋$ and a value function _𝑉_ (_𝑠_). According to ([7]), then:
$$A\left(s_{t},a_{t}\right)=Q\left(s_{t},a_{t}\right)-V\left(s_{t}\right)=r+\gamma V\left(s_{t+1}\right)-V(s_{t})\tag8$$
As [42], we consider a virtualized vehicular network. The vehicular network mainly include MEC servers, vehicles and routers, road side units (RSUs), base stations (BSs), which are managed by the infrastructure providers (InPs). Let $𝐵$ be the sets of BSs and $R$ be the sets of RSUs. _𝑈_ = _𝐵_ ∪ _𝑅_ = {1_,_ … _,_ _𝑢_} is the set of all the BSs and RSUs. _𝑉_ = {1_,_ … _,_ _𝑣_} is the set of vehicles. _𝐶_ = {1_,_ … _,_ _𝑐_} and _𝑀_ = {1_,_ … _,_ _𝑚_} are the sets of caches and MEC servers, respectively.

An example of a use case in this network model is as follows. Suppose the vehicle sends video content requests to its associated virtual base station. In the first step, according to the vehicle and content information, the base station will check whether its associated cache has the requested content. If the information is yes, the cache will further check whether the version of the cached video content can be played and matched with the vehicle. The model of A3C is shown in Fig. 3.

![[Pasted image 20230731190332.png]]
**Fig. 3.** The model of asynchronous advantage actor–critic.

As shown in Fig. 3, the system model of A3C has a main network and multiple workers. Each worker net is also a net of A2C. A3C mainly has two operations: pull and push. Pull action gives the parameters of the main network directly to the network in the workers. Push action uses the gradients in each worker to update the parameters of the main network. The global network has the global parameters and every worker has local net parameters. Local net can push the updated parameters to global net at a fixed time, and then get the comprehensive updated parameters from global net at a fixed time.

If the information is still yes, the base station sends the content of the request from the cache to the vehicle. Otherwise, the base station will select the current transmission content create a new task according to the size of content. Furthermore, the base station sends the new task to the MEC to finish the task. When the task is completed, the base station transfers transcoded content to the end user. Supposing that cache cannot search the match contents, the base station must search the content from internet, which will consume some backhaul resources. The resource request process is shown in Fig. 4

Virtual vehicular networks must be established logically. Each network contains of MEC servers, BSs, caches, RSUs. They can provide the high-speed computing capabilities for vehicles. Supposing that every wireless network belongs to different the infrastructure providers, and the license spectrum of different the infrastructure providers is orthogonal to eliminate interference.

The service providers (SPs) manage all the networks resource. SPs is denoted as _𝑆_ = {1_,_ … _,_ _𝑠_}. For a service provider, _𝑉__𝑠_ is the set of vehicle, and one vehicle is allocated from $𝑉_𝑠$ is denoted as $𝑣_𝑠$. All $𝑉_𝑠$ are controlled by service providers. However, given a time period, one $𝑣_𝑠$ only subscribes to one service provider. That is, _𝑉_ = ∪_𝑠__𝑉𝑠_ and _𝑠__𝑉𝑠_∩_𝑉𝑠_′ =∅_,_when _𝑠_≠_𝑠_′.Attime_t_,_𝑎𝑣,𝑢_(_𝑡_)istheassociation between vehicle $𝑣$ and BS $u$. If _𝑎_ (_𝑡_) = 1, that means $𝑣$ connects to $k$ to request, o_𝑠_therwise, _𝑎__𝑣__𝑠_ _,𝑢__𝑡_. However, for every $𝑠$ can only access to one RSUs or BS at time $t$, thus:
$$\sum_{u\in U}a_{v_s,u}\left(t\right)=1,\ i f s\in S,v_{s}\in V_{s}\tag9$$

As we know, the network model consists of computation, communication and cache. Now, we describe the computation model. Let _𝑊_ = {_𝑜_ _, 𝑞_ } is the computation assignment, which is executed on_𝑣__𝑠__𝑣_ asso_𝑣_c_𝑠_iat_𝑣_e_𝑠_d with MEC server $𝑚$ . $𝑜$ represents the size of the trans_𝑠_fer content and $𝑞$ is the requir_𝑘_ed n_𝑣__𝑠_umber of CPU cycles. After the computation, base _𝑣_s_𝑠_tation $k$ sent the transfer content back to $𝑣$ .

We define the computation capability of base station $k$ as _𝜑__𝑣__𝑠_ , which can be weighted by CPU computing power. In our network model, all MEC servers are assigned to base stations dynamically. Furthermore, multiple vehicles can share the same MEC server and access to the same base station at time $t$. Because of above two points, however, the network system cannot accurately predict the computation capability for $𝑣_𝑠$ at time $t + 1$. Therefore, $𝜑_𝑘$ is defined as a random variable, which denoted by _𝜀_ = {_𝜀_0_,_ … _𝑣__𝑠, 𝜀__𝑁_−1 }, where $N$ is the number of available computation capability states. Furthermore, the computation capability realization of 휑푘 푣푠 denoted as 훹푘 푣푠 (푡) at time t. The state transition probability matrix of base station is defined as:
$$\Theta_{v_{s}}^{k}(t)=[l_{xy}(t)]_{N\times N}\tag{10}$$


where _𝑙__𝑥𝑦_ (_𝑡_) = Pr(_𝛹_ _𝑘_(_𝑡_ + 1) = _𝑦_|_𝛹_ _𝑘_(_𝑡_) = _𝑥_), and $𝑥_,$ _𝑦_ ∈ _𝜀_.
The computation_𝑣__𝑠_ time of _𝑣_a_𝑠_t base station $𝑘$ is defined as:
$$T_{v_s,k}={\frac{q_{v_{s}}}{\psi_{v_s}^{k}(t)}}\tag{11}$$

Furthermore, the bit computed per second (also called the computation rate) is defined as:
$$
r_{comp}\left(t\right)=a_{v_{s},\mu}\frac{o_{v_{s}}}{T_{v_{s},k}}=a_{v_{s},u}\frac{\varphi_{v_{s}}^{k}o_{v_{s}}}{q_{v_{s}}}\tag{12}
$$

However, the computing resources of server is limited, thus the constraint must be observed:
$$
\sum_{s\in S}\sum_{v_{s}\in V_{s}}a_{v_{s},u}\left(t\right),o_{v_{s}}\leq O_{u},u\in U \tag{13}
$$

where $𝑂_𝑢$ is the maximum content sizes, which simultaneously run on the MEC server.

Consider that the communication channels are realistic time-varying channels, thus we can define them as the finite-state Markov channels. As [[43],[44]], the finite-state Markov channels are widely used to characterize the correlation structure of the fading process. Meanwhile, the finite-state Markov channels enable significant performance improvement compared with memoryless channel.

In the finite-state Markov channels, the received signal-to-noise ratio (RSNR) is an appropriate parameter, which enabled to represent the channel quality. Meanwhile, the RSNR associated with $𝑣_𝑠$ and base station $k$ can model as a random variable _𝛾__𝑘_. Furthermore, _𝛾__𝑘_ can be quantized and partitioned into $𝐿$ discrete lev_𝑣_e_𝑠_ ls: _𝐿_ _, 𝐿 ,_ … _,_ _𝐿_ _𝑣__𝑠_, which are satisfied:
$$
\begin{cases}L_0,\quad&if\gamma_0^*\le\gamma_{\upsilon_s}^k\le\gamma_1^*\\L_1,\quad&if\gamma_1^*\le\gamma_{\upsilon_s}^k\le\gamma_2^*\\&\dots\\L_{u-1},\quad&if\gamma_{\upsilon_s}^k\ge\gamma_{u-1}^*\end{cases}
$$

Each level corresponds to a Markov chain state, let D = {D0,D2,…, Du−1} is the u-length state spaces. The instantaneous value of 훾푘 푣푠 can be defined as 휐푘 푣푠 . Furthermore, assume that the network communication has T time slots, which starts when 푣푠 sends a request and ends when the result is obtained. Let 푡 ∈ {0,1,2,…,푇 − 1} be the time instant. Based on the transition probabilities, the RSNR 휐푘 푣푠 varies from one state to another state. Let 휓푔푠ℎ푠 (푡) be the transition probabilities, that is, the probability from state 푔푠 transfer to another state ℎ푠 at time t. The state transition probability matrix is defined as:
$$
\Psi_{v_{s}}^{k}(t)=[\psi_{g_{s}h_{s}}(t)]_{L\times L}\tag{14}
$$
where $\psi_{g_{s}h_{s}}\left (t\right)=Pr\left (Y_{v_{s}}^{k}\left (t+1\right)=h_{s}|Y_{v_{s}}^{k}\left (t\right)=g_{s}\right)$, and $g_{s}, h_{s}\in D.$

Furthermore, supposing the spectrum bandwidth is E Hz, and the bandwidth allocated to the base station k is 퐸푘 Hz. The backhaul capacity is Y bps, and the capacity allocated to the base station k is 푌푘 bps. 퐵푘 푣푠 is denoted as the spectrum bandwidth, which is no interference to different vehicles. Let 푒푣푠,푘(푡) be the achievable spectrum efficiency. The communication rate can be written as:
$$
r_{comm}(t)=a_{v_{s},u}(t)B_{v_{s}}^{k}(t)e_{v_{s},k}(t)
$$
However, the sum rate of $𝑣_𝑠$ cannot exceed its backhaul capacity, thus:
$$
\sum_{s\in S}\sum_{v_{s}\in V_{s}}r_{comm}\left(t\right)\leq Y_{k}\tag{16}
$$


Similarly, the data rate of $𝑣$ cannot exceed the total backhaul capacity, thus:
$$
\sum_{k\in U}\sum_{s\in S}\sum_{v_s\in V_s}r_{comm}\left(t\right)\leq Y \tag{17}
$$

## 4. The asynchronous advantage actor–critic algorithm

In this section, according to the system network model, we model the resource allocation problem as a DRL Markov decision process. In the system, the network has $B$ base stations, $E$ MEC servers. They are managed by a mobile virtual network operator.

Based on realistic situation, the computation abilities of MEC servers and downlink channel conditions of BSs are all dynamically change, and the mobile virtual network operator has a large number of system states, which has to make a decision on resource allocation according to the system’s current state. However, it is difficult to solve this complex task by traditional methods. The asynchronous advantage actor–critic is a new technique that is capable of receiving complex high-dimensional data as input, and generates the optimal action for each input data. By taking the advantages of the asynchronous advantage actor–critic, the mobile virtual network operator can manage the network system resource effectively. The model framework of integrated communication and computation with virtualized and software-defined networks is show in Fig. 5.

![[Pasted image 20230731191757.png]]
**Fig. 5.** The model framework of integrated communication and computation with virtualized and software-defined networks.

As we know, the network virtualization can be become an effective strategy to manage infrastructure and spectrum resources. According to different service functions, QoS and wireless network requirements, the physical resource layer network can be virtualized into multiple virtual networks through hypervisor. Furthermore, because virtualization can share the network resources, the operation cost can be significantly reduced. Therefore, It is beneficial to manage computation and communication resources in virtual networks based on flexibility and principles of software-defined networking.

In Fig. 5 model, a large amount of security data and information will be exchanged between RSU and vehicle transceivers in various vehicle applications. Due to low quality network links and high mobility, it is a challenge to use traditional host-centric IP-based methods to transmit large amounts of data in vehicle networks. Recent advances in information-centric networking can be used to solve this issue. Particularly, the cache transmission content at network edge (such as, road side units and base station) is becoming one of the key technologies in next generation virtual networks.

The mobile virtual network operator collects the status from each BS and MEC server. Meanwhile, it combines the whole information into a system state. Furthermore, the mobile virtual network operator sends the state to the agent, and receives a feedback of the optimal policy, that is arranges a certain vehicle from the resource pools. When selecting the action, the mobile virtual network operator sends information which virtualized network resource is free and it can be used.

In the A3C algorithm, the experience of agents will be stored in the replay memory. The net parameters $𝜃$ are updated at every time instant $t$. The training algorithm of A3C is shown in Algorithm 1.
![[Pasted image 20230731191933.png]]

To gain the optimal policy of the virtual network system, we must identify the reward, state and action function in our A3C model.

### 4.1. System state

Let _𝑘_ ∈ {1_,_ 2_,_ … _, 𝐾_} be the state of an available BS and _𝑚_ ∈ {1_,_ 2_,_ … _,_ _𝑀_} be the available MEC server, which is determined by _𝛶_ _𝑘_ (_𝑡_) of the random variable _𝛾__𝑘_, _𝛹_ _𝑘_(_𝑡_) of the random variable _𝜑__𝑘_. Therefore,the state vector can be d_𝑣_e_𝑠_ scr_𝑣_i_𝑠_bed as follows:
$$
\begin{aligned}x_{v_s}\left(t\right)&=\left[Y_{v_s}^{0}\left(t\right),Y_{v_s}^{1}\left(t\right),\ldots,Y_{v_s}^{K}\left(t\right),\\\Psi_{v_s}^{0}\left(t\right),\Psi_{v_s}^{1}\left(t\right),\ldots,\Psi_{v_s}^{K}(t)\right]\end{aligned}\tag{18}
$$

### 4.2. System action

In virtual vehicle network system, the agent must determine which base station is assigned to the vehicle, and whether the computation assignment should be offloaded to the MEC server.

The current composite action _𝑎__𝑣__𝑠_(_𝑡_) can be defined as:
$$
a_{v_{s}}(t)=\{a_{v_{s}}^{comm}(t),a_{v_{s}}^{comp}(t)\}\tag{19}
$$

where _𝑎__𝑐𝑜𝑚𝑚__,_ _𝑎__𝑐𝑜𝑚𝑚_ are defined as following:

1.  Define row vector
$a_{v_{s}}^{comm}\:=\:[a_{v_{s},1}^{comm}\:(t)\:,a_{v_{s},2}^{comm}(t),\ldots,a_{v_{s},K}^{comm}(t)]$,where $a_{v_{s}}^{comm}(t)$ denotes the communication control of the kth BS for $\boldsymbol{\upsilon}_{\boldsymbol{s}}$ . Let ${a}_{v_{x},k}^{comn} ∈ {0,1}$ , where $a_{v_{s},k}^{comm}(t)\:=\:0$ represents the BS k is not connected at time $t$, on the contrary, $a_{v_{s},k}^{comm}(t)\:=\:1$ represents the BS is connected. Note that,  $\sum_{k\in K} a_{v_{s},k}^{comm}(t)=1$.

2.  Define row vector
$a_{v_{s}}^{comp}(t)=[a_{v_{s},1}^{comp}(t),a_{v_{s},2}^{comp}(t),\ldots,a_{v_{s},M}^{comp}(t)$), where $a_{v_{s}}^{comp}(t)$ donates the offloading control of the m-th MEC server for $v_{s}$. Let $a_{v_{s},m}^{comp}(t) \in \{0,1\}$, where $a^{comp}_{v_s,m}=1$ represents the assignment is not offloaded to server in time t ,on the contrary, $a_{v_{s},m}^{comp} =1$ represents the assignment is offloaded to m-th MEC server. Note that, $\sum_{m\in M}a_{v_{s},m}^{comm}(t)=1$.


### 4.3. Reward model

For the network system, we defined the total revenue of the mobile virtual network operator as the system’s rewards. The mobile virtual network operator rents the backhaul bandwidth and wireless spectrum from the infrastructure providers, and assigns the resources to virtual service providers. The mobile virtual network operator is required pay wireless spectrum cost to infrastructure providers, which is represented as $𝛿_𝑘$ per Hz for base station $k$. In addition, the mobile virtual network operator also required to pay the computation cost to infrastructure providers when a resource allocation task is performed. For _m_th MEC server, the energy consumption cost can be denoted as $𝜂_𝑚$ per Joule.

Furthermore, the mobile virtual network operator charges $𝑣_𝑠$ for accessing to the virtual network systems can be denoted as _𝜏𝑣__𝑠_ . If the vehicles pay the fee, they can offload the task by accessing to the virtual network. In addition, the cost for $𝑣_𝑠$ can be defined as _𝜙𝑣__𝑠_ . The backhaul cost is denoted as _𝜅𝑣__𝑠_ .

The reward is the mobile virtual network operator’s revenue, which can model as the function of RSNR of the computation capability and the access wireless link state. Hence, the reward function is written as:
$$
\begin{aligned}
R_{v_{s}}\left(t\right)& =\sum_{m=1}^{M}R_{\upsilon_{s},m}^{comp}\left(t\right)+\sum_{k=1}^{K}R_{\upsilon_{s},k}^{comm}\left(t\right)  \\
&=\sum_{m=1}^{M}a_{\upsilon_{s},m}^{comp}\left(t\right)\left(\phi_{\upsilon_{s}}r_{comp}\left(t\right)-\eta_{m}q_{\upsilon_{s}}e_{m}\right)+ \\
&\sum_{k=1}^{K}a_{\upsilon_{s},k}^{comm}\left(t\right)\left(\tau_{\upsilon_{s}}r_{comm}\left(t\right)\left(1-wa_{\upsilon_{s},k}^{comm}\left(t\right)\right)-\delta_{k}B_{v_{s},k}\right) \\
&=\sum_{m=1}^{M}a_{\upsilon_{s},m}^{comp}\left(t\right)\left(\phi_{\upsilon_{s}}\frac{\Psi_{\upsilon_{s}}^{k}o_{\upsilon_{s}}}{q_{\upsilon_{s}}}-\eta_{m}q_{\upsilon_{s}}e_{m}\right)+ \\
&\sum_{k=1}^{K}a_{\upsilon_{s},k}^{comm}\left(t\right)\left(\tau_{\upsilon_{s}}B_{\upsilon_{s}}^{k}(t)e_{\nu_{s},k}(t)\left(\left(1-wa_{\upsilon_{s},k}^{comm}\left(t\right)\right)-\delta_{k}B_{\upsilon_{s},k}\right)\right)
\end{aligned}\tag{20}
$$

where ∑ _𝑅_(_𝑡_) is the computation revenue, 𝛹_ _𝑘_ _𝑜__𝑣_ represents he revenue of the mobile virtual network operator for execute offloading on MEC servers. _𝜂𝑚𝑞𝑣__𝑠_ $𝑒_𝑚$ represents the energy consumption cost. is the communication revenue. represents the revenue of the mobile virtual network operator allowed vehicles access virtual base stations and charge for providing services, however, if the transmitted content performs transcoding operation, the revenue decreases. _𝑅__𝑣__𝑠_(_𝑡_) is the immediate reward of the system at time t, which represents the revenue of the mobile virtual network operator when the agent of system select action _𝑎__𝑣__𝑠_(_𝑡_) in state _𝑥__𝑣__𝑠_(_𝑡_). The objective of using A3C algorithm is to obtain an optimal policy to maximize the total reward of mobile virtual network operator. Thus the cumulative reward can be defined as:
$$
R_{v_{s}}^{T}=maxE\left[\sum_{t=0}^{t=T-1}R_{v_{s}}\left(t\right)\right]\tag{21}
$$

![[Pasted image 20230731192836.png]]
**Table 2** Setting of simulation parameters.

## 5. Experiment and analysis

Reinforcement learning tasks are usually described by Markov decision process. That is, the goal of reinforcement learning is to obtain the optimal decision for a given state $s$.

Constructing a practical problem as a reinforcement learning task often needs to be divided into different number of Markov states according to specific needs. For instance, in LTE system, the base station attempts to provide the user with the highest correct decodable communication rate. Hence, user needs to feedback a 4 bit information to base station, i.e., channel quality indicator (CQI), which represents a number between 0 and 15, indicating a downlink rate value suitable for user. The Markov model of LTE system channel can be expressed by 16 states.

In this paper, the number of states in the Markov model of communication, computation depends on the actual requirements. All vehicles and base stations are randomly distributed. In this experiment, there are 4 service providers, one mobile virtual network operator, 4 base stations, 4 MEC servers. For convenience, each base station bandwidth will be normalized. The network communication channels follow the Markov decision process. The partial parameters are summarized in [Table] [2].

For reinforcement learning, we use a graphics processing unit (GPU), which is Nvidia GTX 1060. The CPU is i7-9750H. The programming environment is tensorflow-gpu-1.11.1, python-3.6 on Linux system.

In this simulation, the channel states consist of two kinds: good (the spectrum efficiency _𝑒__𝑣_ _,𝑘_ (_𝑡_) = 3) or bad (the spectrum efficiency 0_𝑣_._𝑠_8_,_𝑘_, otherwise is 0.2. Meanwhile, the MEC servers computing state also follow the Markov decision process. Let the computing power state of MEC servers is divided into four states. The state transition probability matrix is written as:
$$
\Theta=\begin{bmatrix}0.6&0.2&0.15&0.05\\0.05&0.6&0.2&0.15\\0.15&0.05&0.6&0.2\\0.2&0.15&0.05&0.6\end{bmatrix}
$$

### 5.1 Parametric analysis

The influence of different parameters of the asynchronous advantage actor–critic (A3C) learning algorithm are shown in Fig. 5. The influence of the learning rate of A3C can be inferred from Fig. 6(a), (b), (c).

![[Pasted image 20230731193230.png]]
**Fig. 5.** The model framework of integrated communication and computation with virtualized and software-defined networks.

![[Pasted image 20230731193527.png]]
**Fig. 6.** The influence of different parameters of the asynchronous advantage actor–critic (A3C) learning algorithm.

From Fig. 6(a), (b) and (c), we can see that the actor-lr and critic-lr are on the whole the same. When the learning rate is 0.95, we can see that although the result has a slight fluctuations, it has a good convergence effect. When the learning rateis0.90, the reward curve is always in a state of fluctuation and difficult to converge. However, when the learning rate is 0.99, the reward curve is always in a state of fluctuation and cannot converge eventually.

Therefore, we can conclude that the learning rate in A3C reinforcement learning algorithm cannot be too large or too small, otherwise the system cannot learn the optimal policy.

In this paper, due to the algorithm consists of actor network and critic network. Therefore, we consider the influence of the parameters of actor-lr and critic-lr. From Fig. 6(a) and (d), we can see that the learning rate is the same, and the critic-lr are the 0.01 and 0.1, respectively. However, when the critic-lr too large, the result is easy to fall into local optimal solution and cannot obtain the optimal policy.

### 5.2. Performance analysis

In this paper, to describe the experiment, 2 schemes are proposed:

1.  The system state contains MEC computing and communication: The network states of MEC servers are considered to be static and will not be changed dynamically.
2.  The virtual network allocation strategy without MEC servers: the scheme does not consider MEC offloading, and the vehicles can only execute computational tasks locally.
![[Pasted image 20230731193731.png]]
**Fig. 7.** Convergence performance of different schemes.

The convergence performance of above two schemes is show in Fig. 7. According to Fig. 7, we can see that the reward of the virtual network system is very low at the beginning. However, with the increase of the iterations, the average reward will reach a stable value.

In the scheme, which the system state contains MEC computing and communication, the stable value is 5000. And if the scheme without the MEC offloading, the stable value is 4000. Fig. 6 shows the convergence performance of the integrated communication and computation in our work. Furthermore, we also can see that the reward of the scheme without MEC offloading is less.

![[Pasted image 20230731193812.png]]
**Fig. 8.** The reward effects of _𝑜𝑣_

The effect of the content size is shown in Fig. 8. From Fig. 8, we can see that the reward of the proposed reinforcement learning algorithm without MEC server computation deceases with the increase of _𝑜𝑣__𝑠_ . This is because the larger content sizes increasing the cost of transmission content, resulting in lower gain for caching utilities, thereby reducing the reward. In contrast, the reward of the scheme with MEC server increases when the content size _𝑜𝑣__𝑠_ is increasing, because the larger content size will increase the computing charge on MEC server, resulting in higher returns of computing revenue, thereby increases the system reward.

![[Pasted image 20230731193839.png]]
**Fig. 9.** The reward effect of $𝜏_𝑣$ .

The reward effect of _𝜏𝑣__𝑠_ is shown in Fig. 9. From Fig. 9, we can observed that the disparity without MEC server. When the vehicles access to the virtualized vehicle wireless networks, the MEC server will reduce the cost. When _𝜏𝑣__𝑠_ increasing, virtualization is accounts for an increasing proportion of total revenue. Therefore, MEC offloading is less executed. On the contrary, if without MEC server, the reward cannot increasing with the increase of _𝜏𝑣__𝑠_ .

![[Pasted image 20230731193854.png]]
**Fig. 10.** The reward effect of _𝜙𝑣_

The reward effect of the unit price for performing MEC _𝜙𝑣__𝑠_ is shown in Fig. 10. According to Fig. 10, we can know that the reward oflearning-base scheme and static scheme keeps improving when the _𝜙__𝑣__𝑠_ is increasing, and the gap between them is gradually increasing. This is because the MEC service price $𝜙_𝑣$ increases, and the computation rev-enue increases accordingly. Becau_𝑠_se learning-base scheme has network virtualization, it can provide users with better communication quality network, thus achieving higher communication benefits.

![[Pasted image 20230731193935.png]]
**Fig. 11.** The reward effect of using the cache.

The reward effect of using the cache is shown in Fig. 11. From Fig. 11, we can see that the reward of all schemes is decreasing when without using the cache server. However, the reward curve of learning-base scheme, without MEC scheme and static scheme is parallel increasing, which means the increasing of cache has not effect on without MEC and static scheme.

## 6. Conclusion and future work

We studied the learning-based network traffic control and distribution scheme of vehicular networks. Based on the asynchronous advantage actor–critic (A3C) learning algorithm, we proposed an integrated scheme, which enable allocate communication and computing resources to improve the performance of next generation wireless networks. In this scheme, we modeled the resource allocation strategy as a reinforcement learning Markov decision processes and using function approximation without making assumptions about the optimization goal or reducing the complexity of resource allocation computing. The experiment results under different parameters are given to verify the effectiveness of our proposed algorithm. Future work is considering another novel and effective reinforcement learning algorithm to solve the next generation network communication problem.