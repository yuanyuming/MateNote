---
UID: 20231204100316 
tags: 
source: 
cssclass: 
created: "2023-12-04 10:02"
updated: "2023-12-29 14:24"
---

## 1. Introduction

Recently, with the development of Internet of Things (IoT) Technologies and Information and Communication Technologies (ICT), wireless embedded sensing devices and 5G-related technologies has been brought into modern vehicles. This makes Intelligent Transport System (ITS) becomes a reality and an indispensable component of smart cities. The applications of ITS can provide driver with prior information about traffic flow which will improve road safety, traffic efficiency and driving experience.

Internet of Vehicle(IoV) as an important part of ITS provides vehicles with various perception, communication and computing capabilities, through information exchange and collaborative services between vehicles, vehicles and infrastructures, to achieve safer, more efficient and intelligent driving. However, the computing power and battery capacity of vehicles are limited and cannot meet the requirements of some complex or delay-sensitive tasks, such as autonomous driving, video analysis, personal assistant, etc.

Mobile edge computing (MEC) as a new computing paradigm, is proposed to solve the problem above, by deploying multiple MEC servers at the road edge, provides vehicles with low-latency high-bandwidth computing resources and services. Through mobile edge computing technology, vehicles can offload part or all of their tasks to MEC servers for execution, thus saving their own energy consumption and time overhead.

Computing task scheduling is an important and challenging problem in IoV, which aims to improve the performance and experience of vehicles by effectively allocating computation-intensive services to the on-board unit (OBU) or the edge server. The tasks in IoV, such as speech recognition, natural language processing, computer vision, machine learning, augmented reality, etc., have different characteristics and requirements in terms of type, size, priority, delay, energy consumption, etc. Computing task scheduling involves deciding whether to execute the task locally on the vehicle or offload it to the edge server based on these factors, as well as the status of vehicles and edge servers, such as vehicle's location, speed and server's resources, utility, etc. However, there are many challenges in performing effective task offloading and scheduling in the mobile edge computing (MEC) environment. For example, how to make task offloading decisions based on task characteristics and real-time status; how to balance the load among different MEC servers and maximize the system utility while ensuring the quality of service (QoS); and how to design a reasonable and fair incentive mechanism to encourage cooperation among servers and avoid selfish or malicious behavior.

To solve this problem, this paper proposes a vehicular network task scheduling method based on multi-agent reinforcement learning and reverse auction mechanism. This method uses a multi-agent reinforcement learning algorithm, which enables vehicles to learn and update their own task scheduling strategies autonomously based on local and global information. At the same time, this method uses a reverse auction mechanism to achieve resource allocation and price negotiation between vehicles and edge servers. This method can effectively balance the competition and cooperation between vehicles and edge servers, and improve the efficiency and fairness of the system.

In many complex dynamic optimization problems, traditional reinforcement learning methods are difficult to handle high-dimensional state and action spaces, so deep reinforcement learning (DRL) emerged. DRL is a reinforcement learning method based on neural networks and Markov decision process (MDP) models, which can enable one or more agents to interact with the environment and learn an optimal policy that can maximize their long-term rewards. When there are multiple agents in an environment, DRL becomes a multi-agent reinforcement learning (MARL) problem, which requires each agent to adjust its own policy according to its own and other agents’ behaviors, to achieve the goal of cooperation or competition. MARL methods can be divided into value-based, policy-based and actor-critic types, which use different ways to evaluate or generate policies. MARL has many advantages, such as adaptability, robustness, scalability and distributivity, etc., which can adapt to complex, dynamic and uncertain environments and improve the efficiency and stability of the system. MARL has a wide range of applications in many fields, such as robot cooperation, traffic control, power dispatching, social simulation, etc.

This paper uses multi-agent deep reinforcement learning (MADRL) to train the policy networks deployed on each MEC server, so that they can calculate the long-term reward of accepting tasks from users according to their task requirements and their own state, and bid according to the principle of maximizing reward. Compared with other machine learning methods, DRL can directly obtain feedback signals from the environment, and optimize its own behavior through continuous exploration and exploitation. DRL does not need to predefine features or labels, nor does it need a lot of prior knowledge or assumptions, making it more suitable for dealing with complex, dynamic and uncertain environments such as vehicular networks.

