[MISSING_PAGE_EMPTY:1]

## 1 Introduction

Cloud Computing is emerging as a high performance computing environment with a large-scale, heterogeneous collection of autonomous systems and flexible computational architecture [1, 2]. It provides the tools and technologies to build data or computational intensive parallel applications with much more affordable prices compared to traditional parallel computing techniques. Hence, there has been an increasingly growth in the number of active research work in cloud computing such as scheduling, placement, energy management, privacy and policy, security [3, 4, 5, 6], etc.

Workflow scheduling in cloud environment has recently drawn enormous attention thanks to its wide application in both scientific and economic areas [7, 8, 9, 10, 11, 12]. A workflow is usually formulized as a Directed-Acyclic-Graph (DAG) with several \(n\) tasks that satisfy the precedent constraints. Scheduling workflows in clouds is referred to as matching tasks onto m supporting computational resources, i.e., virtual machines (VMs) created on IaaS clouds. For multi-objective scheduling, objectives can sometimes be conflicting. E.g., for execution time minimization, fast VMs are more preferable than slow ones. However, fast VMs are usually more expensive and thus execution time minimization may contradict the cost reduction objective. It is widely acknowledged as well that to schedule multi-task workflow on distributed platforms is an NP-hard problem. It is therefore extremely time-consuming to yield optimal schedules through traversal-based algorithms. Fortunately, heuristic and meta-heuristic algorithms with polynomial complexity are able to produce approximate or near optimal solutions of schedules at the cost of acceptable optimality loss [13]. Good examples of such algorithms are multi-objective particle swarm optimization (MOPSO) [14] and non-dominated sorting genetic algorithm-II (NSGA-II) [15]. Although these algorithms provide satisfactory solutions, they require a lot of prior experts' knowledge and human intervention, usually in terms of encoding schemes. It is noticed by various contributions [16, 17, 18, 19] as well that game-theoretic models and approaches are highly capable of dealing with the cloud-based workflow scheduling problems.

Recently, as novel machine learning algorithms are becoming increasingly versatile and powerful, considerable research efforts are paid to using reinforcement learning (RL) and Q-learning-based algorithms [20, 21, 22, 23] in finding near-optimal workflow scheduling solutions. Nevertheless, most existing contributions focused on single-objective workflow scheduling with service-of-level (SLA) agreement constraints. Although there exist various multi-agent reinforcement learning (MARL) models and methods for multi-robot control, decentralized network routing, distributed load-balancing, electronic auctions, and traffic control problems, MARL-based workflow scheduling methods are still non-existent.

Based on above observations, in this work, we formulate the scheduling problem into a discrete-events and multi-criteria-interaction Markov game model and propose a multi-agent Deep-Q-network (DQN) algorithm with reinforcement learning for multi-objective workflow scheduling aiming at optimizing both workflow completion time and cost. The DQN agents are trained in a multi-agent reinforcement learning (MARL) environment and fed with data from legacy system such as heuristics in neural networks. We consider each DQN agent observes all the other agents' actions and rewards and selects its own joint distribution action along with environment updates. The resulting workflow scheduling plans are generated through a self-learning and self-optimizing manner. Our proposed approach are featured by the following strengths: 1) Agents can be trained for workflows with varying types of process models and heterogeneous VMs with varying resource configurations; and 2) The destination scheduling plans can be obtained without human intervention or prior expert's knowledge. We conduct extensive case studies with multiple scientific workflow templates over simulation tests using real-world third-party IaaS cloud data. The experimental results clearly suggest that our proposed approach outperforms traditional ones in terms of both make-span and cost optimization.

## 2 Related Work

It is widely known that to schedule multi-task workflow on distributed platforms is an NP-hard problem. It is therefore extremely time-consuming to yield optimal schedules through traversal-based algorithms. Fortunately, heuristic and meta-heuristic strategies with polynomial complexity are capable of producing approximate or near optimal solutions at the cost of acceptable optimality loss. E.g., Kaur _et al._[24] proposed a multi-objective bacteria foraging optimization algorithm (MOBFOA) by modifying the original BFOA and considering Pareto-optimal fronts. They aimed at minimizing flow-time, make-span, and resource-usage cost. Zhang _et al._[25] presented a bi-objective geneticalgorithm (BOGA) capable of optimizing both energy savings and workflow reliability and obtaining near-optimal Pareto fronts. Casas _et al._[26] presented an enhanced genetic Algorithm with Efficient Tune-In (GA-ETI) for scientific applications in cloud systems. It is capable of optimizing both workflow make-span and cost. Verma _et al._[27] presented a non-dominated-sorting-based Hybrid Particle-Swarm-Optimization (HPSO) algorithm for workflow scheduling, which is capable of optimizing both execution time and cost. Zhou _et al._[28] proposed a fuzzy dominance sort based heterogeneous earliest-finish-time (FDHEFT) algorithm capable of minimizing both cost and make-span of workflows deployed on IaaS clouds. However, these approaches are significantly restricted by prior expert's knowledge from static global point of view, which cannot appropriately describe the dynamic process of workflow scheduling.

