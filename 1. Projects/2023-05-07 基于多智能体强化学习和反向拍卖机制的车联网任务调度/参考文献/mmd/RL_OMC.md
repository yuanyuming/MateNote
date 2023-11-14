An Ordered Submodularity-Based Reinforcement Learning Mechanism for Budget-Feasible Online Mobile Crowdsensing Task Allocation with Distance Factors

Jixian Zhang, Peng Chen, Hao Wu, Athanasios V. Vasilakos,, Weidong Li

This work is supported in part by the National Natural Science Foundation of China (Nos. 620260625, 12071417, 61926061), the Education Foundation of Yunnan Province of China (2022002) and the Program for Excellent Young Talents, Yunnan, China.J. Zhang, P. Chen and H. Wu are with the School of Information Science and Engineering, Yunnan University, Kunming, Yunnan 680504, PR China. Email: andanjixian@ynu.edu.cn, ynu_cbp163.com, hawowu@ynu.edu.cn.Athanasios V. Vasilakos is with the College of Mathematics and Computer Science, Fuzhou University, Fuzhou 350116, PR China and with the Center for AI Research (CARI), University of Agder (UIA), Grimstad, Norway. Email: thanos.vasilakos@uia.com.W. Li is with the School of Mathematics and Statistics, Yunnan University, Kunming, Yunnan 6050504, PR China. Email: weidong@ynu.edu.cn. Weidong Li is the corresponding author.This paragraph will include the Associate Editor who handled your paper.

###### Abstract

In most existing mobile crowdsensing services studies, it is assumed that the data collected by users in the same area have the same value; however, this is not consistent with real situations. For example, noise or air quality data collected in the same area will differ greatly. Therefore, the distance between the user's location and the data collection point impacts the value of the collected data that cannot be ignored. This paper innovatively considers the distance factor between the user's location and the data collection point in the revenue obtained by the mobile crowdsensing services provider and transforms it into an ordered submodularity model with budget constraints. Additionally, based on the background of online mobile crowdsensing task allocation, we design a reverse-action mechanism based on reinforcement learning to solve the winner decision-making and payment problems. The mechanism satisfies individual rationality, truthfulness, and budget feasibility through weight replacement and the equilibrium price strategy. Compared with existing algorithms, our approach is shown to enable the service provider to obtain a higher value and a lower payment.

 Online mobile crowdsensing, mechanism design, reinforcement learning, budget feasibility, ordered submodularity.

## I Introduction

Mobile crowdsensing data collection is used in many fields, such as digital twins, metaverse, Internet of Vehicles, and smart cities [1]. The basic principle of most mobile crowdsensing services (MCSs) is that the MCS provider sets up multiple points of interest (POIs) within a region of interest (ROI) that need to be measured and, simultaneously, announces the corresponding data collection task for each POI. When a user passes by the POIs, she or he can collect and then transmit data to service providers. In early mobile crowdsensing applications, service providers rarely considered user compensation, resulting in fewer users participating in data collection. Therefore, service providers adopted incentive mechanisms, such as paying a certain fee to data collection users to compensate them for their time and energy consumption costs, encourage more users to participate in data collection, and obtain higher-quality user data. Fig. 1 shows the general POI-based mobile crowdsensing services process with incentive mechanisms. 1. The service provider releases the data collection task for each POI. 2. If the user is willing to participate in mobile crowdsensing, submit the moving path and the expected reward (bid) to the service provider. 3. According to the information submitted by the users, the service provider selects the most valuable users, calculates the payment price under the budget constraints, and notifies the winning user. 4. Users collect and upload the data to the service provider. 5. The service provider pays the fee to the users. In this process, the user's bid should equal the data collection cost, but based on the user's self-interest assumption, the user may lie about his or her bid to obtain higher profits. Therefore, it is necessary to ensure the truthfulness of user information submitted through the mechanism design.

Fig. 1: POI-based mobile crowdsensing service with distance factor.

### _Motivation_

Mobile crowdsensing mechanism design consists of allocation and payment algorithms. The allocation algorithm selects the winning user based on the information provided by the users, and the payment algorithm calculates the payment paid to the winning user. Designing allocation and payment algorithms according to certain rules can guarantee the economic characteristics of the mechanism. Recently, there have been many research results on combining mechanism design and mobile crowdsensing. For example, consider the online mechanism design of users arriving at a POI in real time [2], analyze the problem of weighted POI coverage maximization [3], consider that the value of data collected by users at POIs decreases over time (time discount) [4], design a post price mechanism for determining compensation for user densities in different POIs [5], and design a mobile crowdsensing task allocation mechanism based on POI coverage probability distribution [6]. The above research shows that using POIs as the basic model for the mobile crowdsensing problem is effective. However, in existing research, it is assumed that the data value contributed by different users at the same POI is consistent, which is not appropriate in some cases. For example, in Fig. 1, it is assumed that the service provider must collect noise information of POI $m$, but users cannot accurately reach this POI due to the terrain. To avoid situations in which a POI cannot be accurately covered, the existing research regards the POI as an area. As long as the users pass through this area and submit the collected data, the service provider considers these data to have the same value. In this example, two users pass through the POI coverage area, but user 1 is closer to the coordinates of POI $m$. In theory, the value of the data contributed by user 1 should be greater because, for noise data collection, the closer the distance to the target, the more accurate the data should be. There are many similar situations, such as collecting video, air quality, and signal strength data near POIs. These situations lead to a valuable and interesting problem: modeling the mobile crowdsensing problem when users contribute different data values to the same POI.

Most existing studies express the mobile crowdsensing value model with a submodular function. The submodular function is a set function, and the order of users in the set does not affect the function value. However, when the data value contributed by different users to the same POI is inconsistent, using the submodular function to construct a value function is impossible. Because each POI must collect data for different times (also known as different coverage times), for some important POIs, more users are required to collect data. However, different users contribute differently to the same POI, which means that the order of users in the collection significantly impacts the data value obtained at POIs. This class of problems is defined as **ordered submodularity problems**. Kleinberg analyzed it in detail in [7].

### _Main Contribution_

In this paper, we further consider the problem of online mobile crowdsensing task allocation. In our consideration, the user submits her or his moving path and expected reward to the service provider in online mode. The service provider calculates the marginal value of each user's contribution to each POI based on the user's path. Because the distance factor is considered, the value contribution of each user to the POI is different, so the traditional submodular function cannot be used to describe the data value. Under budget constraints, we use the reverse-auction mechanism to help service providers design corresponding algorithms to determine the most valuable users. Additionally, to prevent users from untruthfully reporting bids and obtaining more profits, our designed mechanism can guarantee economic characteristics such as truthfulness (strategy-proof or incentive compatible) and individual rationality. The main contributions include the following:

1. The article considers the distance factor between the user path and the POI in the online mobile crowdsensing task allocation problem and transforms it into an ordered submodularity model with budget constraints. To the best of our knowledge, this is the first paper that combines ordered submodularity theory with online mobile crowdsensing problems, providing a more practical approach for modeling mobile crowdsensing problems.
2. More importantly, we design allocation and payment algorithms with polynomial time based on reinforcement learning for online arriving users. Reinforcement learning is very suitable for solving online problems. However, when applying reinforcement learning to mechanism design, must also satisfy economic characteristics such as truthfulness, individual rationality, and budget feasibility. The algorithm must also have a polynomial execution time, which is a major challenge addressed in this paper.
3. We separate the strategy features from the state information in the Markov decision process (MDP) and propose the concept of weight replacement and equilibrium price to ensure the truthfulness of the mechanism. In addition, we propose two reinforcement learning algorithms based on the full state and the simplified state and compare them with the state-of-the-art mechanism [4, 8]. The experiments prove that the mechanism proposed in this paper can obtain more revenue with less payment.

The rest of this paper is organized as follows: In Section II, we discuss the existing studies on MCSs and mechanism design. In Section III, we describe the online mobile crowdsensing task allocation problem and mechanism design preliminaries. In Section IV, we propose a reinforcement learning-based mechanism for online mobile crowdsensing. Then, we prove that the mechanism satisfies individual rationality, truthfulness and budget feasibility. In Section V, we evaluate the mechanisms through extensive experiments. Finally, in Section VI, we summarize our results and present possible directions for future research.

## II Related Works

Mobile crowdsensing utilizes the user's equipment to sense, collect, aggregate and transmit data to the cloud for crowdintelligence extraction and people-centric service delivery and has received much attention [9]. In early mobile crowdsensing applications, service providers rarely considered compensation to users, resulting in fewer users participating in data collection. Therefore, service providers adopted some incentive mechanisms. Mechanism design has been successfully applied to cloud computing [10], edge computing [11], the Internet of Things [12], blockchain [13], and other fields. Similarly, a good mechanism design can stimulate the enthusiasm of participants and encourage them to join MCSs.