Auction mechanism is a common incentive mechanism in economics, which can achieve efficient allocation and fair determination of resources or services. In vehicular networks, auction mechanism can be applied to various scenarios, such as resource or service transactions between vehicles or between vehicles and infrastructure, such as spectrum, cache, computing, data, etc. Auction mechanism can be divided into forward auction and reverse auction. Forward auction is initiated by the seller, and the buyer who bids the highest gets the goods or services. Reverse auction is initiated by the buyer, and the seller who bids the lowest gets the goods or services. Reverse auction is a type of auction mechanism where there are multiple sellers and one buyer. In reverse auction, the buyer will propose a demand and invite the sellers to quote their prices. Then, the buyer will select one or more suitable sellers from the quotes according to his/her own objectives and budget, and pay them corresponding prices. Reverse auction can be divided into different types according to the number of bidders, bidding rules, bidding information and other factors. Common types of reverse auction are: ranking reverse auction, Japanese reverse auction, Dutch reverse auction, and open reverse auction. In recent years, many scholars have studied the auction mechanism in vehicular networks and designed various auction models and algorithms.

In vehicular networks, both forward and reverse auctions have their own application scenarios and advantages, but they also face some problems and challenges. Reverse auctions can motivate vehicle users to share resources or execute tasks, such as spectrum sharing, caching sharing, computing task offloading, data acquisition, etc. These services or tasks requests can be issued by the platform, or by vehicle users or edge servers to the platform. The platform can use reverse auctions to find vehicle users or servers who are willing to provide services or execute tasks at the lowest price, and sign standard contracts with them. This can save costs for the platform. Reverse auctions can also be used to allocate some social welfare tasks to vehicle users, such as traffic management, environmental monitoring, data collection, etc. The platform can publish task information in reverse auctions according to the task demand and budget, and select vehicle users who offer the lowest price and meet the criteria to execute the tasks. This can enable the platform to effectively achieve the task objectives, while also motivating vehicle users to participate in social welfare activities and receive corresponding rewards. This paper will design a reverse auction mechanism based on mechanism design theory, which is used to allocate vehicle users’ tasks to MEC servers and motivate them to provide services or execute tasks at the lowest price. In order to implement this reverse auction mechanism, this paper will also use deep reinforcement learning to train the policy network deployed on each MEC server, so that it can calculate the long-term revenue generated by accepting tasks according to the user’s task demand and its own state, and make bids to users according to the principle of revenue maximization. This can ensure the truthfulness, efficiency and individual rationality of the resource allocation process, and achieve cooperative optimization between vehicle users and MEC servers.

This paper aims to propose a vehicular network task scheduling method based on multi-agent reinforcement learning and reverse auction mechanism, which can dynamically allocate a suitable execution plan for each task according to the resource matching degree between tasks, vehicles and edge servers, and ensure the cooperation and fairness between vehicles and edge servers through incentive mechanism. This paper believes that this method can effectively improve the efficiency and performance of task scheduling, and reduce the total cost generated in the process of task execution.

---

为了解决这些问题，本文提出了一种创新的方法，采用了多智能体强化学习和逆向拍卖机制。通过多智能体强化学习算法，车辆能够基于本地和全局信息自主学习和更新其任务调度策略。同时，引入逆向拍卖机制实现了车辆和边缘服务器之间的资源分配和价格协商，以有效平衡竞争与合作，提高系统效率和公平性。

在这个背景下，深度强化学习（DRL）成为一种关键的方法，特别是针对具有高维状态和动作空间的问题。DRL基于神经网络和马尔可夫决策过程（MDP）模型，使得智能体能够与环境交互，学习最优策略以最大化长期奖励。对于多智能体环境，引入了多智能体强化学习（MARL）问题，其在评估和生成策略方面具有不同的方法，如基于价值、基于策略和演员-评论者类型。MARL方法因其适应性、鲁棒性、可扩展性和分布性等优势，在众多领域取得了广泛应用，为复杂、动态和不确定的环境提供了高效和稳定的解决方案。