Recently, game-theoretic and Reinforcement learning (RL) models and methodologies are widely applied to the multi-constraint process scheduling problems [29, 30, 31, 32, 33, 34, 35]. It is believed the equilibrium concept in game theories and multi-agent training methods are highly potent in dealing with multi-constraint and multi-objective optimization problems. E.g., Duan _et al._[18] proposed a sequential cooperative game algorithm for cost and make-span optimization while fulfilling storage constraints for large-scale workflow scheduling. Cui _et al._[22] provided a reinforcement-learning-based approach for multi-workflow scheduling with multiple priorities submitted at different times in cloud environment. Iranpour _et al._[17] proposed a distributed load-balancing and admission-control algorithm based on a fuzzy game-theoretic model for large-scale SaaS clouds. Wu _et al._[20] proposed an improved Q-learning algorithm with weighted fitness value function for optimization of completion time and load balancing in cloud environment.

## III System Model

A scientific workflow is represented by a Directed Acyclic Graph (DAG) \(W=(T,E)\), where \(T=\{t_{1},t_{2},\ldots,t_{n}\}\). is a set of n tasks \(\{t_{1},t_{2},\ldots,t_{n}\}\)., \(E\) is a set of precedence dependencies. Each task \(t_{i}\) represents an individual application with a certain task running time \(rt_{i}\) on an instance. A precedence dependency \(e_{ij}=(t_{i},t_{j})\) indicates that \(t_{j}\) starts only after \(t_{i}\) is accomplished and the data from \(t_{i}\) are received. The source and destination of a dependency \(e_{ij}\) are called the parent and the child task, respectively. The workflow starts and concludes by the entry and exit tasks, respectively. A dummy entry/exit task with zero execution time can be added as a sole entry/exit one if the original workflow has multiple entry/exit ones rather than a single one.

In this work, we consider IaaS clouds as the supporting platforms of multiple workflows. IaaS clouds offer numerous heterogeneous virtual machines with varying resource and pricing configurations for executing workflows tasks. The optimization problem can be formulated as follows,

\[\textit{Min}f_{1} =\textit{makespan}=max\{FT(V_{j},n_{k,i})*x_{k,i,j}\} \tag{1}\] \[\textit{Min}f_{2} =\textit{cost}=\sum_{k=1}^{M}FT(V_{j},n_{k,i})*x_{k,i,j}*p_{j} \tag{2}\]

subject to,

\[i \in[1,n_{k}],\quad j\in[1,M],\ k\in[1,K] \tag{3}\] \[FT(V_{j},n_{k,i}) =st_{k,i,j}+rt_{k,i,j},\quad FT(V_{j},n_{k,i})\geq 0 \tag{4}\]

where \(f_{1},f_{2}\) illustrate the two quantitative objectives, i.e., the make-span and user's cost, respectively. And \(p_{j}\) is the unit price of each virtual machine \(V_{j}\). The boolean indicator \(x_{k,i,j}\) equals 1 when task \(n_{k,i}\) is allocated to virtual machine \(V_{j}\); otherwise \(x_{k,i,j}=0\). \(FT(V_{j},n_{k,i})\) is the finish time when \(V_{j}\) mapping task \(n_{k,i}\), in terms of start time \(st_{k,i,j}\) and runtime \(rt_{k,i,j}\).

To solve the above formulation, we consider a self-adaptive DQN-based MARL framework shown as Figure 1, which is capable of generating real-time workflow scheduling plans. The two optimization objectives are abstracted as two DQN agents, which are trained through self-adaptive process built upon a stochastic Markov game. The environment is modeled as a set of states and actions can be performed to control the workflow scheduling system's state.

## IV Methods: Application of MARL to workflow scheduling

