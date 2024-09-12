---
date created: 2024-09-11 15:18
date updated: 2024-09-11 16:59
---

Respected experts, scholars and guests, good morning/afternoon/evening! It is a great honor for me to share with you our research results on "Task Scheduling in Vehicular Networks: A Multi-Agent Reinforcement Learning Based Reverse Auction **Mechanism**" at this important academic conference. I am Yuming Yuan from the School of Information Science and Engineering, Yunnan University.

---

This presentation includes the following parts: Introduction, Method of MADRL and Reverse-Auction, Performance Evaluation, Conclusions and Prospects.

Now, let's start with the introduction.

---

In the field of vehicular networks, vehicles' limited computing power and battery capacity make it difficult to meet the demands of complex or delay-sensitive tasks.

To address this issue, Mobile Edge Computing is proposed, allowing vehicles to offload tasks to MEC servers for execution. An MEC system in a urban setting is shown as follows: 

•Vehicles assess their channel connection status to determine the task offloading point and send task requests to the edge servers.
•The servers return a quotation to the vehicles based on their status and task characteristics.
•Upon receiving all quotations, the vehicles make task offload-ing decisions according to their budget.

In vehicle task scheduling, there are many challenges, such as dynamics, network instability, and **heterogeneous** resource constraints. A more comprehensive and flexible task scheduling method is needed.

---

Next, I will introduce the research status of task scheduling in vehicular networks.\
In this field, an important challenge is to effectively perform task offloading and resource allocation when information is incomplete.

In recent years, distributed task scheduling methods based on stochastic optimization have emerged, which can dynamically adjust resource allocation strategies according to real-time feedback.\
**However**, Most existing research is mostly limited to the allocation of network channels and server CPU time in the communication direction. The main goal is to minimize system power consumption and running time rather than revenue.

Existing research mainly focuses on the auction of data resources generated during vehicle driving and does not deeply involve the allocation of edge server resources.\

In the existing reinforcement learning models for the task offloading problem in vehicular networks, they often can observe the global state or deploy the same model, which does not meet the requirements of a real multi-agent system. We are committed to developing models that can work effectively in complex systems and achieve long-term load balancing through optimizing task scheduling.

---

The existing methods face challenges. Traditional task scheduling methods are mostly based on centralized optimization models, such as using mathematical programming, heuristic algorithms, and meta-heuristic algorithms for solution. However, in edge environments, system parameters and state information are often difficult to obtain completely and accurately, resulting in low task scheduling efficiency.\
To solve this problem, methods based on stochastic optimization are often used in distributed task scheduling. Such methods use randomness to handle uncertainties and approximate the optimal solution by iteratively updating feasible solutions. However, there are problems such as slow convergence speed, high computational overhead, and sensitivity to parameters.\
In contrast, deep reinforcement learning combines the advantages of deep neural networks and reinforcement learning and provides a new way to solve the above problems. It can automatically learn complex policy functions to adapt to dynamically changing environments and goals. But there is a problem of training stability.

---

We conduct research on task scheduling in the context of dynamic vehicular networks and model it as a Markov process.\
Next, we construct a resource scheduling method based on multi-agent deep reinforcement learning and reverse auction mechanism to achieve distributed and adaptive task scheduling.\
In this process, PPO and LSTM are used to learn the bidding strategy of a single server, successfully capturing the temporal features and long-term dependencies in task scheduling.\
Finally, through simulation experiments and comparison with other benchmark methods, the effectiveness and superiority of the proposed method are verified.

Our method shows excellent adaptability and robustness in complex environments, can accurately make task scheduling decisions in uncertainty, and greatly enhances the long-term stability of the system.

---

Next, let me introduce the multi-agent reinforcement learning (MADRL) in the method part.\
Reinforcement learning aims to enable agents to make optimal decisions through interaction with the environment. In our research, deep reinforcement learning is used to train agents to make efficient decisions in the vehicular network environment. The core is that agents observe the environmental state, take actions and obtain rewards. The reward signal helps them learn the best actions to maximize long-term returns. Expanding to multiple agents interacting and learning in a shared environment forms MADRL. Multiple agents have their own strategies and rewards and may interact or depend on each other. However, MADRL faces difficulties such as controlling competition and cooperation among agents, dealing with environmental instability, overcoming information limitations, ensuring goal consistency and scalability.

---

Now let me introduce the reverse auction mechanism. Different from traditional auctions, in a reverse auction, the buyer does not set the price but issues a tender announcement and invites many suppliers to participate in the bidding. This method is especially suitable for purchasing some relatively standardized goods or services, such as raw materials, resources or labor. In this process, the buyer will clearly and in detail stipulate the specifications and requirements of goods or services, and suppliers will submit their quotations according to these specific requirements.

Reverse auction has significant advantages. First, it can reduce costs. The fierce competition among suppliers will prompt more reasonable and advantageous prices. Second, it can improve procurement efficiency. The appropriate supplier and transaction plan can be quickly determined. Third, it strongly promotes competition among suppliers, thereby promoting the healthier development of the market and providing more high-quality choices for the buyer.