在许多复杂的动态优化问题中，传统的强化学习方法很难处理高维状态和动作空间，因此深度强化学习（DRL）应运而生。DRL是一种基于神经网络和马尔可夫决策过程（MDP）模型的强化学习方法，它可以使一个或多个智能体与环境交互，并学习最优策略以最大化它们的长期奖励。当一个环境中有多个智能体时，DRL成为多智能体强化学习（MARL）问题，需要每个智能体根据自己和其他智能体的行为调整自己的策略，以实现合作或竞争的目标。MARL方法可以分为基于价值、基于策略和演员-评论者类型，它们使用不同的方式来评估或生成策略。MARL具有适应性、鲁棒性、可扩展性和分布性等许多优势，可适应复杂、动态和不确定的环境，提高系统的效率和稳定性。MARL在许多领域都有广泛应用，如机器人协作、交通控制、电力调度、社会模拟等。

本文使用多智能体深度强化学习（MADRL）来训练部署在每个MEC服务器上的策略网络，使其能够根据用户的任务需求和自身状态计算接受任务的长期奖励，并根据最大化奖励的原则出价。与其他机器学习方法相比，DRL可以直接从环境中获得反馈信号，并通过持续的探索和利用优化自己的行为。DRL不需要预定义特征或标签，也不需要大量的先验知识或假设，因此更适用于处理车联网等复杂、动态和不确定的环境。

拍卖机制是经济学中常见的激励机制，可以实现资源或服务的有效分配和公平确定。在车联网中，拍卖机制可以应用于各种场景，如车辆间或车辆与基础设施之间的资源或服务交易，如频谱、缓存、计算、数据等。拍卖机制可分为正拍卖和逆拍卖。正拍卖由卖方发起，出价最高的买方获得货物或服务。逆拍卖由买方发起，出价最低的卖方获得货物或服务。逆拍卖是一种有多个卖方和一个买方的拍卖机制。在逆拍卖中，买方将提出需求，邀请卖方报价。然后，买方将根据自己的目标和预算从报价中选择一个或多个合适的卖方，并支付相应的价格。逆拍卖可以根据投标人数、投标规则、投标信息等因素分为不同类型。逆拍卖的常见类型有：排名逆拍卖、日本逆拍卖、荷兰逆拍卖和公开逆拍卖。近年来，许多学者研究了车联网中的拍卖机制，并设计了各种拍卖模型和算法。

在车联网中，正拍卖和逆拍卖都有各自的应用场景和优势，但它们也面临一些问题和挑战。逆拍卖可以激励车辆用户共享资源或执行任务，如频谱共享、缓存共享、计算任务卸载、数据采集等。这些服务或任务请求可以由平台发起，也可以由车辆用户或边缘服务器发起到平台。平台可以使用逆拍卖找到愿意以最低价格提供服务或执行任务的车辆用户或服务器，并与它们签署标准合同，从而为平台节省成本。逆拍卖也可以用于将一些社会福利任务分配给车辆用户，如交通管理、环境监测、数据收集等。平台可以根据任务需求和预算在逆拍卖中发布任务信息，并选择出价最低且符合标准的车辆用户来执行任务。这可以使平台在有效实现任务目标的同时，激励车辆用户参与社会福利活动并获得相应的奖励。本文将设计一种基于机制设计理论的逆拍卖机制，用于将车辆用户的任务分配给MEC服务器，并激励它们以最低价格提供服务或执行任务。为了实现这种逆拍卖机制，本文还将使用深度强化学习来训练部署在每个MEC服务器上的策略网络，使其能够根据用户的任务需求和自身状态计算接受任务所产生的长期收益，并根据收益最大化的原则向用户出价。这可以确保资源分配过程的真实性、效率和个体合理性，并在车辆用户和MEC服务器之间实现合作优化。


本文旨在提出一种基于多智能体强化学习和逆拍卖机制的车联网任务调度方法，该方法可以根据任务、车辆和边缘服务器之间的资源匹配程度动态分配每个任务的执行计划，并通过激励机制确保车辆和边缘服务器之间的合作和公平性。本文认为这种方法可以有效提高任务调度的效率和性能，降低任务执行过程中产生的总成本。