### Workflow scheduling as Markov game

Markov games can been seen as an extension of Markov Decision Processes (MDPs) to the multi-agent case, in which joint actions \(\pi_{s^{\prime}}\) are the result of multiple agents choosing an [36].

**Definition 1**: _A(finite, discounted) Markov game is a tuple \(\Gamma^{d}=(i\in I,S,A,R,P)\) in which [37],_

* \(I\) _is a finite set of players or agents._
* \(S\) _is a finite set of states._

Figure 1: Overview of DQN-based MARL framework for workflow scheduling.

* \(A=\prod_{i\in I,s\in S}A_{i}(s)\), where \(A_{i}(s)\) is player \(i\)'s finite set of pure actions at state \(s\); we define \(A(s)\equiv\prod_{i\in I}A_{i}s\) and \(A_{-i}=\prod_{j\neq i}A_{j}(s)\), so that \(A(s)=A_{-i}(s)\times A_{i}(s)\); we write \(a=(a_{-i},a_{i})\in A(s)\) to distinguish player \(i\), with \(a_{i}\in A_{i}(s)\) and \(a_{-i}\in A_{-i}(s)\); we also define \(\mathcal{A}=\bigcup_{s\in S}\bigcup_{a\in A(s)}([s,a)]\), the set of state-action pairs.
* \(P\) is a system of transition probabilities, i.e., for all \(s\in S\), \(a\in A(s)\), \(P[s^{\prime}|s,a]\geq 0\) and \(\sum_{i^{\prime}\in S}P[s^{\prime}|s,a]=1\); we interpret \(P[s^{\prime}|s,a]\) as the probability that next state is \(s^{\prime}\) given that the current state is \(s\) and the current action profile is \(a\).
* \(R:\mathcal{A}\rightarrow[\alpha,\beta]^{I}\), where \(R_{i}(s,a)\in[\alpha,\beta]\) is player \(i\)'s reward at state \(s\) and at action profile \(a\in A(s)\).
* \(\delta\in[0,1]\) is a discounted factor.

We consider the workflow scheduling process to be a Markov game with scheduling goals, i.e., make-span and cost, as two agents. It is assumed that each agent observes each other's actions and rewards. Then they select the joint distribution \(\pi_{\delta^{\prime}}\), i.e., the combination of choices of all agents. Each agent further decides an action \(a_{i}^{\prime}\) and the resulting pure action profile \(a^{\prime}=(a_{1}^{\prime},\ldots,a_{I}^{\prime})\) is performed. Based on the current state and the action profile, each agent earns reward \(R_{i}(s^{\prime},a^{\prime})\) and the system evolves to state \(s^{\prime+1}\) with the transition probability \(P[s^{i+1}|s^{\prime},a^{\prime}]\). The above process is repeated at time \(t+1\). A state of the space \(S\) is characterized by the currently available VMs and immediately succeeding tasks of those which are mapped to destination VMs for execution in the previous state. The action space \(A\) consists of the mapping probability of certain task being mapped into a certain VM. The reward \(R:A\rightarrow\mathbb{R}^{n}\) are derived from (1) and (2).

Note that the performance of scheduling is directly influenced by the reward mechanisms along with the interactions among agents. There may exist multiple equilibria with multiple values. In order to resolve this problem, we introduce an utilitarian selection mechanism \(f=max_{\pi_{\delta}\in\Delta(A(s))}\sum_{j\in I}Q_{j}(s,a)\), which donates maximize the sum of all agents' rewards in each state. Usually, the equilibrium policies in a Markov game are solutions of problem with stable results. Instead of Nash equilibrium, we consider a correlated equilibrium with increased generality. It allows for dependencies among agents' strategies, that is a joint distribution over actions from which no agent is motivated to deviate unilaterally. The solutions of the workflow scheduling problem are thus correlated equilibria, where agents are allowed to select actions according to a stationary policy \(\pi\in\prod_{s\in S}\Delta(A(s))\).

**Definition 2**: _Given a Markov game, a stationary policy \(\pi\) is a correlated equilibrium if for all agent \(i\in I\), for all \(s\in S\), for all \(a_{i},a_{-i}^{\prime}\in A_{i}(s)\),_