Singer [14] first studied a mechanism with budget constraints, designed an advanced PSM algorithm for submodular functions, and created a precedent for combining MCS and mechanism design. Anari et al. [15] considered a mechanism design problem in large-scale crowdsensing markets and designed a budget-feasible mechanism for large markets that achieves a competitive ratio of $1-1/e=0.63$. Zheng et al. [3] studied the POI coverage problem of MCSs and proposed the BEACON mechanism, which is a budget-feasible and strategy-proof incentive mechanism for weighted coverage maximization in mobile crowdsensing. Hu et al. [16] proposed a novel blockchain-based MCS framework that preserves privacy and secures both the sensing process and the incentive mechanism by leveraging emergent blockchain technology. Han et al. [17] considered a scenario in which a mobile crowdsensing platform aims to maximize crowdsensing revenue under a budget constraint and the users are interested in maximizing their utility while keeping their cost private. Wang et al. [18] proposed an incentive mechanism to maximize the social welfare for mobile crowdsensing and designed a discrete particle swarm optimization algorithm for worker-centric task selection to maximize worker utility. Zhang et al. [6], based on the assumption of the user coverage probability model, transformed the opportunistic mobile crowdsensing value maximization problem into an ordered submodularity value function model with budget constraints. However, the above studies are aimed at the MCS offline problem S. Compared with offline problems, many MCS scenarios have online characteristics. Based on the online auction model, Zhao et al. [2] investigated a problem in which users submitted their private types to the MCS provider randomly. Then, they designed an online mechanism that satisfied the economic characteristics. Zheng et al. [4] investigated the problem of online crowdsensing by considering the critical property that the values of the user contributions decrease as time passes. They proposed a new method to select users based on a time-related threshold and presented a strategy-proof framework. Wang et al. [19] proposed a reverse-auction framework to model the interaction between the platform and mobile users. Then, they presented an online truthful incentive mechanism to motivate users, including online winner selection and re-muneration determination strategies. Li et al. [20] proposed an online strategy-proof mechanism to minimize the social cost of the whole system and achieve truthfulness by applying the auction framework and improving the competitive ratio of the online algorithm. The above studies carried out in-depth research on offline or online MCS problems, but none considered the influence of distance factors on MCS problems.

Reinforcement learning is suitable for solving problems with online or serialization characteristics and has been used in many fields, such as resource allocation [21] and task scheduling problems [22, 23]. Many problems in MCS are also suitable for solving with reinforcement learning. Xiao et al. [24] transformed the interaction between MCS servers and mobile users into a Stackelberg game and used a DQN-based deep convolutional neural network to accelerate the learning process with a high-dimensional state space and action set. Liu et al. [25] maximized the total quantity of data collected by mobile devices with limited energy reserves and proposed deep reinforcement learning (DRL) techniques for directing device sensing and movement. Although reinforcement learning is suitable for solving problems such as task scheduling and resource allocation in MCSs, it does not satisfy the economic characteristics of mechanism design, and the user's strategic behavior may lead to an untruthful solution. Therefore, combining mechanism design with reinforcement learning to solve MCS problems is an important research direction. Zhan et al. [26] formulated the MCS problem as a multileader and multifollower Stackelberg game and proved the existence of the Stackelberg equilibrium. They also proposed a DRL-based dynamic incentive mechanism to learn the optimal pricing strategies directly from game experiences without knowing private user information. Gu et al. [27] formulated the competitive interactions between a sensing platform and mobile users as a multistage Stackelberg game, transformed it into a convex optimization problem, and designed a corresponding multiagent DRL algorithm to solve it. Zhao et al. [28] considered a noncooperative vehicular crowdsensing campaign where multiple vehicles are incentivized by dynamically priced tasks and the social network effect. They proposed a social-aware incentive mechanism by DRL to derive the optimal long-term sensing strategy for all vehicles. Liu et al. [29] formulated the interactions between platforms and participants as a multileader-multifollower Stackelberg game and derived the Stackelberg equilibrium. They designed a Q-learning-based reinforcement learning algorithm to obtain the optimal participant sensing contributions. Combining reinforcement learning and mechanism design is not easy, mainly because the economic characteristics in the mechanism are not easy to satisfy, which is an important research topic in this paper.

Most MCS problems have the characteristic of diminishing marginal value, so many researchers transform these problems into submodular functions to be solved. Dobzinski et al. [30] reported an approximation mechanism under the submodular value function model. This problem was extended by Assadi [31]. However, if the user's contribution to each POI is inconsistent in the MCS, traditional submodular functions cannot work effectively. The basic theory of this problem has not been solved until recently. Zhang et al. [32] proposed the concept of string submodular functions and proved that the greedy strategy achieves at least a $(1-\epsilon)$-approximation of the optimal strategy by defining the total forward curvature. Kleinberg et al. [7] proposed a new type of submodular function, named the ordered submodularity function, where the order of the elements in the set affects the function value. They gave the definition, proof and basic algorithm of the ordered submodularity function. The research problem in this paper is defined on this basis. Qian et al. [33] made a more detailed classification for monotone submodular functions over sequences and proved that the evolutionary algorithm has a good effect on the sequential submodular problem. The emergence of ordered submodularity functions provides a new theoretical basis for modeling MCSs.

Inspired by the above literature, this paper applies ordered submodularity theory to model the online MCS revenue maximization problem for the first time and designs a reinforcement learning-based mechanism that can achieve truthfulness, individual rationality, budget feasibility and computational efficiency.

III Online Mobile Crowdsensing Task Allocation with Distance Factors and Mechanism Design Preliminaries

### _Problem and Model_

We assume that there are $M$ POIs in the ROI area that need to collect data, represented by the set $\mathcal{M}=\{1,2,...,M\}$. For any POI $m\in\mathcal{M}$, we define $k_{m}\in Z^{+}$ as the maximum number of data collection tasks that need to be performed on the POI. This assumption is reasonable because service providers need to collect data many times for some important areas to obtain effective information. If the user completes the task, the service provider will obtain $r_{m}\in R^{+}$ revenue. Therefore, theoretically, at POI $m$, the maximum revenue that can be obtained is $k_{m}\cdot r_{m}$. In addition, the maximum budget of the service provider is $B$.

In time period $\mathcal{T}=\{1,2,...,T\}$, there are $N$ users who sequentially enter the ROI and participate in the mobile crowdsensing service, represented by the set $\mathcal{N}=\{1,2,...,N\}$. User $i\in\mathcal{N}$ arrives in the ROI at $t_{i}\in\mathcal{T}$. We also define $i\prec i+1,i=1,2,...,N-1$ to mean that user $i$ arrives earlier than user $i+1$. The users arrive at different times, that is, $t_{i}\neq t_{j},\forall i,j\in\mathcal{N}$. When the user enters the ROI, she or he submits her or his move path $P_{i}$ to the service provider in advance. The user's path will pass through several POIs. However, since the user's path cannot accurately arrive at the POIs (for example, 20 meters away from the POI), the service provider will calculate the shortest distance between the user's path and the POIs within the effective range to evaluate the value of the user contributed data. Assuming that the shortest distance between user $i$ path $P_{i}$ and POI $m$ is represented by $d(m,P_{i})=\min\left\{\sqrt{\left(x_{i}-x_{m}\right)^{2}+\left(y_{i}-y_{m} \right)^{2}},\forall\left(x_{i},y_{i}\right)\in P_{i}\right\}$, where $\left(x_{i},y_{i}\right)$ are the coordinates of any point on path $P_{i}$ and $\left(x_{m},y_{m}\right)$ are the coordinates of POI $m$, then the maximum value contributed by user $i$ to POI $m$ is represented by

\[v_{im}=\max\left\{\left(1-\sqrt{\frac{d\left(m,P_{i}\right)}{R_{max}}}\right) r_{m},0\right\} \tag{1}\]

where $R_{max}$ represents the maximum effective coverage radius of the POI, which means that if the distance between user $i$ path $P_{i}$ and POI $m$ exceeds $R_{max}$, user $i$ will not contribute value to POI $m$. Fig. 2 shows the relationship between the user path and POI.

Formula (1) shows that the farther the user is from the POI, the lower the contribution value. Therefore, when different users pass through the same POI, the values they contribute are different. We define $\mathcal{M}_{i}=\{m\in\mathcal{M}|d\left(m,P_{i}\right)<R_{max}\}$ as the POI set that user $i$ can cover, so the value contributed by user $i$ to each POI in the $\mathcal{M}_{i}$ set can be calculated by the service provider, represented by the vector $\boldsymbol{v}_{i}=\left(v_{i1},v_{i2},...,v_{i|\mathcal{M}_{i}|}\right)$. User $i$ has an expected reward or bid that is obtained after performing a data collection task, denoted by $b_{i}$. Finally, the information submitted by the user is represented by $\theta_{i}=\left(P_{i},t_{i},b_{i}\right)$.

