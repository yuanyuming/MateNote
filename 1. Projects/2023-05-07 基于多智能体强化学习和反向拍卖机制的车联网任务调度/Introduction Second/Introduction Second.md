---
UID: 20240112145846 
tags: 
source: 
cssclass: 
created: "2024-01-12 14:58"
updated: "2024-02-07 22:47"
---
## Original Text

Nevertheless, the arbitrary offloading of tasks can result in workload imbalances among edge servers, diminishing server revenue, and compromising user utility. Hence, judicious task scheduling across edge servers becomes imperative to optimize service quality with high resource efficiency. This paper investigates task scheduling strategies that select appropriate execution plans based on task demands and budget considerations. The goal is to offload tasks with varying characteristics and requirements from vehicles to suitable nodes, ultimately enhancing user satisfaction, edge server revenue, and resource utilization. Given the dynamic nature of vehicles, fluctuating network conditions, the timeliness and complexity of tasks, and the limitations of heterogeneous resources, task scheduling in IoV presents several challenges. Commonly employed methods include fuzzy logic and machine learning. The fuzzy logic method necessitates the predefined formulation of various fuzzy rules, demanding substantial time and effort for design and being confined by static, globally-oriented expert knowledge. To mitigate manual intervention, some studies propose machine learning methods for workload scheduling. Machine learning techniques dynamically adjust task scheduling strategies. However, due to potential obsolescence or lack of generalizability in the dataset used for learning, adopting a reinforcement learning agent for training in a simulated environment emerges as a suitable alternative.

This paper presents an innovative approach that integrates multi-agent reinforcement learning with a reverse auction mechanism to address the task scheduling problem in the IoV. The primary objective of this method is to achieve optimal resource matching among services, vehicles, and edge servers by dynamically allocating execution plans for computation-intensive services. Additionally, the approach aims to foster collaboration between vehicles and edge servers through an incentive mechanism, thereby enhancing the efficiency and performance of task scheduling while minimizing overall costs.

More specifically, the paper employs a multi-agent reinforcement learning methodology. Multi-agent deep reinforcement learning is an advanced machine learning technique wherein multiple agents collaboratively leverage deep learning techniques to effectively tackle complex and highly cooperative problems. This approach enables vehicles to autonomously learn and update their task scheduling strategies based on both local and global information. This adaptive learning process aims to maximize the utilization of system resources and improve the overall execution effectiveness.

Simultaneously, the paper introduces a reverse auction mechanism. A reverse auction is a resource trading mechanism in which the seller selects a suitable transaction based on quotes from potential buyers. This mechanism facilitates effective cooperation between vehicles and edge servers through resource allocation and price negotiation. The primary goal of the reverse auction mechanism is to strike a balance between competition and cooperation, thereby enhancing system efficiency, ensuring fairness, and promoting reasonable resource allocation.

The primary contributions of this paper are outlined as follows:

- Implemented the modeling of the task scheduling problem within the IoV context, devising a methodology for edge server resource scheduling based on multi-agent reinforcement learning and a reverse auction mechanism.
- Applied a reverse auction approach to address the task scheduling problem in IoV, achieving a distributed, adaptive task scheduling solution.
- Devised a bidding strategy leveraging PPO+LSTM, harnessing the memory capabilities of LSTM to capture temporal characteristics and long-term dependencies in task scheduling. This strategy aims to enhance the performance and effectiveness of the bidding process.
- Conducted simulation experiments to validate the effectiveness and superiority of the proposed method. Additionally, assessed the advantages and applicability of reinforcement learning and the reverse auction mechanism, comparing the outcomes with other benchmark methods.



**Task scheduling.** Prevalent scheduling methods in edge cloud computing environments include fuzzy logic and machine learning. A variety of distributed resource scheduling approaches rooted in random optimization have been introduced[^24][^26][^27][^1], dynamically adapting resource allocation strategies in response to real-time feedback information, exhibiting commendable performance in specific scenarios. Nonethelessthese approaches encounter challenges, including the necessity to predefine fuzzy rules, substantial design time requirements, and constraints imposed by a static global perspective. In contrast to fuzzy logic methods, traditional machine learning methods leverage existing scheduling data to acquire dynamic task scheduling strategies, thereby diminishing manual intervention. However, the dataset employed for learning may lack adaptability to novel environments. Consequently, reinforcement learning agents trained in simulation environments emerge as a viable solution to tackle the challenges of environmental changes [^32].

**Auction mechanism.** In recent years, researchers domain of auction mechanisms have concentrated on addressing challenges specific to vehicular networks. Their efforts aim to devise diverse mechanisms and algorithms that ensure equitable determination of resource prices and efficient resource allocation. In the field of Mobile Edge Computing (MEC), research has shown various developments. For instance, W. Hou et al. [^3] introduced an online incentive-driven task allocation scheme aimed at maximizing system utility. Simultaneously, Chattopadhyay and Tham [^5] presented a distributed incentive mechanism that markedly diminishes node computation costs. Additionally, auction-based incentive mechanisms have been widely applied to MEC resource allocation. For instance, Ma et al. [^6] devised a practical combined double auction mechanism to motivate edge servers in offering services to proximate mobile users. Sun et al. [^7] introduced a resource allocation scheme based on double auctions, applicable to the Industrial Internet of Things environment, with the objective of maximizing the overall social welfare. Gao et al. [^8] proposed a solution for virtual machine allocation for deadline-sensitive tasks in distributed edge clouds, leveraging auction mechanisms. Zhou et al. [^42] introduced a reverse auction-based mechanism for computation offloading and resource allocation in mobile edge computing, aiming to minimize the cost of cloud service centers.