\[\sum_{a_{-i}\in A_{-i}(s)}\pi_{s}(a_{-i},a_{i})Q_{i}^{\pi}(s,(a_{- i},a_{i}))\\ \geq\sum_{a_{-i}\in A_{-i}(s)}\pi_{s}(a_{-i},a_{i})Q_{i}^{\pi}(s, (a_{-i},a_{i}^{\prime})) \tag{5}\]

That is, in state \(s\), when it is recommended that agent \(i\) play \(a_{i}\), it prefers to play \(a_{i}\), because the expected utility of \(a_{i}\) is greater than or equal to the expected utility of \(a_{i}^{\prime}\), for all \(a_{i}^{\prime}\).

### Dqn-based MARL in Workflow Scheduling

DQN [38] is a popular method in reinforcement learning. It learns the action-value function \(Q^{*}\) corresponding to the optimal policy by minimizing the loss,

\[\mathcal{L}(\theta) = \mathbb{E}_{s,a,r,s^{\prime}}[(Q^{*}(s,a|\theta)-y)^{2}] \tag{6}\] \[y = r+\delta max_{a^{\prime}}Q^{*}(s^{\prime},a^{\prime}) \tag{7}\]

where \(y\) is a target \(Q\) function whose parameters are periodically updated with the most recent \(\theta\), which helps stabilize learning. Another crucial component of stabilizing DQN is the use of an experience replay buffer \(D\) containing tuples \((s,a,r,s^{\prime})\). The agent determines its actions by using a neural network and mixing the output of the neural network with random actions to sample its training set. Usually, the agent trains the neural network in such a way that it predicts the cumulative, weighted rewards for all actions.

The optimal policy of a DQN-based agent not only interacts directly with the workflow environment, but also with the policies of the other agents as well. The iterative algorithm for computing global equilibrium policies based on local updates Q-values, policy at each state. Generally, Q-values are given at time \(t\) for all \(i\in I\), for all \(s\in S\), and for all \(a\in A(s)\), namely \(Q_{i}^{\prime}(s,a)\). To achieve a correlated equilibrium, each DQNagent learns about the correlated equilibrium strategy \(\pi^{t}\), where \(\pi_{s}^{t+1}\in f(Q^{t+1}(s))\), the DQN-based MARL algorithm is developed in **Algorithm 1**. Along with suitable reward mechanisms designed, the convergence of the DQN-based algorithm in multi-agent settings can be guaranteed. For the make-span agent, the reward mechanism is designed as,

\[\mathfrak{R}_{1}=[\frac{ET_{k,i,j}(a)-(\textit{makespan}^{\prime}-\textit{ makespan})}{ET_{k,i,j}(a)}]^{3} \tag{8}\]

similarly, the cost reward is designed as,

\[\mathfrak{R}_{2}=[\frac{\textit{worest}-ET_{k,i,j}(a)*p_{j}}{\textit{worest}- \textit{best}}]^{3} \tag{9}\]

where (8) indicates a lower increase of make-span is more preferable. Similarly, (9) indicates that a lower increase of cost is more preferable. Figure 2 demonstrates the convergence of our proposed approach with respect to make-span and cost.

## V. Experiments, results and discussion

For the model validation purpose, we conduct extensive case studies based on multiple well-known scientific workflow templates shown in Figure 3 and real-world third-party commercial clouds, i.e., the Amazon EC2 shown in Table 1.

We consider different types of tasks, namely AES, LZMA, JPEG, Canny and Lua workloads that simulate task execution scenarios, are performed by the workflow templates shown in Figure 3. As shown in Table 2 from Geekbench [39], the performances of tasks are varying based on the type of supporting VMs from Amazon EC2. For the comparison reason, we consider MOPSO [14], NSGA-II [15] and

\begin{table}
\begin{tabular}{|l|l|l|l|l|} \hline vTypes & vCPU & Memory & Availability & Price \\  & & Zone & (USDS/hr) \\ \hline \(t3.medium\) & 2 & 8 & \(us-east-2a\) & 0.0418 \\ \(t3.large\) & 2 & 8 & \(us-east-2c\) & 0.0835 \\ \(c5.large\) & 4 & 16 & \(us-east-2a\) & 0.0850 \\ \(m5.large\) & 4 & 16 & \(us-east-2a\) & 0.0960 \\ \(c5n.large\) & 8 & 32 & \(us-east-2c\) & 0.1080 \\ \(r5a.large\) & 8 & 32 & \(us-east-2b\) & 0.1260 \\ \(a1.4xlarge\) & 8 & 32 & \(us-east-2a\) & 0.4080 \\ \hline \end{tabular}
\end{table}
Table 1: **Units for price of Amazon EC2 instances.**