Because each user contributes a different value to POIs, the data value obtained by the service provider conforms to the ordered submodularity feature. We define user sequence $A=\left(a_{1},a_{2},...,a_{n}\right),\forall a_{i}\in\mathcal{N},i=1,2,...,n-1, a_{i}\prec a_{i+1}$ and simultaneously define sequence $A_{m}=\left(a_{m1},a_{m2},...\right)$ as a subsequence that can cover POI $m$ of sequence $A$. We define $dim\left(\cdot\right)$ to represent the length of a vector. Therefore, the data value obtained at each POI can be expressed as:

\[V_{m}\left(A_{m}\right)=\sum_{i=1}^{\min\left(k_{m},dim\left(A_{m}\right) \right)}\left(1-\sqrt{\frac{d\left(m,P_{i}\right)}{R_{max}}}\right)r_{m}, \forall m\in\mathcal{M} \tag{2}\]

Our goal is to maximize the revenue obtained at each POI, as follows:

\[\begin{split}\textbf{Maximize}\ \ V\left(A\right)=\sum_{m\in \mathcal{M}}V_{m}\left(A_{m}\right)\\ =\sum_{m\in\mathcal{M}}\left(\sum_{i=1}^{\min\left\{k_{m},dim \left(A_{m}\right)\right\}}\left(1-\sqrt{\frac{d\left(m,P_{i}\right)}{R_{max} }}\right)r_{m}\right)\end{split} \tag{3}\]

According to [7], $V\left(\cdot\right)$ and $V_{m}\left(\cdot\right)$ are ordered submodularity functions, and the order of the user will affect the value of the function.

Here, we give a simple example in appendix A.

### _Ordered Submodularity Properties_

**Definition 1** (**Ordered submodularity function**[7]): _A sequence function $f\left(\cdot\right)$ is ordered submodularity if for all

Fig. 2: The relationship between the user path and POI.

sequences $A$ and $B$, the following property holds for all elements $s$ and $\bar{s}$

\[f\left(A||s\right)-f\left(A\right)\geq f\left(A||s||B\right)-f\left(A||\bar{s}||B\right)\]

where $A||s$ represents adding element $s$ after sequence $A$. An ordered submodular function can be viewed as a generalization of the monotone submodular function. If we set $s=\bar{s}$, then this means

\[f\left(A||s\right)-f\left(A\right)\geq 0\]

and if we set $\bar{s}=null$, then

\[f\left(A||s\right)-f\left(A\right)\geq f\left(A||s||B\right)-f\left(A||B\right)\]

which satisfies the monotone submodular property. We give the corresponding proof in Appendix $B$

**Lemma 1** ($V_{m}\left(\cdot\right)$ is an ordered submodularity function): **Theorem 1** ($V\left(\cdot\right)$ is an ordered submodularity function): **.**__

### _Mechanism Design Preliminary_

Formula (3) does not consider the payment and service provider budget $B$, so the problem must also add corresponding constraints. Our final goal can be defined as:

**Maximize** \[V\left(A\right)=\sum_{m\in\mathcal{M}}V_{m}\left(A_{m}\right)\] (4) **s.t.** \[\sum_{i=1}^{dim\left(A\right)}p_{i}\leq B\] (5) \[p_{i}\geq b_{i},i=1,2,...,dim\left(A\right)\] (6)

(5) means that the total payment to the winners is less than the budget, and (6) indicates that the payment for each winning user is greater than her or his bid.

Formula (4) is an ideal problem model. However, in practice, users may want to gain more profits through strategic behavior, such as submitting untruthful bids or arriving later. Therefore, we must design strategy-proof mechanisms to prevent this from happening. Additionally, the mechanism must satisfy individual rationality to encourage users to participate in MCSs. To ensure that payments do not exceed the budget. Additionally, the mechanism must satisfy computational efficiency to quickly obtain the allocation and payment solution.

We use $\theta_{i}=\left(P_{i},t_{i},b_{i}\right)$ to denote the true request of user $i$ and $\theta^{\prime}_{i}=\left(P_{i},t^{\prime}_{i},b^{\prime}_{i}\right)$ to denote the declared request of user $i$. Additionally, we assume that the user may lie about her or his bid $b^{\prime}_{i}\neq b_{i}$ or arrival time $t^{\prime}_{i}>t_{i}$. This is because the user submits her or his information when arriving at the ROI, and the user cannot submit information earlier; however, the user can wait near the ROI and enter the ROI later. We do not discuss the situation where users untruthfully report path $P_{i}$ because by using GPS, the system can easily determine whether the path moved by the user is consistent with the submitted path. We use $\boldsymbol{\theta}^{\prime}=\left\{\theta^{\prime}_{1},...,\theta^{\prime}_ {N}\right\}$ to denote the declared requests of all users, $\boldsymbol{\theta}^{\prime}_{-i}=\left\{\theta^{\prime}_{1},...,\theta^{ \prime}_{i-1},\theta^{\prime}_{i+1},...,\theta^{\prime}_{N}\right\}$ to denote the declared requests of all users except user $i$, and $\boldsymbol{\theta}=\left\{\boldsymbol{\theta}^{\prime}_{-i},\theta_{i}\right\}$.

User utility is an important mechanism measure, and the user always wants to maximize her or his utility. User utility is typically expressed as a function. In a reverse-auction mechanism, user utility consists of service provider payments and user bids.

