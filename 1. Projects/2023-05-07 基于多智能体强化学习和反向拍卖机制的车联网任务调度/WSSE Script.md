---
date created: 2024-09-11 15:18
date updated: 2024-09-11 16:59
---

S5 12.00-12.15 UTC9

Respected experts, scholars and guests, good morning! It's a great honor for me to share with you our research results on "Task Scheduling in Vehicular Networks: A Multi-Agent Reinforcement Learning Based Reverse Auction Mechan nism" at this important academic conference. I am Yuming Yuan from the School of Information Science and Engineering, Yunnan University.

Respected experts, scholars and guests, good afternoon! It's a great honor for me to share with you our research results on "Task Scheduling in Vehicular Networks: A Multi-Agent Reinforcement Learning Based Reverse Auction Mechanism" at this important academic conference. I am Yuming Yuan from the School of Information Science and Engineering, Yunnan University.

---

This presentation includes the following parts: Introduction, Method of MADRL and Reverse-Auction, Performance Evaluation, Conclusions and Prospects.

Now, let's start with the introduction.

---

In the field of vehicular networks, vehicles' limited computing power and battery capacity make it difficult to meet the demands of complex or delay-sensitive tasks.

To address this issue, Mobile Edge Computing is proposed, allowing vehicles to offload tasks to MEC servers for execution. An MEC system in a urban setting is shown as follows: 

•Vehicles assess their channel connection status to determine the task offloading point and send task requests to the edge servers.
•The servers return a quotation to the vehicles based on their status and task characteristics.
•Upon receiving all quotations, the vehicles make task offload-ing decisions according to their budget.

In vehicle task scheduling, there are many challenges, such as dynamics, network instability, and heterogeneous resource constraints. A more comprehensive and flexible task scheduling method is needed.

---

Next, I will introduce the research status.
In this field, an important challenge is to effectively perform task scheduling when information is incomplete.

In recent years, distributed task scheduling methods based on **stochastic** optimization have emerged, which can dynamically adjust resource allocation strategies according to real-time feedback.
However, Most existing research is mostly limited to the allocation of network channels or server CPU time. The main goal is to minimize system power consumption or running time rather than revenue.

Existing research mainly focuses on the auction of data resources generated during vehicle driving and does not deeply involve the allocation of edge server resources.

The existing reinforcement learning models for the task offloading problem often can observe the global state or deploy the same model, which does not meet the requirements of a real multi-agent system. 

---

The existing methods face challenges. Traditional task scheduling methods are mostly based on centralized optimization models, such as using mathematical programming, heuristic algorithms, and meta-heuristic algorithms for solution. 

However, in edge environments, system parameters and state information are often difficult to obtain completely and accurately, resulting in low task scheduling efficiency.

Methods based on stochastic optimization are often used in distributed task scheduling. 
Such methods use randomness to handle uncertainties and approximate the optimal solution by iteratively updating feasible solutions. 
However, there are problems such as slow convergence speed, high computational overhead, and sensitivity to parameters.

In contrast, deep reinforcement learning combines the advantages of deep neural networks and reinforcement learning and provides a new way to solve the above problems. 
It can automatically learn complex policy functions to adapt to dynamically changing environments and goals. But there is a problem of training stability.

---

We conduct research on task scheduling in the context of dynamic vehicular networks and model it as a Markov process.

Next, we construct a task scheduling method based on multi-agent deep reinforcement learning and reverse auction mechanism to achieve distributed and adaptive task scheduling.

In this process, PPO and LSTM are used to learn the bidding strategy of a single server, successfully capturing the temporal features and long-term dependencies in task scheduling.

Finally, we verify the effectiveness and superiority of the proposed method through simulation experiments and comparison with other benchmark methods


---

Now, let me introduce the method part.

In our research, deep reinforcement learning is used to train agents to make efficient decisions in the vehicular network environment. 

The core is that agents observe the environmental state, take actions and obtain rewards. 
The reward signal helps them learn the best actions to maximize long-term returns. 

Expanding to multiple agents interacting and learning in a shared environment forms MADRL. Multiple agents have their own strategies and rewards and may interact or depend on each other. 