Figure 3: **Overview of five workflow templates.** **(a)** CyberShake, **(b)** Epigenomics, **(c)** Inspiral, **(d)** Montage, and **(e)** **Sipht.**

Figure 2: **The convergence of DQN-based MARL framework.**

game-theoretic based greedy algorithm(GTBGA) [19] as the baseline algorithms.

Figure 4 illustrates the scheduling results with relatively small number of total tasks of five workflows, in terms of Gant charts, of different algorithms. It can be seen that our proposed algorithm outperforms baseline algorithms in terms of make-span. Intuitively, the advantage of our algorithm is achieved due to the fact that our algorithm leaves less inter-task dwelling time and squeezes to more exploit the underlying parallelism provisioned by the EC2 platforms. In contrast, baseline algorithms tend to follow the topological constraint of workflows first and hesitate to fully exploit the potential parallelism.

Figure 5 shows the resulting comparison of make-span and cost achieved by different algorithms based on the scheduling plans shown in Figure 4. When taking into account both make-span and cost metrics, the performance of MOPSO algorithm apparently outweighs that of GTBGA and NSGA-II. Although MOPSO algorithm is cheaper than our proposed algorithm, our proposed algorithm clearly beats baseline ones in terms of make-span, and our algorithm is much cheaper than the GTBGA and only 2.899%, 4.303% more expensive than NSGA-II and MOPSO, respectively when task size is 138. According to Figure 6, we can clearly see that there is little difference between the baseline ones and our proposed method in terms of total cost for each kind of task size.

\begin{table}
\begin{tabular}{|l|l|l|l|l|l|l|} \hline vTypes & AES & LZMA & JPEG & Canny & Lua & Average \\ \hline \(l3.medium\) & 4217 & 4243 & 4228 & 3956 & 3537 & 4065 \\ \(l3.large\) & 4515 & 4905 & 5386 & 5080 & 4875 & 5035 \\ \(c5.large\) & 4525 & 4791 & 5526 & 5161 & 4936 & 4521 \\ \(m5.large\) & 4184 & 4490 & 4940 & 4678 & 4532 & 4575 \\ \(c5n.large\) & 4600 & 4967 & 5487 & 5122 & 4982 & 5105 \\ \(r50.large\) & 5019 & 4768 & 4777 & 4530 & 3899 & 4549 \\ \(c1.4.large\) & 11489 & 25676 & 33355 & 14516 & 23089 & 16861 \\ \hline \end{tabular}
\end{table}
Table 2: **Units for multi-core performance scores of instances.**

Figure 4: **Illustration of workflow scheduling with 138 tasks over NSGA-II, MOPSO, GTBGA and DQN-based MARL algorithms. (a) CTBGA; (b) NSGA-II; (c) MOPSO and (d) DQN-based MARL algorithm.**

## VI Conclusion

This paper targets at the problem of multi-objective workflow scheduling in the heterogeneous IaaS cloud environment. We model the multi-objective workflow scheduling as a stochastic Markov game and develop a decentralized DQN-based MARL framework that is capable of obtaining correlated equilibrium solutions of workflow scheduling. The proposed DQN-based MARL framework is featured by the combination the traditional DQN algorithm for reinforcement learning and the novel model of cooperative and correlated equilibrium. We conduct extensive case studies based on Amazon EC2 and multiple scientific workflow templates and show that our proposed method outperforms the baseline algorithms such as NSGA-II, MOPSO and GTBGA.

As future work, we plan to consider more QoS metrics, such as reliability, security, load-balancing, etc. and introduce corresponding algorithms for on-the-fly scheduling for cross-organizational workflows. our proposed method relies on knowledge of QoS data of all tasks and candidate cloud servers. However, in practice it would be too expensive and time-consuming to collect such data at run-time. We thus intend to introduce large-scale-sparse-matrices-analysis models [40, 41] for QoS prediction when historical QoS data is insufficient.

## Acknowledgment

_(Yuandou Wang and Hang Liu contributed equally on this work.)_

Figure 5: Illustration of comparisons of baseline algorithms and DQN-based MARL method with four different task sizes. (a) 138; (b) 252; (c) 358 and (d) 491.

Figure 6: Comparisons of baseline algorithms and DQN-based MARL method with four different task sizes.