任务卸载涉及到多个参与者之间的资源分配问题，即如何将车辆的任务分配给合适的边缘服务器，并使得各方都能能获得最大化的效用。为了解决这一问题，本文借借鉴了经济学中的反向拍卖（Reverse Auction）理论，提出了一种基于反向拍卖的任务卸载方法（Reverse Auction-based Task Offloading, RATO）。反向拍卖是一种一买方多卖方的拍卖形式，适用于买方市场（Buyer’s Market）的交易活动。在反向拍卖中，买方提出自己的需求和预算，卖方根据自身的成本和利润，竞争性地给出自己的报价。最终，买方选择一个或多个报价最低且满足需求的卖方进行交易。反向拍卖可以有效降低买方的采购成本，提高卖方之间的竞争力，实现资源的优化分配。

为了解决这个问题，我们需要考虑任务、执行方案和执行资源之间的匹配程度，以及执行方案之间的竞争和合作程度。为了实现任务卸载，我们可以借借鉴一些先进的技术和方法，例如容器技术、微服务架构、多智能体强化学习和反向拍卖机制等。





任务卸载是指将一个或多个任务从一个服务器或节点移动到另一个服务器或节点，以提高系统的性能和资源利用率。任务卸载是一种常见的系统管理问题，它涉及到如何选择合适的执行方案，以满足任务的需求和预算。
在车联网中，任务调度面临着多方面的挑战. 由于车辆的高速移动性、网络的动态变化、任务的时效性和复杂性、资源的有限性和异构性等因素，车联网中的任务调度面临着多方面的挑战。任务调度是指根据任务的需求和预算，选择合适的执行方案，它可以将一些计算密集或数据密集的任务从车辆卸载到合适的节点，以提高用户满意度, 系统的性能和资源利用率。



本文主要研究的问题是车联网（IoV）中的工作调度问题，即根据车辆的计算任务需求和移动特性，在移动边缘计算（MEC）环境中有效地分配和调度车辆的计算任务，以达到优化系统性能和用户体验的目的。


容器技术是一种轻量级虚拟化技术，它可以将应用程序及其依赖环境打包成一个隔离且可移移移移植的单元，并通过网络进行通信。容器技术可以提高应用程序的可维护性、可扩展性、可测试性和可靠性，同时也可以降低开发成本和复杂度。

多智能体强化学习是一种机器学习方法，它可以让智能体（如车辆）根据局部和全局的信息，自主地学习和更新自己的行为策略。多智能体强化学习可以提高智能体的适应性、效率、稳定性和安全性，同时也可以降低人工干预和误差。

反向拍卖机制是一种市场机制，它可以让买方（如车辆）根据自身的需求和预算，在卖方（如边缘服务器）之间进行竞争性地报价，并选择最优化的交易方案。反向拍卖机制可以提高交易效率、公平性、灵活性和稳定性，同时也可以降低交易成本和风险。

综上所述，我们认为基于多智能体强化学习和反向拍卖机制的车联网任务调度方法是一种有效且先进的方法来解决任务卸载问题。该方法利用多智能体强化学习算法，使得车辆可以根据局部和全局的信息，自主地学习和更新自己的任务调度策略。同时，该方法利用反向拍卖机制，实现了车辆和边缘服务器之间的资源分配和价格协商。该方法可以有效地平衡车辆与边缘服务器之间的竞争和合作，提高系统的效率和公平性。



---

## 摘要

车联网是一种将车辆与互联网相连的技术，它可以提供各种智能化的服务，如导航、娱乐、安全等。然而，车辆的计算能力和能源有限，无法满足复杂和耗时的任务的需求。为了解决这个问题，车辆可以将部分任务卸载到边缘服务器上，从而节省能耗和提高性能。然而，任务卸载的过程涉及到多个车辆和多个服务器之间的协作和竞争，如何有效地分配任务和资源，是一个具有挑战性的问题。本文提出了一种基于多智能体强化学习和反向拍卖机制的车联网任务卸载方法，它可以让车辆和服务器之间通过反向拍卖的方式进行任务卸载的交易，同时利用强化学习的方法来学习和优化各自的报价策略，从而实现任务卸载的效率和公平。本文还开发了一个基于 Python 的开源仿真环境 —— VehicleJobScheduling，它可以模拟车辆任务卸载的过程，并提供一些常用的评估指标。本文通过在该环境中进行一系列的仿真实验，验证了本文方法的有效性和优越性。