However, MADRL faces difficulties such as controlling competition and cooperation among agents, dealing with environmental instability, overcoming information limitations, ensuring goal consistency and scalability.

---

Next, let me introduce the reverse auction mechanism. Different from traditional auctions, in a reverse auction, the buyer does not set the price but issues a tender announcement and invites many suppliers to participate in the bidding.

In this process, the buyer will clearly and in detail stipulate the specifications and requirements of goods or services, and suppliers will submit their quotations according to these specific requirements.

Reverse auction has significant advantages. It can reduce costs, improve procurement efficiency and promotes competition among suppliers.

---

Those table shows the Parameter Setting of Simulation Environment.

The number of tasks follows a Poisson distribution at each time step, while the resource requirements adopt a bimodal distribution to simulate the task characteristics in the real world.

We chose Azure's dedicated hosts as representatives of edge servers and provided virtual machine options with different specifications and prices.

We have adopted two different reinforcement learning agent models, PPO Agent and PPO LSTM Agent. 
The PPO Agent uses a MLP, and the PPO LSTM Agent adds a LSTM layer on the MLP, enhancing the model's ability to process time series data.

---

Next, let's introduce the four strategies compared in this paper.
The fixed strategy determines the quotation based on task characteristics and duration, with market prices as a reference.
The random strategy randomly samples a coefficient to determine the quotation.
The PPO strategy uses the PPO algorithm and MLP to dynamically determine the quotation according to resources and task characteristics, being more flexible and accurate.
The PPO-LSTM strategy adds a LSTM layer to capture temporal information and make more accurate quotations.

---

During performance evaluation, we employ four metrics to assess performance:
Load Balance is the Average standard deviation of the ratio of server's resource occupation to total resource amount over time.
Server Earnings is the Total revenue minus maintenance cost for all time steps.
Task Completion Rate is the Ratio of completed tasks to total submitted tasks in all time steps.

---

This section evaluates the convergence performance of agents.

•The PPO - LSTM Agent converges slightly slower than the PPO Agent, but has a higher final reward, less fluctuation in the later training stage.
•The PPO + LTSM Agent achieves a higher average reward, has strong stability with significantly reduced fluctuations.

---

Now, let's take a look at the comparative analysis through simulation experiments and other benchmark strategies.
We examined three different scenarios where the number of task arrivals and conducted ten independent simulation experiments using five random seeds.
The experimental results show that the PPO-LTSM strategy performs excellently in multiple indicators. In the scenario where the number of task arrivals is 20, the PPO-LTSM strategy outperforms other strategies, indicating that the PPO-LTSM strategy can maintain good performance under different task load conditions.
Although the Fixed strategy performs well in server earnings, it performs poorly in other indicators, which may affect user satisfaction. The Random strategy is almost the worst in all indicators, while the PPO strategy performs better in other indicators although it is slightly inferior to the Fixed strategy in server earnings.
As the number of task arrivals grows, the server's earnings and utilization generally rise while the task completion rate declines, likely due to server overload. When there are 10 arriving tasks, each strategy has similar performance in load balance and task completion rate due to the relatively small number of tasks. When the number of arrivals is 20, the PPO-LSTM strategy outperforms others in all indicators, showing better adaptability and flexibility. In the large-scale task scenario with 40 arriving tasks, the PPO-LSTM strategy continues to lead and achieves better load balance, vehicle utility, and task completion rate.
In conclusion, we can see that the PPO-LTSM strategy shows better adaptability and performance under different numbers of task arrivals.

---

•This proposed method for task offloading in vehicular networks has significant advantages in improving task completion rate and vehicle utility, and can better adapt to the vehicular network environment.

•The PPO - LSTM algorithm performs well in the learning process and decision - making quality.

---

•Future research needs to consider more realistic models and environments to enhance the adaptability and robustness of the method.

•Further exploring and optimizing of MADRL is crucial for improving the system performance and promoting the research and application of vehicular network task scheduling methods.

---

Thank you all for listening. This is the end of my presentation. I hope our research can make some contributions to the development of the field of vehicular network task scheduling. Thank you!