\[\begin{array}{l}u_{i}\left(\boldsymbol{\theta}\right)=u_{i}=\left\{\begin{array} []{ll}p_{i}-b_{i},&user\ i\ is\ winner\\ 0,&otherwise\end{array}\right.\\ and\\ u_{i}\left(\boldsymbol{\theta}^{\prime}\right)=u^{\prime}_{i}=\left\{\begin{array} []{ll}p^{\prime}_{i}-b_{i},&user\ i\ is\ winner\\ 0,&otherwise\end{array}\right.\end{array} \tag{7}\]

where $p^{\prime}_{i}$ is the payment when user $i$ submits the request as $\theta^{\prime}_{i}=\left(P_{i},t^{\prime}_{i},b^{\prime}_{i}\right)$. Based on the above description, we can give several important definitions of mechanism design.

**Definition 2** (**Individual rationality**): _If a mechanism ensures individual rationality, it should satisfy the condition that when the user submits a truthful request $\theta_{i}$, regardless of the requests submitted by other users, her or his utility will be greater than or equal to zero, i.e., $u_{i}\left(\boldsymbol{\theta}\right)\geq 0$. Thus, as long as the user participates in the mobile crowdsensing service and reports her or his truthful request, she or he will never incur a loss [34]._

**Definition 3** (**Monotonicity**): _In a reverse-auction mechanism, if an allocation algorithm ensures monotonicity, it should satisfy the given user request $\theta_{i}=\left(P_{i},t_{i},b_{i}\right)$; if user $i$ wins by bidding $b_{i}$, then she or he will also win by bidding $b^{\prime}_{i}<b_{i}$. If user $i$ loses by arrival time $t_{i}$, then she or he will also lose by arrival time $t^{\prime}_{i}>t_{i}$. This means that the lower the user bid, the easier it is to win, and the later the user enters the ROI, the easier it is to fail. The former conforms to the characteristics of reverse auctions, and the latter conforms to the characteristics of diminishing marginal value._

**Definition 4** (**Critical value**): _If user $i$ is the winner in the mobile crowdsensing service, then there must exist a critical value $cv_{i}$. If user $i$'s bib $b_{i}<cv_{i}$, then user $i$ also wins; otherwise, $i$ loses._

**Definition 5** (**Truthfulness**): _If a mechanism is truthful, it implies that for every user $i$, truthful declaration request $\theta_{i}$ and declaration requests $\boldsymbol{\theta}^{\prime}_{-i}$ of other users, we can obtain $u_{i}\left(\boldsymbol{\theta}^{\prime}_{-i},\theta_{i}\right)\geq u_{i}\left( \boldsymbol{\theta}^{\prime}_{-i},\theta^{\prime}_{i}\right)$, which is $u_{i}\left(\boldsymbol{\theta}\right)\geq u_{i}\left(\boldsymbol{\theta}^{ \prime}\right)$. Therefore, submitting a truthful requirement is the dominant strategy for each user [35] at any time. [36] notes that if the allocation function of a mechanism satisfies monotonicity and the payment function satisfies critical value theory, then the mechanism is truthful._

**Definition 6** (**Budget feasibility**): _If an auction mechanism is budget feasible, then the sum of the payments to all the winners must not exceed the budget limit $B$ proposed by the service provider._

**Definition 7** (**Computational efficiency**): _If an algorithm is computationally efficient, it can be executed in polynomial time because obtaining optimal solutions to general submodular problems may take exponential time.

Table I lists the notation frequently used in this paper.

### _Offline Optimal Mechanism Design_

We did not consider the user arrival order when designing the optimal mechanism. It can be assumed that all users arrive simultaneously, and the order of users is also arbitrary. This is the basic assumption of the offline problem [37]. However, [14] noted that under budget constraints, the mobile crowdsensing problem cannot be solved to the optimal solution because the optimal allocation is based on the user's bid, which is limited by the budget. However, the payment to the user will exceed the user's bid. Therefore, it may not be possible to meet the budget constraints. Therefore, in the optimal mechanism design, we did not consider the budget constraint (4.1). In terms of payment, we refer to [38] and use the Vickrey-Clarke-Groves (VCG) theory to design the user's payment price as follows.

\[p_{i}=\lambda\left(V\left(A^{*}\right)-V\left(A_{-i}^{*}\right)\right)+b_{i}\]

where $\lambda$ is the constant discount when the revenue obtained by the service provider is converted into value, $V\left(A^{*}\right)$ is the optimal revenue under the optimal user sequence, and $V\left(A_{-i}^{*}\right)$ is the optimal revenue under the optimal sequence obtained in the user set $\mathcal{N}$ expect user $i$. Because the submodular problem is NP-hard and has an exponential execution time, it cannot be solved for large-scale users. In our experiments, we designed the optimal mechanism (OPT) in this way and compared it with the RL algorithm as a benchmark. Undoubtedly, the OPT mechanism has a good effect, but it can address only the offline problem of small-scale users.

## IV Reinforcement Learning-Based Mechanism Design for Online Mobile Crowdsensing

Reinforcement learning is very suitable for solving sequential and online problems. However, when applying reinforcement learning to mechanism design, it must also consider satisfying economic characteristics such as truthfulness, individual rationality and budget feasibility. Meanwhile, the algorithm must also have a polynomial execution time, which is a major challenge addressed in this paper. Inspired by the literature [8], in this section, we design a strategy-proof mechanism based on reinforcement learning to solve ordered submodularity-based online mobile crowdsensing problems.

### _The Markov Decision Process (MDP) of the Online Mobile Crowdsensing Problem_

According to the definition in the previous section, we define the state, action, state transition function, and action-value function in the MDP of the online mobile crowdsensing problem.

**State:** We define a $d$-dimensional vector ($dim(\mathbf{s}_{i})=d$) $\mathbf{s}_{i}=\left(1,t_{i},v_{i1}^{\prime},...,v_{iM}^{\prime},b_{i},k_{1}^{ \prime},...,k_{M}^{\prime},B^{\prime}\right)$ as the full state of user $i$ arrival. We also define $s_{i}\left(j\right)$ as the $j$-th element in state $\mathbf{s}_{i}$, such as $s_{i}\left(2\right)=t_{i},s_{i}\left(3\right)=v_{i1}^{\prime}$. In practice, because the POI limits the number of coverage times if the users before user $i$ have covered POI $m$ enough times, then user $i$ will not contribute value to POI $m$. Thus, under the current user sequence $A$, the value contributed by user $i$ to POI $m$ is

\[v_{im}^{\prime}=\left\{\begin{array}{ll}v_{im},&k_{m}>dim\left(A_{m}\right),m\in\mathcal{M}_{i}\\ 0,&otherwise\end{array}\right. \tag{6}\]

, where $k_{m}^{\prime}$ is the remaining coverage times of the current POI $m$, and $B^{\prime}$ is the current remaining budget. Meanwhile, $V_{i}=\sum\limits_{m\in\mathcal{M}}v_{im}^{\prime}$ can be used to represent the marginal value contributed by adding user $i$ to current user sequence $A$ at this time. Therefore, we also define a simplified version of the state as $\mathbf{s}_{i}=\left(1,t_{i},V_{i},b_{i},k_{1}^{\prime},...,k_{M}^{\prime},B^{ \prime}\right)$, which can reduce the state space complexity. In the experimental section, we analyze the impact of the full and simple states on the algorithm.

**Action:** We define the action space $a=\left\{0,1\right\}$, where 1 denotes accept, and 0 denotes reject the user.

**State transition function:** We define $p\left(s_{i+1}|s_{i},a\right)$ as the state transition function, which indicates the probability distribution of transitioning to different next states under $s_{i},a$. However, we cannot obtain the real transition probability in training, so we use Monte Carlo sampling to realize it in the algorithm.

**Action-Value Function:**

\[Q\left(s_{i},a\right)=aV_{i}+\sum\limits_{s_{i+1}}p\left(s_{i+1}|s_{i},a \right)Q\left(s_{i+1},\pi\left(s_{i+1}\right)\right) \tag{7}\]It can be understood that $Q\left(s_{i},a\right)$ is the expectation value obtained in the future (the value obtained from step $i$ to the future) under state $s_{i}$ and action $a$. $aV_{i}$ indicates that if user $i$ is accepted $\left(a=1\right)$, then the marginal value $V_{i}$ of user $i$ can be obtained by the service provider immediately. No revenue can be obtained if user $i$ is rejected $\left(a=0\right)$. $p\left(s_{i+1}|s_{i},a\right)$ represents the probability of executing action $a$ under the $s_{i}$ state and transferring to state $s_{i+1}$. Note that many possible $s_{i+1}$ states exist. Thus, $\sum\limits_{s_{i+1}}p\left(s_{i+1}|s_{i},a\right)Q\left(s_{i+1},\pi\left(s_{i +1}\right)\right)$ represents the expectation value obtained from step $i+1$ in the future. In the algorithm, we use the temporal-difference (TD) strategy to update the action-value function.

Because the state space is very large, the action-value cannot be stored in a table, and we use the linear function $q\left(\mathbf{s}_{i},a,\mathbf{w}_{a}\right)=\mathbf{w}_{a}\mathbf{s}_{i}^{\top}=\sum\limits _{j=1}^{d}w_{a_{j}}s_{i}\left(j\right)$ to fit the action-value function. $\mathbf{w}_{a}$ is the weight vector with the same dimension as $\mathbf{s}_{i}$, and $\mathbf{w}_{a}$ is the parameter that must be trained in the algorithm. Note that since there are two actions, this corresponds to two value functions, $q\left(\mathbf{s}_{i},1,\mathbf{w}_{1}\right)=\mathbf{w}_{1}\mathbf{s}_{i}^{\top}$ (abbreviated as $q_{1}$) and $q\left(\mathbf{s}_{i},0,\mathbf{w}_{0}\right)=\mathbf{w}_{0}\mathbf{s}_{i}^{\top}$ (abbreviated as $q_{0}$). In the allocation part, if $q_{1}\geq q_{0}$, the user is accepted; otherwise, the user is rejected.

### _Strategy-Proof Design in Reinforcement Learning_

Definition 5 states that if a mechanism is truthful, it must have a monotonicity allocation function, and its payment algorithm is based on critical value theory. However, in reinforcement learning, simply using the action-value function to judge whether to accept or reject a user cannot satisfy monotonicity. Meanwhile, critical value theory requires the user's bid to have a clear relationship with whether she or he is accepted.

In the state $\mathbf{s}_{i}=\left(1,t_{i},v_{i1}^{\prime},...,v_{iM}^{\prime},b_{i},k_{1}^{ \prime},...,k_{M}^{\prime},B^{\prime}\right)$, there are many features with real meaning. However, the parameters that users can manipulate are only $t_{i}$ and $b_{i}$. For example, assume that user $i$ is accepted when the bid is $b_{i}$, which means that accepting this user can lead to greater revenue in the future; that is, $\mathbf{w}_{1}\mathbf{s}_{i}^{\top}>\mathbf{w}_{0}\mathbf{s}_{i}^{\top}$. However, if the user raises his bid to $b_{i}^{\prime}>b_{i}$, $\mathbf{w}_{1}\mathbf{s}_{i}^{\top}>\mathbf{w}_{0}\mathbf{s}_{i}^{\top}$ can still be satisfied, which is contrary to common sense. In the reverse-auction mechanism, if the user raises his bid, she or he may fail. To ensure the monotonicity of the allocation, we need to adjust the weights $\mathbf{w}_{1}$ and $\mathbf{w}_{0}$. Similarly, $t_{i}$ represents the time when the user arrives, assuming that the user arrives in the system when $t_{i}^{\prime}>t_{i}$, because of the diminishing marginal value, her or his payment may be reduced; meanwhile, the probability of the user being accepted will decrease. Thus, when using the linear function $q\left(\mathbf{s}_{i},a,\mathbf{w}_{a}\right)$ to describe the value, if the user arrives later $t_{i}^{\prime}>t_{i}$ or raises her or his bid $b_{i}^{\prime}>b_{i}$, the probability of a user being rejected should increase.

**Definition $8$ (The strategy feature)**:_

Refers to those features that users can manipulate strategically in state $\mathbf{s}_{i}$. We define $\mathcal{D}=\left\{t_{i},b_{i}\right\}$ as the set of strategy features.

The strategy feature is an important guarantee for realizing the monotonicity of the allocation algorithm. Different from the literature [8], the strategy features we defined include only $t_{i},b_{i}$, which prevents a wide range of weight exchanges and can achieve better results, which has been verified in experiments. Therefore, after we obtain new weights $\mathbf{w}_{a}$ at the end of each training round, we update the parameters $w_{a,k}$, as follows.

\[w_{a,k}=\left\{\begin{array}{ll}\min\left(w_{a,k}^{\prime},w_{1-a,k}^{ \prime}\right),&if\left(\left(a=1\right)\ and\ k\in\mathcal{D}\right)\\ \max\left(w_{a,k}^{\prime},w_{1-a,k}^{\prime}\right),&if\left(\left(a=0\right) \ and\ k\in\mathcal{D}\right)\\ w_{a,k}^{\prime},&otherwise\end{array}\right. \tag{8}\]

**Definition $9$ (Equilibrium price)**:_

When user $i$ is accepted, if the user bid is the equilibrium price $ep_{i}$, we can take $q\left(\mathbf{s}_{i},1,\mathbf{w}_{1}\right)=q\left(\mathbf{s}_{i},0,\mathbf{w}_{0}\right)$. According to formula (8), when the user's bid is higher than the equilibrium price, it will be rejected, and if it is lower than the equilibrium price, it will be accepted. Therefore, when $q\left(\mathbf{s}_{i},1,\mathbf{w}_{1}\right)=q\left(\mathbf{s}_{i},0,\mathbf{w}_{0}\right)$, it can be seen that

\[\sum\limits_{j=1,s_{i}\left(j\right)\neq b_{i}}^{d}w_{1j}s_{i}\left(j\right)+w _{1b_{i}}ep_{i}=\sum\limits_{j=1,s_{i}\left(j\right)\neq b_{i}}^{d}w_{0j}s_{i} \left(j\right)+w_{0b_{i}}ep_{i}\]

We can obtain

\[ep_{i}=\left\{\begin{array}{ll}\frac{\sum\limits_{j=1,s_{i}\left(j\right)\neq b _{i}}^{d}w_{1j}s_{i}\left(j\right)-\sum\limits_{j=1,s_{i}\left(j\right)\neq b _{i}}^{d}w_{0j}s_{i}\left(j\right)}{\left(w_{0b_{i}}-w_{1b_{i}}\right)},&w_{0b _{i}}=w_{1b_{i}}\\ +\infty,&w_{0b_{i}}\neq w_{1b_{i}}\end{array}\right. \tag{9}\]

A special case at this time is that $w_{0b_{i}}=w_{1b_{i}}$, which means that the user's bid cannot affect the judgment of whether to accept the user. At this time, the equilibrium price is $+\infty$. The equilibrium price is an important guarantee for the payment algorithm to satisfy the critical value theory.

We also define the user payment threshold as $B\frac{V_{i}}{V_{max}}$, which can be understood as the product of the user's marginal value ratio and the budget, where $V_{i}=V\left(A||i\right)-V\left(A\right)$ is the marginal value of user $i$ under current user sequence $A$, and $V_{max}=\sum\limits_{m\in\mathcal{M}}k_{m}r_{m}$ is the maximum revenue that the service provider can theoretically obtain. In the payment algorithm, if the user's bid exceeds this threshold, the user's cost performance is low and cannot generate more revenue for service providers. Finally, the user's payment is determined by the minimum value of the threshold and the equilibrium price; that is,

\[p_{i}=\min\left\{B\frac{V_{i}}{V_{max}},ep_{i}\right\} \tag{10}\]

and such a design can satisfy the critical value theory.

### _Reinforcement Learning-Based Online Mobile Crowdsensing Mechanism (RL-OMC)_

In this section, we introduce RL-OMC in detail. As shown in Fig. 3, the entire mechanism runs on a reinforcement learning framework. When a new user arrives, the user information is obtained and combined with the current service provider information to form a state $\mathbf{s}_{i}$. After two linear action-value function fittings, a decision $\pi_{i}$ is finally made. According to the decision, the action is output to the environment, and the environment gives the corresponding reward (if the user is accepted, the reward is the marginal value of user $V_{i}$; if the user is rejected, the reward is 0).

```
0:$\mathbf{w}_{0},\mathbf{w}_{1},\theta_{i},\mathcal{M},B,B^{\prime},A,\mathcal{P}$
0:$A,\mathcal{P}$
1:Obtain the margin value of $i$ on each POI, $(v^{\prime}_{i1},...,v^{\prime}_{iM})$ and $V_{i}=\sum\limits_{m\in\mathcal{M}}v^{\prime}_{im}$
2:Construct state $\mathbf{s}_{i}=(1,t_{i},v^{\prime}_{i1},...,v^{\prime}_{iM},b_{i},k^{\prime}_{1},...,k^{\prime}_{M},B^{\prime})$
3:if$b_{i}>B\frac{V_{i}}{V_{max}}$then
4:return no change
5:endif
6:$q_{0},q_{1}\leftarrow\mathbf{w}_{0}\mathbf{s}_{i}^{\top},\mathbf{w}_{1}\mathbf{s}_{i}^{\top}$
7:if$q_{0}\leq q_{1}$then
8:if$w_{0b_{i}}\neq w_{1b_{i}}$then
9:$p_{i}\leftarrow\min\left\{B\frac{V_{i}}{V_{max}},ep_{i}\right\}$
10:else
11:$p_{i}=B\frac{V_{i}}{V_{max}}$
12:endif
13:$A\gets A||i,\mathcal{P}\leftarrow\mathcal{P}\cup\left\{p_{i}\right\},B^ {\prime}\gets B^{\prime}-p_{i}$
14:endif
15:endif
16:return$A,\mathcal{P}$
```

**Algorithm 1** RL-OMC-Predict

Algorithm 1 is the prediction algorithm of RL-OMC. This algorithm is invoked when a new user arrives. The input of the algorithm has the already trained weight $\mathbf{w}_{0},\mathbf{w}_{1}$, user and system information $\theta_{i},\mathcal{M},B$, and $B^{\prime}$ is the current remaining budget. Output $A,P$ is the current winning user sequence and payment solution. Lines 1-2 calculate the current marginal value of the user and construct the state $\mathbf{s}_{i}$. Lines 3-5 indicate that if the user's bid $b_{i}$ is greater than the current marginal value threshold $B\frac{V_{i}}{V_{max}}$, it will not be considered. This is mainly to ensure that more valuable users will be accepted later. Lines 6-12 are the allocation and payment process. Line 13 updates the current allocation sequence and payment for output.

```
0:$\mathbf{\theta},\alpha,\epsilon,l$
0:$\mathbf{w}_{0},\mathbf{w}_{1}$
1:$\mathbf{w}_{0}\leftarrow(0,...,0)$
2:$\mathbf{w}_{1}\leftarrow(0,...,0)$
3:for each episode do
4:$B^{\prime}=B,k^{\prime}_{im}=k_{im},\forall m\in\mathcal{M}$
5:for$i=1$ to $T$do
6: Get next user info $\theta_{i}$
7: Obtain the margin value of $i$ on each POI, $(v^{\prime}_{i1},...,v^{\prime}_{iM})$ and $V_{i}=\sum\limits_{m\in\mathcal{M}}v^{\prime}_{im}$
8: Construction $\mathbf{s}_{i}=(1,t_{i},v^{\prime}_{i1},...,v^{\prime}_{iM},b_{i},k^{\prime}_{1},...,k^{\prime}_{M},B^{\prime})$
9: Get random number $\lambda\in[0,1]$
10:if$b_{i}>B\frac{V_{i}}{V_{max}}$then
11:continue
12:endif
13:if$\lambda<\frac{\epsilon}{2}$then
14:$\pi_{i},p_{i},v_{i}\gets 0,0,0$
15:elseif$\lambda<\epsilon$then
16:$\pi_{i},p_{i},v_{i}\gets 1,B\frac{V_{i}}{V_{max}},V_{i}$
17:$A\gets A||i$
18:else
19:$q_{0},q_{1}\leftarrow\mathbf{w}_{0}\mathbf{s}_{i}^{\top},\mathbf{w}_{1}\mathbf{s}_{i}^{\top}$
20:if$q_{0}\leq q_{1}$then
21:if$w_{0b_{i}}\neq w_{1b_{i}}$then
22:$\pi_{i},p_{i},v_{i}\gets 1,\min\left\{B\frac{V_{i}}{V_{max}},ep_{i} \right\},V_{i}$
23:else
24:$\pi_{i},p_{i},v_{i}\gets 1,B\frac{V_{i}}{V_{max}},V_{i}$
25:endif
26:$A\gets A||i$
27:else
28:$\pi_{i},p_{i},v_{i}\gets 0,0,0$
29:endif
30:endif
31:if$i\geq 1$then
32: Record $(\mathbf{s}_{i-1},\pi_{i-1},r_{i-1},\mathbf{s}_{i},\pi_{i})$ to history $\mathbf{h}$
33: UpdateWeight $(\mathbf{w}_{0},\mathbf{w}_{1},\alpha,l)$
34:endif
35: Update $k^{\prime}_{1},...,k^{\prime}_{M}$
36:$B^{\prime}\gets B^{\prime}-p_{i}$
37:endfor
38: Record $(\mathbf{s}_{T},\pi_{T},r_{T},0,0)$ to history $\mathbf{h}$
39: UpdateWeight $(\mathbf{w}_{0},\mathbf{w}_{1},\alpha,l)$
40: According to the episode update $\epsilon$ from 0.5 to 0.1
41:endfor
42:return$\mathbf{w}_{0},\mathbf{w}_{1}$
```

**Algorithm 2** RL-OMC-Training

Algorithm 2 is the training algorithm of RL-OMC. The training relies on the existing data set and uses the SARSA method. The purpose of training is to make the model achieve higher revenue under budget constraints. Therefore, we use TD learning, experience replay, variable random sampling and other strategies. Additionally, the algorithm uses weight

Fig. 3: Reinforcement learning framework for online MCS.

exchange (satisfying definition 3) and critical value payment (satisfying definition 4) to achieve the strategy-proof goal of the mechanism. The algorithm initializes the weights $\mathbf{w}_{0},\mathbf{w}_{1}$ of the action-value function to a 0-vector at lines 1-2 and then enters multiple episode iterations. In each training episode, user information is read sequentially according to the time sequence, calculating the marginal value and constructing the current state for training. Lines 10-11 indicate that the user is rejected if the current user's bid is higher than its marginal value ratio threshold. Otherwise, through $\epsilon$ random sampling, the Monte Carlo approximation training process is completed. Lines 18-34 enter the normal decision-making process. According to the current weight value, the action-value expectation is calculated. If $q_{0}\leq q_{1},$ the user is accepted; otherwise, the user is rejected, and $(\mathbf{s}_{i-1},\pi_{i-1},r_{i-1},\mathbf{s}_{i},\pi_{i})$ is recorded in the historical experience according to the SARSA method. Lines 35-36 update the remaining POI coverage times and budget for the user's next state calculation. In line 33, the weights are updated using experience replay after each decision. In the algorithm, we adopt the variable random sampling method. Initially, $\epsilon$ is relatively large (such as 0.5), allowing the training algorithm to explore more and gain enough experience. We update $\epsilon$ as the episode increases and make it smaller. At the end of the episode, the weight stabilizes, and at this time, $\epsilon$ is relatively small (such as 0.1).

```
0:$\mathbf{w}_{0},\mathbf{w}_{1},\alpha,l$
0:$\mathbf{w}_{0},\mathbf{w}_{1}$
1:if$|\mathbf{h}|>l$then
2: Remove oldest record
3:endif
4: Randomly select record $(\mathbf{s}_{j},\pi_{j},v_{j},\mathbf{s}_{j+1},\pi_{j+1})$ from $\mathbf{h}$
5:if$\mathbf{s}_{j+1}=0$then
6:$\Delta q=v_{j}-\mathbf{w}_{\pi_{j}}s_{j}^{\top}$
7:else
8:$\Delta q=v_{j}+\mathbf{w}_{\pi_{j+1}}s_{j+1}^{\top}-\mathbf{w}_{\pi_{j}}s_{j}^{\top}$
9:endif
10:$\mathbf{w}_{\pi_{j}}\leftarrow\mathbf{w}_{\pi_{j}}+\alpha\Delta q\mathbf{s}_{j}$
11:if$k\in\mathcal{D}$then
12:if$a=1$then
13:$w_{a,k}=\min\left(w^{\prime}_{a,k},w^{\prime}_{1-a,k}\right)$
14:elseif$a=0$then
15:$w_{a,k}=\max\left(w^{\prime}_{a,k},w^{\prime}_{1-a,k}\right)$
16:else
17:$w_{a,k}=w^{\prime}_{a,k}$
18:endif
19:endif
20:endif
21:return$\mathbf{w}_{0},\mathbf{w}_{1}$
```

**Algorithm 3** UpdateWeight

Algorithm 3 is a subalgorithm for updating weights in Algorithm 2. Lines 1-4 use the first-in first-out (FIFO) strategy to update the historical records and then randomly select a historical record to update the weight using the TD strategy in lines 5-10. Additionally, we replace the strategy features according to formula (8) in lines 11-19 to satisfy the monotonicity of the mechanism.

### _Property of RL-OMC_

In this section, we prove the economic properties of the mechanisms, such as truthfulness, individual rationality, and budget feasibility, including computational efficiency. It is worth noting that the properties of the mechanism are satisfied in both the training and prediction algorithms. See Appendix $B$ for a detail description.

**Lemma 2** (**The RL-OMC is monotonicity**):

**Lemma 3** (**RL-OMC** satisfies the critical value theory**):

**Theorem 2** (**The RL-OMC** is truthfulness**):

**Lemma 4** (**When the user is accepted, $p_{i}\geq b_{i}$):

**Theorem 3** (**RL-OMC** satisfies individual rationality):

**Theorem 4** (**RL-OMC** satisfies budget feasibility):

**Theorem 5** (**RL-OMC** satisfies computational efficiency):

## V Numerical Results

This paper compares the RL-OMC with the optimal solution, two-sided mobile crowdsensing market (TDMC) [4] and the Full SP-RL [8]. The TDMC is an efficient and easy-to-implement online algorithm that puts the budget into the market in multiple stages based on the greedy method and simultaneously satisfies the economic characteristics of truthfulness, individual rationality, and budget feasibility. Full SP-RL is a reinforcement learning algorithm that satisfies the monotonicity of task allocation by replacing the weight of the neural network. When implementing Full SP-RL, we use $\{v^{\prime}_{i1},...,v^{\prime}_{iM},k^{\prime}_{1},...,k^{\prime}_{M},B^{ \prime}\}$ in the state as a monotonically increasing feature $\mathcal{I}\left(f\right)$ and $\{t_{i},b_{i}\}$ as a monotonically decreasing feature $\mathcal{D}\left(f\right)$. It is worth noting that Full SP-RL has many replacement operations when updating weights every time, which affects its convergence efficiency. In terms of budget feasibility and payment, Full SP-RL uses the same strategy as RL-OMC, making it suitable for online mobile crowdsensing task allocation problems. We implement two RL-OMC mechanisms, RL-OMC-Full and RL-OMC-Simple, corresponding to RL-OMC with full state $\mathbf{s}_{i}=(1,t_{i},v^{\prime}_{i1},...,v^{\prime}_{iM},b_{i},k^{\prime}_{1},..., k^{\prime}_{M},B^{\prime})$ and simple state $\mathbf{s}_{i}=(1,t_{i},V_{i},b_{i},k^{\prime}_{1},...,k^{\prime}_{M},B^{\prime})$, respectively. In experiments, they show large differences. We conduct six experiments on the optimal solution comparison, user scale, budget scale, $R_{max}$ scale and algorithm convergence and prediction. The results show that the RL-OMC outperforms the existing methods.

Fig. 4: Relationship between real maps and POI coverage 

### _Experimental Settings_

1. We set POIs based on the real city map shown in Fig. 4(a) (the ROI is located approximately $3\times 2.5=7.5$$km^{2}$ within the red boundary), and we generate 750 POIs for the ROI in the form of a matrix (Fig. 4(b)). The distance between two adjacent POIs is approximately 100 meters. We set the maximum value that can be provided to the MCS provider by covering a POI once to 30, that is, $r_{m}=30$, and set one unit of $R_{max}$ to 100 meters.
2. We spent a week counting the main activity areas and activity levels of people in the ROI. More coverage times are needed for some major roads and buildings to collect enough data for effective analysis. According to the above information, we set different coverage times for POIs; the maximum number of coverages required is 5, and the minimum required is 1; that is, $k_{m}\in\{1,2,3,4,5\}$. The sum of the required coverage times for all POIs in the map is 1241, so $V_{max}=1241\times 30=37,230$ can be calculated. Fig. 4(b) shows the POI coverage heatmap. Combined with Fig. 4(a), we can see the main activity range and activity levels of people.
3. We tracked and counted the main moving paths of the vehicles in the ROI and counted 730 vehicle moving paths, covering the main roads in the ROI.
4. We randomly generated information for 5,000 users. Each user path was randomly selected from 730 moving paths. User bids were generated according to the normal distribution of the value generated by the POI covered by the user path. We used 4,000 users' information as a training set and 1,000 as a test set.
5. To eliminate randomness, we tested each indicator in the experiment 50 times. Data were randomly selected from the test set each time, and the average value is shown in the figure. All algorithms used the same data in the same experiment.
6. When training the RL-OMC-Full, RL-OMC-Simple and Full SP-RL model parameters, we set the learning rate $\alpha=0.001$, and the size of the experience playback array (historical records) is 1,000.
7. We use the Full SP-RL algorithm and the TDMC algorithm as the comparison algorithms of our algorithm. To make the TDMC algorithm applicable to our problem, we set that when the user arrives, the TDMC will immediately accept or reject the user instead of making the user wait. The parameter setting in the TDMC algorithm is consistent with the original article, which ensures that the TDMC algorithm has good results.

### _Experimental Results_

#### Iv-B1 Comparison with Optimal Solution

In this experiment, we compared the two algorithms proposed in this paper with the optimal solution. The number of users is within the range 2-7, the service provider budget is set to 5,000, and $R_{max}$ is set to 3.1. Because the OPT algorithm has an exponential running time, the user scale is very small. According to Section III-D, the OPT algorithm does not consider budget constraints and user arrival order. It can be seen in Fig. 5(a) that RL-OMC-Full shows a very good effect, reaching $90\%$ of the total revenue of the static OPT algorithm, which is due to the state of the RL-OMC-Full algorithm considering more features, and the prediction is more accurate. RL-OMC-Simple has a lower revenue, indicating that the prediction of RL-OMC-Simple rejected more users, which can also be seen from Fig. 5(c). Fig. 5(b) shows the payment of the three algorithms. The OPT algorithm uses the VCG to calculate the payment, and the payment is the highest, while the payment of our two algorithms depends on the marginal value ratio, and the payment is lower. Fig. 5(c) reflects the number of winning users. Because OPT has no budget limit, all users are accepted. After taking the average of multiple tests, RL-OMC-Full and RL-OMC-Simple rejected some users. Fig. 5(d) reflects the running time of the three algorithms. OPT has an exponential running time. When there are 7 users, the running time reaches approximately 1,000 s. Therefore, in practice, we need more efficient algorithms.

#### Iv-B2 Impact of the user scale

In this experiment, the number of users starts at 100 and gradually increases to 500 in steps of 100, the service provider budget is set to 5,000, and $R_{max}$ is set to 3.1. The experimental results are shown in Fig. 6. Fig. 6(a) shows the changes in the total revenue of the four algorithms. As the number of users increases, the total revenue gradually increases, conforming to the law of diminishing marginal value. This is because these algorithms use submodular functions when calculating revenue. Both the RL-OMC-Simple and RL-OMC-Full algorithms proposed in this paper have achieved good results. They can reject users in the early stage and reserve space for more valuable users who arrive later. Full SP-RL performs a large number of weight replacements, so the prediction effect is not good. Even if the user scale increases, the increase in revenue is not obvious. The TDMC is based on a multistage greedy method and allocates users according to the threshold and remaining budgets. Users who enter in the early stage will consume most of the POI coverage times, resulting in users who enter later not increasing revenue, so the effect is not ideal. Fig. 6(b) shows the difference in the payment of the four algorithms. Although the payment calculation principles of the four algorithms are all based on the user marginal utility ratio, TDMC has the highest payment because it calculates the marginal utility in multiple stages. The other three algorithms use $\min\left\{B\frac{V_{i}}{V_{max}},ep_{i}\right\}$ to calculate the payment price, so the payment is not high. Fig. 6(c) shows the number of winning users. With the increase in user scale, the number of winning users of the four algorithms does not change much, and they are all approximately 20-25. This shows that in our preset ROI area, only 20 users can make the service provider obtain enoughrevenue, which has much to do with the number of POIs and coverage times. It is worth noting that the number of winners does not change much after more than 200 users, but there are more users to choose from, so it can lead to more revenue.

#### V-B3 Impact of the budget

In this experiment, the budget starts at 2,000 and gradually increases to 8,000 in steps of 1,000, the user scale is set to 500, and $R_{max}$ is set to 3.1. Fig. 7(a) reflects the changes in the total revenue of the four algorithms. RL-OMC-Simple performs better when the budget is low because RL-OMC-Simple considers only the overall marginal value of users, so the prediction standard is relatively loose. RL-OMC-Full is more cautious in prediction because it considers the respective contribution value of users on each POI and rejects many users with potential value when the budget is low. However, as the budget grows, the total revenue of RL-OMC-Full rises quickly. Second, as the budget increases, as a necessary condition for user allocation, $B\frac{V_{i}}{V_{max}}$ becomes larger, so more users can be selected, which can also be proven from Fig. 7(c). After the budget exceeds 6,000, the revenue of RL-OMC-Simple and RL-OMC-Full remains unchanged. This is because the prediction effect of reinforcement learning on users is obvious, and the set of selected winning users has basically stabilized. Continuing to increase the budget will increase only the payment but cannot achieve better revenue. Fig. 7(b) shows that the payment of the four algorithms increases linearly with the increase in the budget. This is because the four algorithms all use the user's marginal value ratio as the basis for payment. When the budget changes linearly, the user's marginal value ratio has not changed much. Similar to the previous experiment, TDMC has the highest payment. This experiment provides an idea for service providers to set a reasonable budget.

Fig. 5: Comparison with Optimal Solution

Fig. 6: Impact of the user scale

Fig. 7: Impact of the budget 

#### V-B4 Impact of the $R_{max}$

In this experiment, we intend to find a reasonable coverage radius by changing the value of $R_{max}$. $R_{max}$ starts at 1 unit and gradually increases to 5 units in steps of 0.2, where the unit number represents the closest straight-line distance between two adjacent POIs (1 unit =100 meters in practice), the user scale is set to 500, and the budget is set to 5,000. Fig. 8(a) shows that the total revenue of the four algorithms shows a wave-shaped decreasing trend. This is because when $R_{max}$ is within the range of (1, 1.4), the user's POI coverage is basically unchanged. According to formula (1), the data value contribution of the user is $v_{im}=\max\left\{\left(1-\sqrt{\frac{d(m,P_{j})}{R_{max}}}\right)r_{m},0\right\}$, so when $R_{max}$ gradually increases, the value of $v_{im}$ will also increase. When $R_{max}$ is greater than 1.4, the user can cover more POIs at this time and can generate a greater value, reaching the maximum value when $R_{max}=1.8$. However, when $R_{max}$ is greater than 1.8, the revenue will drop to a lower level. This is because the arriving users in the early stage cover too many POIs but contribute less value to POIs that are farther away and consume the number of POI coverages, which makes the latter reach users unable to bring more revenue to the service provider. The following waveshape principles are similar. Fig. 9 shows an example of the relationship between a user location and POI. When $R_{max}$ is within the range of $\left(1,\sqrt{2}\right)$, the user can cover 4 POIs, and when $R_{max}$ is greater than $\sqrt{2}$, the user can cover 8 POIs, but the value contributing to farther POIs is lower.

Generally, with the gradual increase in $R_{max}$, the total revenue gradually decreases in fluctuations, which shows that an excessively large $R_{max}$ cannot bring greater revenue to service providers. Users who arrive earlier will consume the POI coverage times prematurely. Therefore, a delicate balance exists between the value of $R_{max}$ and the distance between POIs. This can also be seen from Fig. 8(c); when $R_{max}$ increases, the number of winners decreases. Fig. 8(b) shows that the payment of the four algorithms is basically maintained at a uniform level, but affected by $R_{max}$, there are some fluctuations. Among the four algorithms, the effect of RL-OMC is still the best.

#### V-B5 The convergence of RL algorithms

We compared the convergence of the three reinforcement learning loss functions used in the experiment. To ensure the allocation monotonicity, the three algorithms adopt the weight replacement method, so the loss fluctuation is very large, but they can eventually converge. In Fig. 10(b), it can be seen that RL-OMC-Simple has the fastest convergence speed and can produce a better model when the number of training iterations is 1,000. This is because the number of state parameters of RL-OMC-Simple is only half of the state parameters of the other two algorithms, so the training process is faster. RL-OMC-Full and Full SP-RL use the same state parameters, so the convergence speed is similar. In the actual training process, Full SP-RL must iterate approximately 5,000 times to produce a better model, while RL-OMC-Full can already make good predictions when iterated 4,000 times. This shows that RL-OMC requires less training time than Full SP-RL.

#### V-B6 User Prediction

In a 100-user scale experiment, we tested how well the RL-OMC predicted users, where the horizontal axis coordinates represent each user who enters sequentially. It can be seen in Fig. 11(b) that RL-OMC-Simple accepts more users in the early stage. This is because the state parameters of RL-OMC-Simple include only the marginal value of users, while RL-OMC-Full includes the data value of users to each POI, and the user's choice is more scattered than RL-OMC-Simple. It is worth noting that the users selected by the two algorithms are quite different, showing that the two algorithms have different tendencies when selecting users. As seen from the previous experiments, the prediction of RL-OMC-Full will be more accurate, which can create more revenue for service providers.

## VI Conclusion

This paper considers the distance between the user's location and the POI in the data value model and uses the ordered

Fig. 8: Impact of the $R_{max}$

Fig. 9: The relationship between a user location and POI.

[MISSING_PAGE_FAIL:13]

* [15] N. Anari, G. Goel, and A. Nikzad, "Mechanism design for crowdsourcing: An optimal 1-1/e competitive budget-feasible mechanism for large markets," in _2014 IEEE 55th Annual Symposium on Foundations of Computer Science_, 2014, pp. 266-275.
* [16] J. Hu, K. Yang, K. Wang, and K. Zhang, "A blockchain-based reward mechanism for mobile crowdsensing," _IEEE Transactions on Computational Social Systems_, vol. 7, no. 1, pp. 178-191, 2020.
* [17] K. Han, H. Liu, S. Tang, M. Xiao, and J. Luo, "Differentially private mechanisms for budget limited mobile crowdsourcing," _IEEE Transactions on Mobile Computing_, vol. 18, no. 4, pp. 934-946, 2019.
* [18] Y. Wang, Z. Cai, Z.-H. Zhan, Y.-J. Gong, and X. Tong, "An optimization and auction-based incentive mechanism to maximize social welfare for mobile crowdsourcing," _IEEE Transactions on Computational Social Systems_, vol. 6, no. 3, pp. 414-429, 2019.
* [19] E. Wang, H. Wang, Y. Yang, and W. Liu, "Truthful incentive mechanism for budget-constrained online user selection in mobile crowdsensing," _IEEE Transactions on Mobile Computing_, vol. 21, no. 12, pp. 4642-4655, 2022.
* [20] G. Li and J. Cai, "An online incentive mechanism for crowdsensing with random task arrivals," _IEEE Internet of Things Journal_, vol. 7, no. 4, pp. 2982-2995, 2020.
* [21] J. Chen, H. Xing, Z. Xiao, L. Xu, and T. Tao, "A ddf agent for jointly optimizing computation offloading and resource allocation in mec," _IEEE Internet of Things Journal_, vol. 8, no. 24, pp. 17 508-17 524, 2021.
* [22] T. Liu, Y. Zhang, Y. Zhu, W. Tong, and Y. Yang, "Online computation offloading and resource scheduling in mobile-edge computing," _IEEE Internet of Things Journal_, vol. 8, no. 8, pp. 6649-6664, 2021.
* [23] P. Mishra and A. Moustafa, "Reinforcement learning based monotonic policy for online resource allocation," _Future Generation Computer Systems_, vol. 138, pp. 313-327, 2023. [Online]. Available: [https://www.sciencedirect.com/science/article/pii/S0167739X21003691](https://www.sciencedirect.com/science/article/pii/S0167739X21003691)
* [24] L. Xiao, Y. Li, G. Han, H. Dai, and H. V. Poor, "A secure mobile crowdsensing game with deep reinforcement learning," _IEEE Transactions on Information Forensics and Security_, vol. 13, no. 1, pp. 35-47, 2018.
* [25] C. H. Liu, Z. Chen, and Y. Zhan, "Energy-efficient distributed mobile crowd sensing: A deep learning approach," _IEEE Journal on Selected Areas in Communications_, vol. 37, no. 6, pp. 1262-1276, 2019.
* [26] Y. Zhan, C. H. Liu, Y. Zhao, J. Zhang, and J. Tang, "Free market of multi-leader multi-follower mobile crowdsensing: An incentive mechanism design by deep reinforcement learning," _IEEE Transactions on Mobile Computing_, vol. 19, no. 10, pp. 2316-2329, 2020.
* [27] B. Gu, X. Yang, Z. Lin, W. Hu, M. Alazab, and R. Kharel, "Multiagent actor-critic network-based incentive mechanism for mobile crowdsensing in industrial systems," _IEEE Transactions on Industrial Informatics_, vol. 17, no. 9, pp. 6182-6191, 2021.
* [28] Y. Zhao and C. H. Liu, "Social-aware incentive mechanism for vehicular crowdsensing by deep reinforcement learning," _IEEE Transactions on Intelligent Transportation Systems_, vol. 22, no. 4, pp. 2314-2325, 2021.
* [29] Y. Liu, H. Wang, M. Peng, J. Guan, and Y. Wang, "An incentive mechanism for privacy-preserving crowdsensing via deep reinforcement learning," _IEEE Internet of Things Journal_, vol. 8, no. 10, pp. 8616-8631, 2021.
* [30] S. Dobzinski, N. Nisan, and M. Schapira, "Approximation algorithms for combinatorial auctions with complement-free bidders," _Mathematics of Operations Research_, vol. 35, no. 1, pp. 1-13, 2010. [Online]. Available: [https://doi.org/10.1287/moor.1090.0436](https://doi.org/10.1287/moor.1090.0436)
* [31] S. Assadi and S. Singla, "Improved truthful mechanisms for combinatorial auctions with submodular bidders," in _2019 IEEE 60th Annual Symposium on Foundations of Computer Science (FOCS)_, 2019, pp. 233-248.
* [32] Z. Zhang, E. K. P. Chong, A. Pezeszhi, and W. Moran, "String submodular functions with curvature constraints," _IEEE Transactions on Automatic Control_, vol. 61, no. 3, pp. 601-616, 2016.
* [33] C. Qian, D.-X. Liu, C. Feng, and K. Tang, "Multi-objective evolutionary algorithms are generally good: Maximizing monotone submodular functions over sequences," _Theoretical Computer Science_, vol. 943, pp. 241-266, 2023. [Online]. Available: [https://www.sciencedirect.com/science/article/pii/S0034397522007332](https://www.sciencedirect.com/science/article/pii/S0034397522007332)
* [34] J. Zhang, N. Xie, X. Zhang, and W. Li, "An online auction mechanism for cloud computing resource allocation and pricing based on user evaluation and cost," _Future Generation Computer Systems_, vol. 89, pp. 286-299, 2018. [Online]. Available: [https://www.sciencedirect.com/science/article/pii/S0167739X173717983](https://www.sciencedirect.com/science/article/pii/S0167739X173717983)
* [35] R. B. Myerson, "Optimal auction design," _Mathematics of Operations Research_, vol. 6, no. 1, pp. 58-73, 1981. [Online]. Available: [https://doi.org/10.1287/moor.6.1.58](https://doi.org/10.1287/moor.6.1.58)
* [36] A. Mu'alem and N. Nisan, "Truthful approximation mechanisms for restricted combinatorial auctions," _Games and Economic Behavior_, vol. 64, no. 2, pp. 612-631, 2008, special Issue in Honor of Michael B. Maschler. [Online]. Available: [https://www.sciencedirect.com/science/article/pii/S0898928560800050X](https://www.sciencedirect.com/science/article/pii/S0898928560800050X)
* [37] M. M. Nejad, L. Mashayekhy, and D. Grosu, "Truthful greedy mechanisms for dynamic virtual machine provisioning and allocation in clouds," _IEEE Transactions on Parallel and Distributed Systems_, vol. 26, no. 2, pp. 594-603, 2015.
* [38] L. Ismail, D. Niyato, S. Sun, D. In Kim, M. Erol-Kantarci, and C. Miao, "Semantic Information Market For The Metaverse: An Auction Based Approach," _arXiv e-prints_, p. arXiv:2204.04878, Apr. 2022.

\begin{tabular}{c c}  & Jixian Zhang received an M.S. and a Ph.D. degree in computer science from the University of Electronic Science and Technology of China in 2006 and 2010. Currently, he is an associate professor at the School of Computer Science and Engineering at Yunnan University. He has published 30+ articles in peer-reviewed journals and conferences, e.g., TMC, PGCS, JOGC, Cluster Computing, and Computing. His research interests include cloud computing, edge computing and mechanism design. \\ \end{tabular} \begin{tabular}{c c}  & Peng Chen is a master's student from Yunnan University and is expected to obtain a master's degree in 2025. His main study and research directions include deep reinforcement learning and mobile crowdsensing. \\ \end{tabular} \begin{tabular}{c c}  & Hao Wu received a Ph.D. degree in computer science from Huazhong University of Science and Technology in 2007. Currently, he is a professor at the School of Information Science and Engineering, Yunnan University, China. He has published 60+ papers in peer-reviewed journals and conferences, e.g., TPDS, TMC, TNLS, TSC, NeuNet, WWJ, PGCS, KBS, PUC, ASE, ICWS, and ICSOC. He has coauthored two monographs published in World Scientific. His research interests include service computing, information filtering, and recommender systems. \\ \end{tabular} \begin{tabular}{c c}  & Athanasios V. Vasilakos is with CAIR, UiA, and his main research interests include IoT's/mobile nets, artificial intelligence/machine learning, cybersecurity, and big data analytics. He has more than 44,000 citations, H-index=113. He has served or is serving as an editor for many technical journals, such as the IEEE Transactions On Network and Service Management, IEEE Transactions On Cloud Computing, IEEE Transactions On Information Forensics And Security, IEEE Transactions On Cybernetics, IEEE Transactions On Services Computing, IEEE Transactions On Harmonical Technology In Biomedicine, ACM Transactions On Autonomous And Adaptive Systems, and IEEE Journal On Selected Areas In Communications. He was also General Chair of the European Alliances for Innovation. \\ \end{tabular} 
\begin{tabular}{c c}  & Weidong Li received a Ph.D. from the Department of Mathematics, Yunnan University in 2010. He is currently a professor with the School of Mathematics and Statistics at Yunnan University. He has published 90+ articles in peer-reviewed journals and conferences, e.g., TPDS, TMC, ALGO, JOA, TCS, JOO, FGCS, and JOGC. His main research interests include combinatorial optimization, approximation algorithms, randomized algorithms and cloud computing. \\ \end{tabular}