In this paper, we aim to maximize the utilization of system resources and improve the overall execution effectiveness of task offloading in vehicle networking, which enables vehicles to access various intelligent services through the Internet. Due to the limited computing power and energy of vehicles, task offloading can improve the performance and efficiency of complex and time-consuming tasks by leveraging the edge servers. However, task offloading also involves the trade-off and coordination among multiple vehicles and servers, which poses a great challenge for task and resource allocation. To tackle this problem, we propose a novel method that combines multi-agent reinforcement learning and reverse auction mechanism, which allows vehicles and servers to learn and optimize their own bidding strategies for task offloading, and achieve a fair and efficient outcome. We use proximal policy optimization (PPO) algorithm with long short-term memory (LSTM) networks to train our multi-agent reinforcement learning model. We conduct extensive experiments in our open-source Python-based simulation environment, VehicleJobScheduling, which can realistically model the vehicle networking scenario and provide various evaluation metrics. The study reveals that the PPO+LTSM strategy utilizes LSTM to capture temporal information, enabling more rational decision-making and achieving the most effective load balance.

车联网是一种利用车辆之间和车辆与基础设施之间的无线通信技术，实现智能交通系统的网络技术。车联网具有广泛的应用场景，例如标准化、高效的交通管理、道路安全和信息娱乐等。随着车辆搭载的通信系统、计算设备、存储空间和传感器的增加，车联网也面临着更多的挑战和需求。

在车联网中，一个重要的问题是如何有效地调度车辆的计算任务，以提高车辆的性能和用户的体验。随着5G通信技术和边缘计算技术的发展，车联网中出现了大量的计算密集型服务，例如语音识别、自然语言处理、计算机视觉、机器学习、增强现实等。这些服务需要大量的计算资源来执行，而车辆上搭载的OBU（车载单元）由于重量、尺寸和电池寿命等因素，往往缺乏足够的计算资源。因此，如何有效地调度车联网中的任务，使得它们能够在满足时效性和能耗等约束条件下，在车辆或边缘服务器上完成，是一个重要而具有挑战性的问题。计算任务调度是指根据任务的特征和需求，决定将任务在车辆本地执行还是卸载到边缘服务器或云端执行。计算任务调度涉及到多个方面的因素，例如任务的类型、大小、优先级、延迟、能耗等，以及车辆的位置、速度、方向、资源、效用等2。因此，计算任务调度是一个复杂的优化问题，需要考虑多个目标和约束条件。

1. <https://arxiv.org/ftp/arxiv/papers/2101/2101.04539.pdf>
2. <https://www.sciencedirect.com/science/article/abs/pii/S1084804513001793>

为了解决这个问题，本文提出了一种基于多智能体强化学习和反向拍卖机制的车联网任务调度方法。该方法利用多智能体强化学习算法，使得车辆可以根据局部和全局的信息，自主地学习和更新自己的任务调度策略。同时，该方法利用反向拍卖机制，实现了车辆和边缘服务器之间的资源分配和价格协商。该方法可以有效地平衡车辆与边缘服务器之间的竞争和合作，提高系统的效率和公平性。本文旨在提出一种基于多智能体强化学习和反向拍卖机制的车联网任务调度方法，该方法可以动态地根据任务、车辆和边缘服务器之间的资源匹配程度，为每个任务分配一个合适的执行方案，并通过激励机制保证车辆和边缘服务器之间的合作和公平。本文认为，这种方法可以有效地提高任务调度的效率和性能，并降低任务执行过程中产生的总成本。

---

## 摘要

车联网是一种将车辆与互联网相连的技术，它可以提供各种智能化的服务，如导航、娱乐、安全等。然而，车辆的计算能力和能源有限，无法满足复杂和耗时的任务的需求。为了解决这个问题，车辆可以将部分任务卸载到边缘服务器上，从而节省能耗和提高性能。然而，任务卸载的过程涉及到多个车辆和多个服务器之间的协作和竞争，如何有效地分配任务和资源，是一个具有挑战性的问题。本文提出了一种基于多智能体强化学习和反向拍卖机制的车联网任务卸载方法（RATO），它可以让车辆和服务器之间通过反向拍卖的方式进行任务卸载的交易，同时利用强化学习的方法来学习和优化各自的报价策略，从而实现任务卸载的效率和公平。本文还开发了一个基于 Python 的开源仿真环境 —— VehicleJobScheduling，它可以模拟车辆任务卸载的过程，并提供一些常用的评估指标。本文通过在该环境中进行一系列的仿真实验，验证了本文方法的有效性和优越性。