---

Those table shows the Parameter Setting of Simulation Environment.

The simulation environment adopts a sequential turn-based interface from pettingzoo and can be compatible with multi-agent reinforcement learning algorithms.

The number of tasks follows a Poisson distribution at each time step, while the resource requirements adopt a bimodal distribution to more accurately simulate the task characteristics in the real world.

We chose Azure's dedicated hosts as representatives of edge servers and provided virtual machine options with different specifications and prices.

We have adopted two different reinforcement learning agent models, PPO Agent and PPO LSTM Agent. The PPO Agent uses a multilayer perceptron (MLP), and the PPO LSTM Agent adds an LSTM layer on the basis of MLP, enhancing the model's ability to process time series data.

---

Next, let's introduce the four strategies compared in this paper.
The fixed strategy determines the quotation based on task characteristics and duration, with market prices as a reference.
The random strategy randomly samples a coefficient to determine the quotation.
The PPO strategy uses the PPO algorithm and MLP to dynamically determine the quotation according to resources and task characteristics, being more flexible and accurate.
The PPO-LSTM strategy adds an LSTM layer on top of PPO to capture temporal information and make more accurate quotations.

---

During performance evaluation, we employ four metrics to assess performance:
**Load Balance**: Measured by the average standard deviation of the ratio of the server's resource occupation to the total resource amount over time. This reflects the uniformity of server resource utilization.
**Server Earnings**: Comprising the difference between the vehicle's cost paid and the task budget, along with the total revenue minus the maintenance cost. It indicates the actual revenue situation of edge servers.
**Vehicle Utility**: Reflected by the completion rate, which is the ratio of completed tasks to total submitted tasks. A high completion rate implies more efficient processing of vehicle tasks, enhancing the vehicle user experience and also reflecting the ability of the task scheduling strategy to ensure task completion.
**Task Completion Rate**: One of the crucial indicators for measuring the effectiveness of the task scheduling strategy. It is directly related to vehicle utility and the operating efficiency of the entire system.

---

This section evaluates the convergence performance of PPO and PPO-LSTM in training multiple agents to maximize server revenue.
As shown in the chart, although the PPO-LSTM strategy has a slightly slower convergence speed than the PPO strategy, it obtains a higher reward upon final convergence and has less fluctuation in the later stage of the training process. This indicates that the PPO-LSTM strategy is more stable in long-term training and can better capture temporal information to make more reasonable decisions.
This is further confirmed by the data in the table. The average reward of PPO-LTSN is higher than that of PPO, and the standard deviation is smaller.

---

Now, let's take a look at the comparative analysis through simulation experiments and other benchmark strategies.\
We examined three different scenarios where the number of task arrivals and conducted ten independent simulation experiments using five random seeds.\
The experimental results show that the PPO-LTSM strategy performs excellently in multiple indicators. In the scenario where the number of task arrivals is 20, the PPO-LTSM strategy outperforms other strategies, indicating that the PPO-LTSM strategy can maintain good performance under different task load conditions.\
Although the Fixed strategy performs well in server earnings, it performs poorly in other indicators, which may affect user satisfaction. The Random strategy is almost the worst in all indicators, while the PPO strategy performs better in other indicators although it is slightly inferior to the Fixed strategy in server earnings.\
As the number of task arrivals grows, the server's earnings and utilization generally rise while the task completion rate declines, likely due to server overload. When there are 10 arriving tasks, each strategy has similar performance in load balance and task completion rate due to the relatively small number of tasks. When the number of arrivals is 20, the PPO-LSTM strategy outperforms others in all indicators, showing better adaptability and flexibility. In the large-scale task scenario with 40 arriving tasks, the PPO-LSTM strategy continues to lead and achieves better load balance, vehicle utility, and task completion rate.\
In conclusion, we can see that the PPO-LTSM strategy shows better adaptability and performance under different numbers of task arrivals.

---

This paper presents a method based on multi-agent reinforcement learning and reverse auction mechanism for task offloading in vehicular networks. This method enables agents to learn effective bidding strategies and has significant advantages in improving task completion rate and vehicle utility. It can also better adapt to the vehicular network environment. Through comparative experiments, the PPO-LSTM algorithm is selected. This algorithm performs well in the learning process and decision-making quality. The experimental results show that this algorithm has obvious advantages in the vehicular network simulation environment.

---

Although our research has made some progress, it is obvious that there is still room for improvement.\
In the actual vehicular network, vehicle mobility and network topology are more complex and diverse. Future research needs to consider more realistic models and environments to enhance the adaptability and robustness of the method.\
Moreover, multi-agent reinforcement learning training still faces many challenges. Further exploring and optimizing algorithms is crucial for improving system performance and promoting the research and application of vehicular network task scheduling methods.

---

Thank you all for listening. This is the end of my presentation. I hope our research can make some contributions to the development of the field of vehicular network task scheduling. Thank you!