**Reinforcement learning.** Reinforcement learning (RL) methods find extensive application in addressing multi-constraint process scheduling problems [^9][^10]. These approaches utilize equilibrium concepts from game theory and multi-agent training techniques to effectively tackle challenges in multi-constraint and multi-objective optimization problems. Nascimento et al. [^2] introduced a reinforcement learning (RL)-based scheduling method designed for the execution of cloud-based scientific workflows. Mao et al. [^12] presented DeepRM, a method addressing system resource management issues by transforming time-sensitive resource demand task scheduling into a reinforcement learning problem.

---
## Markdown List

1. **Introduction:**
   - Arbitrary offloading of tasks can lead to workload imbalances among edge servers.
   - Results in diminished server revenue and compromised user utility.
   - Task scheduling across edge servers is crucial for optimizing service quality and resource efficiency.

2. **Objectives:**
   - Investigate task scheduling strategies based on task demands and budget considerations.
   - Offload tasks with varying characteristics from vehicles to suitable nodes.
   - Enhance user satisfaction, edge server revenue, and resource utilization.

3. **Challenges in IoV Task Scheduling:**
   - Dynamic nature of vehicles.
   - Fluctuating network conditions.
   - Timeliness and complexity of tasks.
   - Limitations of heterogeneous resources.

4. **Commonly Employed Methods:**
   - Fuzzy logic: Requires predefined formulation of fuzzy rules, limited by static expert knowledge.
   - Machine learning: Dynamically adjusts task scheduling strategies but faces issues of dataset obsolescence or lack of generalizability.

5. **Proposed Innovative Approach:**
   - Integration of multi-agent reinforcement learning with a reverse auction mechanism.
   - Objective: Achieve optimal resource matching, foster collaboration, and minimize overall costs.

6. **Multi-Agent Reinforcement Learning:**
   - Advanced machine learning technique.
   - Multiple agents collaboratively leverage deep learning techniques.
   - Enables vehicles to autonomously learn and update task scheduling strategies based on local and global information.

7. **Reverse Auction Mechanism:**
   - Resource trading mechanism.
   - Seller (edge server) selects a suitable transaction based on quotes from potential buyers (vehicles).
   - Facilitates cooperation through resource allocation and price negotiation.
   - Goal: Strike a balance between competition and cooperation, enhance system efficiency, ensure fairness, and promote reasonable resource allocation.

The primary contributions of this paper are outlined as follows:

- Implemented the modeling of the task scheduling problem within the IoV context, devising a methodology for edge server resource scheduling based on multi-agent reinforcement learning and a reverse auction mechanism.
- Applied a reverse auction approach to address the task scheduling problem in IoV, achieving a distributed, adaptive task scheduling solution.
- Devised a bidding strategy leveraging PPO+LSTM, harnessing the memory capabilities of LSTM to capture temporal characteristics and long-term dependencies in task scheduling. This strategy aims to enhance the performance and effectiveness of the bidding process.
- Conducted simulation experiments to validate the effectiveness and superiority of the proposed method. Additionally, assessed the advantages and applicability of reinforcement learning and the reverse auction mechanism, comparing the outcomes with other benchmark methods.


**Task Scheduling:**
- Prevalent methods in edge cloud computing: fuzzy logic and machine learning.
- Distributed resource scheduling approaches rooted in random optimization[^24][^26][^27][^1].
- Challenges include predefined fuzzy rules, design time requirements, and static global perspective.
- Traditional machine learning methods leverage existing scheduling data, diminishing manual intervention.
- However, learning dataset may lack adaptability to novel environments.
- Reinforcement learning agents trained in simulation environments provide a solution to tackle environmental changes[^32].

**Auction Mechanism:**
- Recent focus on auction mechanisms in vehicular networks.
- Efforts to devise diverse mechanisms for equitable resource price determination and efficient allocation.
- Developments in Mobile Edge Computing (MEC) research.
- Examples include online incentive-driven task allocation scheme[^3] and distributed incentive mechanism[^5].
- Auction-based incentive mechanisms widely applied to MEC resource allocation, e.g., practical combined double auction mechanism[^6].
- Reverse auction-based mechanism for computation offloading and resource allocation in mobile edge computing introduced[^42].

**Reinforcement Learning:**
- Extensive application of Reinforcement Learning (RL) methods in multi-constraint process scheduling problems[^9][^10].
- Utilizes equilibrium concepts from game theory and multi-agent training techniques.
- Addresses challenges in multi-constraint and multi-objective optimization problems.
- Examples include RL-based scheduling for cloud-based scientific workflows[^2] and DeepRM for system resource management[^12].
---