## 引言

车联网是一种将车辆与互联网相连的技术，它可以提供各种智能化的服务，如导航、娱乐、安全等。随着车辆的智能化和网络化的发展，车辆的计算需求也越来越高，例如，车辆可能需要进行高清视频的处理、复杂的路径规划、大规模的数据分析等。然而，车辆的计算能力和能源有限，无法满足这些复杂和耗时的任务的需求。为了解决这个问题，车辆可以将部分任务卸载到边缘服务器上，从而节省能耗和提高性能。边缘服务器是一种靠近用户的计算设备，它可以提供更快的响应时间和更高的服务质量，相比于远程的云服务器，它更适合车联网的场景。

任务卸载的过程涉及到多个车辆和多个服务器之间的协作和竞争，如何有效地分配任务和资源，是一个具有挑战性的问题。一方面，车辆需要根据自己的资源需求、连接限制和预算，选择是否将任务卸载到边缘服务器上，以及选择哪些服务器进行任务卸载，并支付相应的费用。另一方面，服务器需要根据自己的资源状况和成本，对收到的任务卸载请求进行报价，并执行被接受的任务。这样，车辆和服务器之间就形成了一个多方参与的动态的市场，它需要一个合理的机制来协调和激励各方的行为，从而实现任务卸载的效率和公平。

---

算法1：基于多智能体强化学习和反向拍卖机制的车联网任务卸载算法（RATO）

输入：边缘服务器集合$S$，任务生成参数，边缘服务器的策略网络参数$\theta$，其他相关参数和变量
输出：车辆和边缘服务器的最终的效用和收益，以及任务的完成率和质量等指标
步骤：

1. 初始化环境和边缘服务器的集合，边缘服务器的策略网络的参数，以及其他相关的参数和变量
2. 循环执行以下步骤，直到达到终止条件
- 任务生成。环境根据任务特征参数，生成本回合内多个计算任务，并将其添加到任务集合中
- 任务卸载请求。每个车辆根据自身的任务连接限制，向满足其连接限制的边缘服务器发送任务卸载请求，即$x_{ij}=1$，其中$j\in L_i$
- 任务卸载报价。每个边缘服务器根据自身的资源状况和策略网络的输出，对收到的任务卸载请求进行报价，即$q_{ij}=\pi_{\theta}(a|s)$，其中$i\in R_j$
- 任务卸载选择。每个车辆根据收到的报价，选择一个或多个报价最低、同时满足需求和预算条件的边缘服务器进行交易，即$y_{ij}=1$，其中$j\in W_i$
- 任务卸载执行。交易成功后，车辆将任务发送到胜出者服务器并支付相应金额，等待执行结果返回，即$z_{ij}=1$，其中$j\in W_i$。服务器获得收益，为任务分配资源并执行任务卸载。如果没有服务器的报价满足车辆的条件，则车辆无法完成任务卸载，无需支付任何金额，即$z_{ij}=0$，其中$j\in L_i$
- 状态更新。每个边缘服务器根据任务卸载的结果，更新自身的状态，如资源状况、任务队列等
- 奖励计算。每个边缘服务器根据任务卸载的结果，计算自身的奖励，即收益，如$R(s,a)=e_j$
- 经验存储。每个边缘服务器将自身的经验，即状态、动作、奖励和下一个状态，存储到自身的经验回放缓冲区中，用于后续的策略更新
- 策略更新。每隔一定的时间步，每个边缘服务器从自身的经验回放缓冲区中随机抽取一批经验，利用PPO算法更新自身的策略网络的参数，从而提高自身的策略性能

3. 输出车辆和边缘服务器的最终的效用和收益，以及任务的完成率和质量等指标

---

Jeunen等人[^13]讨论了在线广告拍卖的挑战，提出了一个框架，涵盖了不同的“学习出价”方法，包括基于价值、基于策略和双重稳健的公式。他们还介绍了AuctionGym，一个用于在线广告拍卖中出价策略的可靠离线验证的开源仿真环境，实证证据支持了所提方法的有效性。Kutschinski等人[^14]则利用不同类型的异步多智能体强化学习方法确定市场情境下的竞争定价策略。