# An online auction mechanism for cloud computing resource allocation and pricing based on user evaluation and cost

## Abstract 
Auction-based virtual resource allocation is a major problem for cloud computing. However, previous studies have typically equated virtual resources with ordinary items and designs corresponding to specific auction mechanisms, which cannot truly reflect the characteristics of the virtual resource. This inability to reflect the virtual resource characteristics arises because the users have only the right to use resources without ownership, the use of virtual resources has significant impacts on the social welfare and revenue of the resource provider, and the virtual resource usage will generate operating costs. Considering the above issues, this work proposes a truthful online auction mechanism based on user evaluation and cost and applies it to the allocation and pricing of cloud computing virtual resources. Based on a pay-as-you-go model, users can submit multiple requirements at any time, but only one requirement can be satisfied, which is known as a multi-requirement, single-minded scenario. We prove that the resource providers can obtain increased social welfare and guarantee that the mechanism is truthful. For the resource allocation problem, we propose a heuristic algorithm to obtain the allocation result quickly and to maximize the social welfare of the cloud resource provider. The payment algorithm accounts for the interests of both the users and resource provider based on the dichotomy. We experimentally analyze the solution in terms of social welfare, execution time, resource utilization and users served.
## 1. Introduction
In 2016, the global cloud computing market reached 240 billion US dollars, with many enterprises and individuals submitting computing and storage tasks to the cloud. Presently, the auction-based mechanism has become the primary method of cloud resource allocation. In the auction-based mechanism, resource providers are willing to add redundant resources to the market using a less fixed price manner, such as Amazon EC2 [1]. The advantages of this mechanism are that it can improve the revenue and resource utilization of resource providers and meet more user requirements. The introduction of the auction-based mechanism breaks the traditional resource allocation system by replacing the original fixed price model with user bidding as the dominant allocation of resources. 

However, the auction-based resource allocation mechanism used in existing research has several limitations. First, the auction mechanism does not account for the use of virtual resources and their costs, which impact the results of resource allocation. Second, the majority of current auction mechanisms are offline or static. Allocation and payment procedures start after all of the user requirements are known, and the users must wait for a long period of time. Third, the current auction mechanism allows each user to submit only one requirement, which makes it difficult for the user to determine whether his requirement can be satisfied. Finally, the lack of consideration of the user’s evaluation is not conducive to the final payment price calculation.

Considering the above limitations, the auction-based cloud computing resource allocation and pricing mechanism is faced with the following three challenges:

(1) Mechanism design: The auction mechanism design should consider the incentives for both cloud providers and users with the goal of maximizing the social welfare for the cloud providers. A mechanism design should ideally be reasonable, truthful (incentive compatibility) and online. Reasonable means the social welfare-maximized theoretical model should be as accurate and practical as possible. The existing research equates virtual resources with the ordinary item and design of the auction mechanism, which cannot truly reflect the characteristics of the virtual resource. First, the users have only the right to use resources, no ownership, and the use of virtual resources will affect the social welfare and revenue of resource providers. Second, the virtual resource usage will generate operating costs, and thus, these factors should be considered in the mechanism design. Truthful means the auction mechanism should prevent users from submitting untruthful bids to acquire increased revenue. Several previous studies have considered the difference between feasible solutions and the optimal solution while ignoring truthfulness, which makes the auction mechanism lose some meaning. Online means that the mechanism should enable the dynamic allocation of resources. Previous studies regarding mechanism design have largely been static (offline), which means that there exists a wait in obtaining all users' requirements before solving the allocation and payment. However, in practice, when a user arrives and submits a resource requirement that is unpredictable, it is not possible to obtain all user requests in advance. A user who participates in the auction wants to use the resource in a pay-as-you-go manner; thus, the online auction mechanism design will be more suitable for real environments. Therefore, the design of a reasonable, truthful, and online auction mechanism is a significant challenge.

(2) Resource allocation: All users' requirements cannot be satisfied in the auction process. Therefore, the main goal of the allocation is to allocate limited resources to the users in such a way that resource providers obtain the greatest social welfare and revenue. A single-type resource allocation problem has been proven to be NP-hard and thus cannot be solved in polynomial time. In online multi-type resources allocation problems, different resources (e.g., CPU, memory, and bandwidth) must be taken into account, and the arrival and execution times of user requirements must be considered. Thus, online multi-type resource allocation problems are strongly NP-hard.

(3) Payment: In many current auction rules, the allocation winner users do not need to pay the bid price to the cloud provider. The payment price must consider both the cloud provider and users. Nejad M noted that if the payment price was based on the critical value [2], then it would be possible to ensure that the auction mechanism is truthful. The Vickrey-Clarke-Groves (VCG) mechanism [3] provides an ideal method to obtain the critical value, but it does not apply to online auctions. The users' evaluation should be considered in the final payment price algorithm. The users' evaluation allows the users who have a good reputation to pay less for the allocation of resources and can also punish users who have a poor reputation by making them pay more. However, no existing research accounts for the users' evaluation.

### Our contribution

The online auction mechanism allows prices to be determined by real-time supply and demand conditions while also maximizing the revenue to cloud providers. For the above problems, this paper proposes an online auction mechanism based on user evaluation and cost, which is applied to cloud computing virtual resource allocation and pricing. The mechanism will make the social welfare maximization theoretical model more accurate and reasonable. It is characterized by the user satisfying multiple requirements in online auctions and ensuring that the users' bids are truthful. We can prove that the cloud provider can obtain increased social welfare under this mechanism compared to the previous auction mechanism. Then, we propose the online virtual resource allocation and payment (OVRAP) algorithm to solve online multi-requirement, multi-type resource allocation problems. Finally, we introduce the users' evaluation into the payment price algorithm by considering the interests of cloud providers and users. The integer programming and weighted VCG algorithms are used to solve the static optimal solution. In the experiment, the optimal solution is compared to the results obtained using the OVRAP algorithm in terms of execution time, social welfare, resource utilization and served users. The experimental results demonstrate that the OVRAP algorithm can obtain feasible solutions close to the optimal solution while satisfying the truthfulness property.

### Related works

The existing research on cloud resource allocation is mainly focused on auction mechanism design, resource allocation algorithms, payment algorithms and cloud frameworks.

**Auction mechanism design.** The current research on auction mechanisms is mainly based on the premise of a static, single-type resource with a single requirement. The goal of the auction mechanism is to maximize the social welfare for resource providers such that their revenue is maximized. One of the most important features of an auction mechanism is truthful responses (strategy proof or incentive compatibility) [4], that is, the users cannot obtain a higher revenue in the auction through untruthful behavior. In the literature, Mashayekhy and Nejad et al. [2,4] proposed a static, truthful auction mechanism and provided an approximate algorithm for multi-resource allocation; however, under this mechanism, the user can submit only one requirement in the auction. Sandholm et al. [5] proposed a heuristic algorithm and validated it for combinatorial auctions. Wu et al. [6] transformed a combination auction into a winner decision problem (WDP) and used the clique-based exact method to obtain the exact solution. Lai et al. [7] obtained the optimal solution of a combined auction by utilizing a monotone branch-and-bound search method. Mashayekhy et al. [8,9] used the approximate algorithm OVMAP to solve the problem of online resource allocation and payments. Shi et al. [10] transformed the online auction problem into a continuous static auction problem for a period of time. They used the primal-dual algorithm to obtain the approximate resource allocation, where the algorithm was proven to have a competitive ratio of $e+\frac{1}{e-1}$. Zhang et al. [11,12] proposed an incentive-compatible online cloud auction mechanism (COCA), which can ensure truthfulness with heterogeneous and online user demand, Moreover, theoretical analysis shows that the worst-case performance of COCA can be well bounded. The main problems with the current auction mechanism design are as follows. First, virtual cloud computing resources cannot be completely equivalent to ordinary items because the use of virtual resources will affect the social welfare and revenue of resource providers and the virtual resource usage generates operating costs. These two factors should be considered in the mechanism design. Second, the static auction mechanism must know all user requirements in advance and cannot satisfy the users who want to use resources by a pay-as-you-go model. Third, existing online auction mechanisms can submit only one requirement to the users, which is not conducive to maximizing social welfare for resource providers.

**Resource allocation.** Virtual resource allocation problems in cloud computing are similar to multidimensional knapsack problems (MKPs), which are strongly NP-hard [13]. These problemswill be more difficult to solve when considering the time factor. Jain et al. [14] proposed a truthful mechanism and a heuristic algorithm for value-based scheduling in cloud computing. Zaman et al. [15, 16] proposed the CA-GREEDY and CA-PROVISION algorithms to solve the allocation problem. Nejad et al. [2, 4] proposed the DP-VMPAC and G-VMPAC-X algorithms. Mashayekhy et al. [8, 9] proposed a heuristic algorithm, OVMAP, for single-requirement allocation under the online auction mechanism. Wei et al. [17] used game theory to solve the problem of resource allocation and proposed a practical approximate solution, demonstrating that a Nash equilibrium always exists in feasible solutions. However, in these algorithms, the user can submit only one requirement. Mashayekhy et al. [18] proposed a PTAS algorithm to solve the multi-task scheduling problem that provides a reference for our research; however, the background of this algorithm differs from this research. In multi-resource allocation problems, the solving time increases with the number of users, and the solution will become more difficult when accounting for the time dimension. The existing research improves algorithm efficiency by limiting the number of user requirements [2, 3, 4, 5, 6, 8, 9, 10] or reducing the resource dimension [15, 16]. Specifically, combination auction methods or a heuristic algorithm is used to find approximate solutions. However, ensuring that the auction mechanism is truthful can be difficult when a heuristic algorithm is used.

**Payment pricing** The payment issue is a new problem in the study of cloud computing. The payment algorithm determines the final price that the user must pay to the resource provider. Therefore, the payment algorithm should consider the interests of both the resource providers and users. The payment problem is also NP-hard. Teo et al. [3] introduced the VCG model into grid computing to determine the resource allocation and pricing. In the existing literature [2, 4], the payment algorithm is designed by improving the VCG model, but it can satisfy only the situation in which a user submits one requirement. The users' evaluation value supplied by the resource provider should consider the payment algorithm. Nisan et al. [19] presented a weighted VCG theoretical model that can be applied to the scene, but the weighted VCG was based on offline action that needed to collect all user requirements before allocation. Therefore, the weighted VCG does not apply to online auctions.

**Cloud framework** Either the auction mechanism or the algorithms need to run in a practical cloud framework because different cloud platforms will affect the quality of service (QoS) of the virtual resource. Xu et al. [20] reviewed the performance overhead of virtual machine in cloud computing and proposed the evaluation parameters of different types of infrastructure-as-a-service (IaaS) cloud platforms. Xu et al. [21] proposed a framework of solutions that can guarantee QoS with a low cost for distributed clouds and discussed how cross-IDC load shifting can be designed to efficiently and cost effectively alleviate traffic dynamic issues on a short time scale. Rahimi M R et al. [22] introduced a hybrid, tiered cloud architecture consisting of local and public clouds, MAPCloud, and showed how it can be leveraged to increase both the performance and scalability of mobile applications. Based on [22], Rahimi M R et al. [23] further studied the optimal and fair service allocation for various mobile applications in mobile cloud computing and proposed an efficient heuristic algorithm called MuSIC that could perform well in mobile application QoS. Based on the above studies, in this paper, we proposed a framework of online auction in cloud computing.

In summary, the existing research has achieved positive results, but several issues remain. First, the mechanism design does not account for the difference between virtual resources and ordinary items, resulting in inaccurate resource allocation. Second, the current auction mechanism design is primarily based on offline, static, single-requirement conditions, which are not suitable for online resource allocation. Therefore, a reasonable, online, truthful auction mechanism must be established in a practical cloud framework to solve multi-resource, multi-requirement allocation and payment issues.

### Organization

The remainder of this paper is organized as follows. Section 2 discusses the resource model and framework of online auction in cloud computing. Section 3 discusses the optimal solution in offline auctions and proposes a heuristic resource allocation algorithm and a payment algorithm for online auctions. Section 4 presents the experimental results and performance analysis. In Section 5, we summarize our results and discuss possible directions for future work.

## 2 Resource model and framework of online auction in cloud computing

On the one hand, a complete resource model is a prerequisite for the virtual resource auctions. There are two different ways to define the resource model. The first is based on a machine, such as Amazon EC2 virtual machines; virtual machine configurations can be classified as general, such as T2, M3, and M4; computationally intensive, such as C3 and C4; or storage-intensive, such as X1 and R3. Amazon provides the CPU, memory, and SSD storage for each type of machine; the values for the M3 configuration are shown in Table 1 as an example.

However, when defining the resource model in this manner, the user can choose only a certain type of virtual machine that is configured by the providers. Another method is for the users to configure the resources based on the resource type, such as in the Baidu cloud [24]. Users can configure the CPU core, memory size, storage size, storage type (HDD or SSD), network bandwidth, and network type for their virtual machines. The resources model, which is based on resource types, can reflect the real situation more effectively.

The use of virtual resources will significantly impact the social welfare and revenue of the resource provider. For example, the virtual machines that were previously allocated to certain users could be hacked or run illegal programs, which would impact the resource providers and other users. If these users participate in a new round of action, the corresponding penalty mechanism is needed; thus, we introduce the users' evaluation into the social welfare maximization theoretical model and final payment price algorithm. In addition, the use of virtual resources generates operating costs. The existing research considers the sum of the winning users' bids as the social welfare and does consider the cost, which will impact the final allocation solution.

**Virtual resources model:** We denote a cloud provider offering set $R$ to define $m$ types of resources $R=\{tp_{1},tp_{2},\ldots,tp_{m}\}$, such as CPU cores, memory, and storage. The capacity of each resource is represented by vector $C=(c_{1},\,c_{2},\ldots,c_{m})$. The unit cost for each type of resource is defined by vector $V=(v_{1},\,v_{2},\ldots,\,v_{m})$, where $v_{i}$ is the cost of the $i$-th resource; for instance, $v_{1}$ means 1 core CPU cost per hour.

$$
\begin{array}{l l l l} \hline Type & CPU & Memory (GB) & SSD storage (GB) \\ \hline m3.medium & 1 & 3.75 & 1 x 4 \\ m3.large & 2 & 7.5 & 1 x 32 \\ m3.xlarge & 4 & 15 & 2 x 40 \\ m3.2xlarge & 8 & 30 & 2 x 80 \\ \hline 
\end{array}$$
Table 1: Amazon EC2 M3 virtual machine configuration.

**User information model:** We assume that there are $n$ users in set $U$, $U=\{1,2,\ldots,n\}$, User $i\in U$. The time period for resource allocation and use is $[1,T]$. The provider evaluates each user by vector $W=(w_{1},w_{2},\ldots,w_{n})$, $w_{i}\in[0,1]$, where $w_{i}$ is the evaluation weighted value of the $i$th user evaluated by the resource provider. Assume that user $i$ submits the resource requirements at time $t_{i}$, $t_{i}\in[1,T]$, and that user $i$ can submit $k_{i}$ requirements, which are denoted by a bundle of requirements $\mathbf{S}_{i}=[\mathbf{s}_{1}\ \mathbf{s}_{2}\ \ldots\ \mathbf{s}_{k_{i}}]$. Only one of the $k_{i}$ requirements submitted by user $i$ can be satisfied at time $t_{i}$; otherwise, the resources will not be allocated. The requirement $\mathbf{s}_{k}$ can be represented by vector $(\mathbf{s}_{k1}\ldots\mathbf{s}_{k1}\ldots\mathbf{s}_{k1}\ldots\mathbf{s}_{k1}\ldots\mathbf{s}_{k 1})$, $\mathbf{e}_{k1} \mathbf{r}^{T}$, where $\mathbf{s}_{k1}$, $r\in R$, represents the amount of the $r$th resource in the $k$th requirement that is requested by user $i$ and $\mathbf{e}_{k}$ is the execution time that must be allocated. Each requirement of user $i$ has a different execution time $\mathbf{e}_{ik}$. User $i$ values a bid $b_{i}$ for any requirement in bundle $\mathbf{S}_{i}$. The final submission information of user $i$ is represented by vector $\theta_{i}=(t_{i},\mathbf{s}_{i},b_{i})$.

For example, in Table 2, user $1$ submits requirements $1$ and $2$ at time $2$. Requirement $1$ calls for $2$ core CPUs, $4$ GB of memory, $50$ GB of storage, and $20$ h of execution time. At the same time, user $1$ also submits requirement $2$, which calls for $4$ core CPUs, $8$ GB of memory, $50$ GB of storage, and $15$ h of execution time. The user is willing to pay $8$ for each requirement, but only one requirement will be allocated successfully. We define $\theta_{1}=(t_{1},\mathbf{S}_{1},b_{1})$, $t_{1}=2$, $\mathbf{S}_{1}=[\mathbf{s}_{11},\ \mathbf{s}_{12}]$, $\mathbf{s}_{11}=(2,4,50,20)^{\intercal}$, $\mathbf{s}_{12}=(4,8,50,15)^{\intercal}$, and $b_{1}=8$.

On the other hand, we proposed a framework of online auction in lax5 cloud, as shown in Fig. 1. Cloud resources auctions are all carried out in an online manner, and the users can arrive at the system at any time, and submit their multiple requirements to the Online Action Server, which obtains the corresponding user evaluation from the User Server. Then, the Online Action Server acquires the current resource capacity from the Virtual Resource Pool. According to the mechanism and algorithms proposed in this paper, the Online Action Server carries out the allocation solution and price in response to the user. Notably, each user has at most only one requirement to be satisfied. Then, the user can use the required virtual machine resources. Regarding the expired users, they need to release the virtual machine to the Virtual Resource Pool and update the User Server with the user evaluation.

## 3 Action mechanism design

Existing resource allocation algorithms based on fixed prices typically focus on maximizing social welfare and revenue. However, in the auction mechanism, the user's valuation of the required resources may be untruthful. If the auction mechanism does not guarantee that the user's valuation is truthful, the entire auction mechanism is flawed. Therefore, the most important feature of the auction mechanism is truthful, which is also known as incentive compatibility or strategy proof [8,9,19].

First, we assume that each user will submit truthful requirements but may submit untruthful valuations. A truthful auction mechanism must satisfy the following definitions:

**Definition 1** (_Utility Value_).: The utility value of user $i$ is $u_{i}=b_{i}-p_{i}$, where $b_{i}$ is user $i$'s true valuation of his requirement $\theta_{i}$ and $p_{i}$ is the payment that user $i$ must pay based on payment rule $P$. The goal of each user during the auction is to maximize his utility.

**Definition 2** (_Truthful_).: If user $i$ submits an untruthful valuation $\hat{b}_{i}$, there is a new payment $\hat{p}_{i}$ and a new utility value, $\hat{u}_{i}=b_{i}-\hat{p}_{i}$. Assume that $u_{i}$ is the utility value when the user submits the truthful valuation $b_{i}$. If $u_{i}>\hat{u}_{i}$, which is the case when user $i$ can obtain a higher utility value by submitting a truthful valuation, then submitting a truthful valuation is a dominant strategy for each user, and the auction mechanism is truthful [2,8,9].

The first problem that must be solved in auction mechanism design is resource allocation, which is the prerequisite for calculating the payment price. In this phase, the provider is pursuing the maximization of social welfare [4], which must consider the user's bid $b_{i}$, the user's evaluation weighted value $w_{i}$ and the requirement cost. We introduce $x_{ik}$ to indicate whether the $k$th requirement of user $i$ is allocated, where $x_{ik}=1$ indicates that the requirement is allocated at time $t_{i}$ and $x_{ik}=0$ otherwise. The indicator parameter $\delta_{ik}$ in formula (1b) ensures that if the $k$th requirement of user $i$ is allocated successful, then user $i$ will occupy the resources during $[t_{i},t_{i}+\epsilon_{ik}]$. We denote the total social welfare as $V$ and formulate the problem of resource allocation in cloud computing as an integer program as follows:

\[\textit{Objective}:V=\max\{\sum_{i\in U}\sum_{k=1}^{k}(w_{i}b_{i}-\sum_{r=1}^ {m}s_{ikr}v_{r})x_{ik}\} \tag{1}\]

\[\textit{Subject to}:\ \sum_{i\in U}\ \sum_{k\in[0,t+\epsilon_{ik}]}s_{ikr}x_{ik} \delta_{ik}\leq c_{r},\ \forall r\in R,\] \[\forall t=1,2,\ldots,T \tag{1a}\] \[\sum_{r=1}^{m}s_{ikr}x_{ik}v_{r}\leq w_{i}\cdot b_{i},\forall i\in U,\forall k \in K_{i}\] (1b) \[\sum_{k=1}^{k_{i}}x_{ik}\leq 1,\forall i\in U\] (1c) \[x_{ik}=\{0,\ 1\} \tag{1d}\]

where $V$ represents the total social welfare, which is the weighted sum of all of the selected user requirements bids $w_{i}b_{i}$ minus the corresponding cost $\sum_{r=1}^{m}s_{ikr}\cdot v_{r}$. Formula (1a) indicates that the resource allocation at any time $t$, $t\in T$ cannot exceed the capacity of any type of resource. Formula (1b) indicates that the cost of each requirement of user $i$ must be less than his weighted valuation $w_{i}b_{i}$. Formula (1c) indicates that only one of the requirements submitted by user $i$ can be allocated. Without loss of generality, we assume that each user has the same number of requirements, $k_{i}=K,i\in U$. The solution of the problem is an $n*k$ matrix, $\mathbf{X}$. The above problem can be equivalent to an MKP, which is strongly NP-hard.

We assume that $\mathbf{\theta}=\{\theta_{1},\ldots,\theta_{n}\}$ is the set of requirements of all users and the set $\mathbf{\theta}_{-i}=\{\theta_{1}\ \ldots\ \theta_{i-1}\ \theta_{i+1}\ \ldots\ \theta_{n}\}$ is the set of requirements of all users except user $i$. The auction-based resource allocation mechanism $M=(A,P)$ consists of the allocation function $A(\mathbf{\theta})\subseteq U$ and the payment rule $P(A(\mathbf{\theta}))=\{p_{1},p_{2},\ldots,p_{n}\}$. The allocation function determines which requirement of the user should be allocated, and the payment rule determines the price that allocated users must pay. If $i\in A(\mathbf{\theta})$, user $i$ is a winner in the allocation.

**Theorem 1**.: _The resource provider can obtain more social welfare when a user submits multiple requirements than if only one requirement is submitted._

Proof.: We assume that $\theta_{i}^{\prime}=(t_{i},\mathbf{s}_{i},\ b_{i})$ is the information submitted user $i$ can submit only one requirement, whereas $\theta_{i}=(t_{i},\mathbf{S}_{i},\ b_{i})$, $\mathbf{S}_{i}=[\mathbf{s}_{11}\ \mathbf{s}_{2}\ \ldots\ \mathbf{s}_{k_{i}}]$, and $\mathbf{s}_{i}=\mathbf{s}_{ik}\in\mathbf{S}_{i},\ k\in K_{i}$ are the submitted information when user $i$ submits multiple requirements. Assume that $x_{i}^{\prime}$, $i\in U$ represents the optimal allocation solution when each user submits only one requirement. We construct solution $\mathbf{X}^{\prime}$ for when each user submits multiple requirements. Without loss of generality, we assume that $\mathbf{s}_{11}=\mathbf{s}_{i},\ \mathbf{s}_{11}\in\mathbf{S}_{i},\ x_{1}^{\prime}=x_{1}^{\prime},\ x_{ik}^{ \prime}=0,\ k>1$ to each user $i$, $i\in U$. $\mathbf{X}^{\prime}$ is a feasible solution when the

[MISSING_PAGE_FAIL:5]

Recursive relationship:

\[U(i,C^{\prime})=\max\{U(i-1,C^{\prime}),\max_{k\in K_{i}}(U(i-1,C^{\prime}-C^{( ik)})+b_{i})\} \tag{4}\]

\[C^{(k)}=\begin{bmatrix}0&\ldots&s_{k1}&\ldots&s_{k1}&\ldots&0\\ 0&\ldots&s_{k2}&\ldots&s_{k2}&\ldots&0\\ 0&\ldots&\ldots&\ldots&\ldots&\ldots&0\\ 0&\ldots&s_{klm}&\ldots&s_{klm}&\ldots&0\\ 1&\ldots&t_{i}&\ldots&t_{i}+e_{k}-1&\ldots&T\end{bmatrix}\]

$U(i,C^{\prime})$ denotes the maximum social welfare of a user set $1$, $2$,..., $i$ that has been allocated resources $C^{\prime}$ in period $T$. Because of the online resource allocation, the resource capacity $C^{\prime}$ is a matrix that ensures that any type of resource allocation at $[1,T]$ cannot exceed this amount. $C^{(k)}$ indicates the resource request capacity $\mathbf{s}_{k}$ and time period $[t_{i},\,t_{i}+e_{k}-1]$ that must be allocated to the $k$th requirement of user $i$. According to DP theory, the maximum social welfare in the case of the participation of user $i$ can be obtained from the maximum of either $U(i-1,C)$ or $\max_{k\in K_{i}}(U(i-1,C-C^{(k)})+b_{i})$.

Algorithm 1 shows the corresponding optimal dynamic programming resource allocation algorithm (Optimal-DP-Allocation). In the algorithm, lines 1-2 determine the initial social welfare and resources, and lines 3-11 implement a specific DP algorithm. The final results of the algorithm indicate that the optimal social welfare is $U_{sw}\ \leftarrow\ U(i,C^{\prime})$ and the optimal allocation solution is $\mathbf{X}$. The algorithm can find the optimal solution, but the time complexity of the algorithm is $O(kn(c_{1}\ldots c_{m})^{T})$. A more efficient algorithm is needed for practical use.

The optimal payment algorithm calculates the price that winning users should pay. We use the weighted VCG [19] mechanism to design the optimal price algorithm as follows:

\[p_{i}=\sum_{j\in\mathbf{\delta}(\mathbf{\theta}_{i}-i)}b_{j}-\sum_{j\in\mathbf{\delta}( \mathbf{\theta}_{i}),j\neq i}(w_{i}/w_{j})b_{j},\,i\in A(\mathbf{\theta}) \tag{5}\]

$\sum_{j\in\mathbf{\delta}(\mathbf{\theta}_{i}-i)}b_{j}$ is the optimal social welfare when user $i$ does not participate, and $\sum_{j\in\mathbf{\delta}(\mathbf{\theta}_{i}),j\neq i}(w_{i}/w_{j})b_{j}$ is the weighted value of all users' valuations, except user $i$. $p_{i}$ is user $i$'s final payment price. The user valuation weight value $w_{i}$ is used to reflect the evaluation by the resource provider.

The weighted VCG has been proven to be truthful [19], as the user cannot obtain more revenue by submitting an untruthful valuation. However, in the optimal mechanism, the resource allocation and payment problems are strongly NP-hard. The optimal mechanism algorithm is as follows:

**Theorem 2**.: _The optimal mechanism (Optimal-VRAP) is truthful._

Proof.: The optimal mechanism uses DP to solve the optimal allocation solution. Under this premise, the literature [19] has proven that the weighted VCG can satisfy that the auction mechanism is truthful; thus, the Optimal-VRAP is truthful.

\begin{table}
\begin{tabular}{l l l l l l l l} \hline User & Requirements & Arrival time (t) & Execution time (e${}_{k}$) & CPU & Memory (GB) & Storage (GB) & Bids & Weight value \\ \hline User 1 & Requirement 1 & 0 & 3 & 3 & 2 & 1 & 10 & 1 \\ User 2 & Requirement 1 & 1 & 5 & 2 & 1 & 4 & 6 & 1 \\ User 3 & Requirement 1 & 4 & 4 & 1 & 3 & 2 & 10 & 1 \\ User 4 & Requirement 1 & 5 & 5 & 2 & 3 & 2 & 5 & 1 \\ \hline \end{tabular}
\end{table}
Table 4: Single-requirement online allocation example.

\begin{table}
\begin{tabular}{l l l l l l l l l} \hline User & Requirements & Arrival time (t) & Execution time (e${}_{k}$) & CPU & Memory (GB) & Storage (GB) & Bids & Weight value \\ \hline User 1 & Requirement 1 & 0 & 3 & 3 & 2 & 1 & 10 & 1 \\ User 1 & Requirement 2 & 0 & 3 & 2 & 4 & 3 & 10 & 1 \\ User 2 & Requirement 1 & 1 & 5 & 2 & 1 & 4 & 6 & 1 \\ User 3 & Requirement 1 & 4 & 4 & 1 & 3 & 2 & 10 & 1 \\ User 4 & Requirement 2 & 4 & 7 & 2 & 1 & 3 & 2 & 5 & 1 \\ User 4 & Requirement 1 & 5 & 5 & 2 & 3 & 2 & 5 & 1 \\ \hline \end{tabular}
\end{table}
Table 3: Multi-requirement online allocation example.

Figure 2: Allocation solutions for Tables 3 and 4.

## 5 Truthful OVRAP

Because the optimal mechanism cannot solve the online allocation, we propose a truthful OVRAP mechanism. OVRAP consists of two parts: the OVRAP_Allocation algorithm and OVRAP_Payment algorithm. The OVRAP_Allocation algorithm considers the allocation solution $\mathbf{X^{t}}$ and social welfare $l_{\text{var}}$. The OVRAP_Payment algorithm is used to calculate the price that winning users should pay, represented by the vector $\mathbf{P^{t}}$. Because predicting each users' arrival time is impossible, OVRAP is event-driven and invoked whenever a new user submits his requirements or when a running user releases his resources.

OVRAP calculates the corresponding cost (lines 1-6) of all user requirements. If any of user $i$'s requirements have a corresponding cost $\text{cp}_{k}$ that is higher than his weighted bid $w_{i}b_{i}$, then this requirement should be removed from his requirements (lines 3-5) to ensure the effectiveness of the subsequent allocation and payment algorithms.

### A heuristic algorithm for online resource allocation problems (OVRAP_Allocation)

We use the concept of resource density sorting to obtain better results using the allocation algorithm. One of the most important parameters is the _resource scarcity_$h_{r}$, which represents the supply and demand of resource $r$ at the current time $t$. A higher value indicates a rarer resource. _Resource scarcity_ defined as follows:

\[\hat{h}_{r} =\frac{\sum_{i\in U^{*}}\sum_{k=1}^{K_{i}}s_{ikr}}{k\cdot c_{i}^ {r}},\forall r\in R,t\in T,U^{*}=\{i|\theta_{i}\in\mathbf{\theta}\} \tag{6}\] \[h_{r} =\frac{2}{1+e^{-h_{r}}}-1,h_{r}\in(0,\,1) \tag{7}\]

We introduce the _resource density_$f_{k}$ as follows:

\[f_{k}=\frac{w_{i}\cdot b_{i}}{\sum_{r\in R}(\frac{s_{ikr}}{c_{r}}\cdot h_{r}) \cdot e_{k}},\forall i\in U,\,k\in K_{i} \tag{8}\]

$f_{k}$ represents the _resource density_ of the $k$th requirement of user $i$. A higher _resource density_ value indicates that resources tend to be allocated to this user.

The OVRAP_Allocation algorithm is invoked when a new user arrives and submits his requirement or when an allocated user needs to release his resource.

Step 1. Recycle the released resource at the current time to $\mathbf{\text{C}}^{*}$.

Step 2. According to the _resource density_$f_{k}$, sort all requirements submitted at the current time $t$ in non-increasing order to set $D$ and allocate resources according to that order. If any type of resource cannot satisfy the current allocation, then the entire allocation algorithm ends.

**Theorem 3**: _OVRAP_Allocation is a feasible solution of formula_ (1)

The code (lines 7-11) indicates that any resource can be allocated before consumed, which satisfies the formula (1a). TheOVRAP framework code (lines 1-6) ensures that every requirement cost for each user must be less than the valuation $b_{i}$, which satisfies formula (1b). Line 18 indicates that each user has only one requirement to be allocated, which satisfies formula (1c). Line 15 indicates that the allocated solution is an integer set, satisfying formula (1d). Because OVRAP_Allocation is event-driven, the solution $\mathbf{X}^{t}$ of each time is satisfied by formulas (1a)-(1d). Therefore, in time period $T$, the total solution $\mathbf{X}$ is the union of the solutions $\mathbf{X}^{t}$, also satisfying formulas (1a)-(1d). Solution $\mathbf{X}$ is a feasible solution of formula (1).

**Theorem 4**.: _The time complexity of the OVRAP_Allocation algorithm is $\mathcal{O}(nkm)$._

Proof.: According to the OVRAP_Allocation algorithm, it is possible that $k$ requirements with $m$ resource types of $n$ users could potentially be considered; thus, the complexity of the algorithm is $\mathcal{O}(nkm)$.

### Payment algorithm (OVRAP_Payment)

In the optimal mechanism, the weighted VCG mechanism provides a way to calculate the payment price; however, the weighted VCG must rely on the premise of the offline allocation. In the online allocation, the resource requirements and the valuation for users who have not arrived cannot be predicted. Based on the dichotomy, we designed the OVRAP_Payment algorithm in the online environment. The algorithm is described as follows:

The OVRAP_Payment algorithm through the dichotomy continuously adjusts the user's bid $b_{i}$ to find the user's lowest winning price $p_{i}$ as the final payment price. The algorithm is guarantees that if $b_{i}>p_{i}$, the user is allocated successfully; otherwise, allocation fails. Line 6 calls OVRAP_Allocation to solve the allocation using the user's evaluation weight value. Line 13 represents that the weight value $w_{i}$ is involved in the final payment calculation, and if the operator evaluates poorly, the user will have to pay a higher price.

**Theorem 5**.: _The algorithm complexity of OVRAP_Payment is $\mathcal{O}(n^{2}km\log b_{\max})$, where $b_{\max}$ represents the maximum value of $b_{i}$._

Proof.: The OVRAP_Payment algorithm must calculate the payment price for the winning users $\mathbf{X}^{t}$, which is to be selected from algorithm 4; the worst case is $n$ users. Because line 14 of the algorithm calls the OVRAP_Allocation algorithm with an algorithm complexity of $\mathcal{O}(nkm)$, using the dichotomy to solve $b_{\max}$ results in a complexity of $\log b_{\max}$. Thus, the complexity of the OVRAP_Payment algorithm is $\mathcal{O}(n^{2}km\log b_{\max})$.

### Truthful

According to Definition 2, an auction mechanism that is truthful must result in each using having a truthful valuation $b_{i}$ as a dominant strategy. This means that users cannot obtain more benefits through untruthful valuations. In a virtual resource auction, we assume that the users submit true requirements but may submit untruthful valuations. Once the user resource allocation is successful, he will use these resources for a long period of time.

**Theorem 6**.: _The OVRAP mechanism is truthful._

**Proof.** 1. We assume that user $i$ is the winner in the resource allocation and his $k^{\prime}$th requirement is allocated. According to the OVRAP_Payment algorithm, his final payment price converges to

\[p_{i}=\min(f_{jk})\cdot\sum_{r\in R}(\frac{s_{ki^{\prime}r}}{c_{r}}\cdot h_{r}) \cdot e_{ki^{\prime}}\cdot\frac{1}{w_{i}}j\in A(\theta),\,k\in K_{i} \tag{9}\]

$\min(f_{jk})$ is the resource density of the last allocated user when the resource density is sorted in descending order, as the algorithm can guarantee that the $k^{\prime}$th requirement of user $i$ will be allocated successfully as long as $f_{ki^{\prime}}>\min(f_{jk})$. We obtain

\[p_{i} = \min(f_{jk})\cdot\sum_{r\in R}(\frac{s_{ki^{\prime}r}}{c_{r}}\cdot h _{r})\cdot e_{ki^{\prime}}\cdot\frac{1}{w_{i}} \tag{10}\] \[< f_{ki^{\prime}}\cdot\sum_{r\in R}(\frac{s_{ki^{\prime}r}}{c_{r}} \cdot h_{r})\cdot e_{ki^{\prime}}\cdot\frac{1}{w_{i}}=b_{i}\]

(1). If user $i$ submits an untruthful valuation $\hat{b}_{i}$, the $k^{\prime}$th requirement is still allocated if $\hat{b}_{i}\geq p_{i}$. According to formula (10), the user must pay

\[\hat{p}_{i}=\min(f_{jk})\cdot\sum_{r\in R}(\frac{s_{ki^{\prime}r}}{c_{r}} \cdot h_{r})\cdot e_{ki^{\prime}}\cdot\frac{1}{w_{i}}=p_{i},j\in A(\theta),\, k\in K_{i} \tag{11}\]

and the user utility value is $\hat{u}_{i}=b_{i}-\hat{p}_{i}=b_{i}-p_{i}=u_{i}$. Thus, if the user submits an untruthful valuation, his utility value does not increase.

(2). If user $i$ submits an untruthful valuation $\hat{b}_{i}<p_{i}$, we obtain

\[\hat{j}_{ki}=\frac{w_{i}\cdot\hat{b}_{i}}{\sum_{r\in R}(\frac{s_{ki^{\prime}r }}{c_{r}}\cdot h_{r})\cdot e_{ki^{\prime}}}<\min(f_{jk}),\,k\in K_{i} \tag{12}\]

According to the OVRAP_Allocation algorithm, the user will not win the resource allocation; thus, the user's utility value is $0<b_{i}-p_{i}=u_{i}$, which will reduce the utility value.

2. If we assume that user $i$ is the loser in the resource allocation, his utility value is $0$, and we obtain$\hat{j}_{ki}<\min(f_{jk}),\,k\in K_{i}$:

(1). If user $i$ submits an untruthful valuation $\hat{b}_{i}$, resulting in the $k^{\prime}$th requirement being allocated, the user must pay

\[\hat{p}_{i} = \min(f_{jk})\cdot\sum_{r\in R}(\frac{s_{ki^{\prime}r}}{c_{r}} \cdot h_{r})\cdot e_{ki^{\prime}}\cdot\frac{1}{w_{i}} \tag{13}\] \[> f_{ki^{\prime}}\cdot\sum_{r\in R}(\frac{s_{ki^{\prime}r}}{c_{r}} \cdot h_{r})\cdot e_{ki^{\prime}}\cdot\frac{1}{w_{i}}=b_{i},j\in A(\theta),\, k\in K_{i}\]

and the user's utility value is $\hat{u}_{i}=b_{i}-\hat{p}_{i}<0$, which reduces the utility value.

(2). If user $i$ submits an untruthful valuation $\hat{b}_{i}$, it is still not being allocated successfully; thus, the user's utility value is still 0, which does not improve the utility value.

In summary, in the OVRAP mechanism, the user can reveal only truthful valuation to maximize his utility value; thus, the truthful valuation is a dominant strategy, and the OVRAP mechanism is truthful.

## 6 Experimental results

Because cloud providers do not release users' data, we use the DAS-2 [25] from Grid Workloads as test data to simulate user requirements. DAS-2 is provided by the Advanced School for Computing and Imaging (ASCI). The DAS-2 data set contains user job IDs and the corresponding resource requirements. To ensure reasonable simulation data, we remove the jobs that have zero value for the CPUs and memory and storage requirements from the data set. The experimental platform hardware is configuredas follows: Pentium G630 CPU, 4 GB of memory, and 500 GB of storage. The experimental settings are as follows:

(1) We use $k$ jobs in the data set as user requirements. In each job, we use the CPU request, memory request, storage request, user arriving time, job start time, and job execution time to simulate the user requirements.

(2) We randomly generate a value from 1 to 10 to simulate users' bids $b_{i}$ and from 0 to 1 to simulate the users' evaluation weighted value $w_{i}$ and preset the capacity of various types of resources in $\mathbf{C}$ and the unit price of various types resources in $\mathbf{V}$.

(3) We use IBM CPLEX12 to program the optimal allocation algorithm and optimal payment algorithm.

(4) We use the C++ programming language to program the OVRAP algorithm.

The experimental cases are divided into small-scale (case 1-2), medium scale (case 3-4) and large-scale (case 5-6) based on the number of users, which reflects real auction environments. Table 5 shows the initial set of 6 cases as a prerequisite for all subsequent experiments. Each case of experiments verifies the OVRAP algorithm and the optimal algorithm theory by setting a different number of requirements $k$. Without loss of generality, we use CPU, memory, and storage to represent multiple resources, and each case has the same resource capacity (CPU: 50, Memory: 5000 GB, storage: 50,000 GB). Figs. 2-6 compare the social welfare,execution time, revenue, resource utilization, and served users of the two algorithms, respectively. Table VI compares the OVRAP algorithm with the existing algorithm OVMAP, which is a single-requirement online action mechanism [8].

Fig. 3 compares the OVRAP algorithm with the optimal algorithm from the social welfare perspective. OVRAP- $k$ or CPLEX-$k$ represents the result obtained from the corresponding algorithm when the user submits $k$ requirements. For a given capacity of resources, the number of requirements $k$ of each user has a significant impact on social welfare. When the user submits 20 groups (OVRAP-20, CPLEX-20), the resource provider will obtain a higher social welfare than when the user submits only 5 groups (OVRAP-5, CPLEX-5). This verifies Theorem 1, which states that the resource provider can obtain more social welfare when a user submits multiple requirements. The social welfare calculated by OVRAP has reached more than 80% of the optimal solution. The main difference between OVRAP and optimal (CPLEX) is that the optimal mechanism uses the static allocation method to obtain all of the user requirements before allocation, but the optimal solution does not satisfy the online model. Fig. 3 (10,000 users) illustrates that CPLEX cannot solve the optimal solution when there is a sufficiently large number of users because the resource allocation problem is NP-hard.

Fig. 4 compares the execution time of the OVRAP algorithm and the optimal algorithm. OVRAP is considerably faster than the optimal algorithm. The OVRAP algorithm is still able to calculate the feasible solution even when there is a large number of users (cases 5-6).

Fig. 5 compares the revenues of the OVRAP algorithm and optimal algorithm. To calculate the payment price, the optimal algorithm uses the weighted VCG mechanism, and OVRAP uses the online dichotomy. In Fig. 5, in certain cases (100 and 1000 users), the revenue of OVRAP is greater than those of the optimal algorithm, mainly because the OVRAP_Payment algorithm is based on the online model.

The experimental results in Figs. 3-5 show that the OVRAP mechanism can solve online multi-requirement, multi-resource allocation and pricing problems and is advantageous in terms of execution time and revenue.

Fig. 6 compares the resource utilization rates of OVRAP and the optimal algorithm. The resource utilization under the online model is defined as (_Allocated resource usage time/Total resource availability time_). For example, there are 5 CPUs available in the time period 1-10; thus, _the total resource availability time_ is 5 '10 = 50. Assume that 3 CPUs are allocated during the period (1, 7) and 2 CPUs are allocated during the period (6, 10). _The allocated resource usage_ time is 3 '6 + 2 '4 = 26, and the resource utilization is 26/50. The online allocation is difficult to exhaust all resources at the same time, and as a result, the resource utilization is not high. However, the resource utilization of OVRAP can reach approximately 60% of that of the optimal solution in certain cases.

Fig. 7 compares the served users of OVRAP and the optimal algorithm. The difference between OVRAP and the optimal algorithm is not obvious. In cases 1 and 2, the two algorithms both serve more than 50% of the users, whereas the percentage of served users is lower in cases 3-6. This trend occurs because in cases 3-6, the resource usage time period does not increase with the number of users, making the competition for resources more intense and thus causing the percentage of served users to decline.

We also implement the online resource allocation algorithm OVMAP in [8]. OVMAP is implemented using the greedy method, and it can satisfy the condition that a user can submit only a single requirement in an online auction. We designed 3 cases to compare

\begin{table}
\begin{tabular}{c c c c} \hline Case & Number of users (n) & Number of requirements ($k$) & Resource capacity (CPU, Memory, storage) \\ \hline
1 & 100 & 5 & $(50,5000,5000)$ \\
2 & 100 & 20 & $(50,5000,5000)$ \\
3 & 1 000 & 5 & $(50,5000,5000)$ \\
4 & 1000 & 20 & $(50,5000,5000)$ \\
5 & 10,000 & 5 & $(50,5000,5000)$ \\
6 & 10,000 & 20 & $(50,5000,5000)$ \\ \hline \end{tabular}
\end{table} TABLE V: Initial set of 6 cases in the experiment.

Fig. 4: OVRAP versus optimal (CPLEX): Execution time.

Fig. 5: OVRAP versus optimal (CPLEX): Revenue.

Fig. 3: OVRAP versus Optimal (CPLEX): Social welfare.

the social welfares and execution times of the OVRAP algorithm, OVMAP algorithm, and optimal algorithm. The resource capacity is (CPU: 50, Memory: 5000 G, storage: 50,000 GB), which is the same as in the previous test. In these cases, we first set $k=1$ in the OVRAP algorithm and optimal algorithm.

The results illustrate that the OVRAP algorithm has notable advantages compared to the OVMAP algorithm in solving the social welfare, as our social welfare model (formula (1)) and _resource density_ model are more reasonable. The OVRAP algorithm is also considerably faster than the optimal algorithm. Furthermore, the social welfare is lower under the traditional resource auction mechanism ($k=1$) than when the user can submit multiple requirements ($k>1$).

## 7 Conclusions

We propose an online virtual resource auction mechanism for cloud computing environments that is based on the users' evaluation value and cost. The theoretical analysis and experimental results demonstrate that allowing users to submit multiple requirements in online auctions can improve the social welfare and revenue for resource providers considerably while still satisfying the diversity of users' requirements. Compared to the optimal solution calculated by CPLEX, the OVRAP algorithm has a shorter execution time and can ensure that the auction mechanism is truthful. OVRAP also performs well in terms of resource utilization. Even if the user can submit only a single requirement, OVRAP still has clear advantages compared to the previous algorithm. Finally, OVRAP considers the interests of users and resource providers when determining the payment price. In future work, we will design a resource allocation algorithm based on the PTAS mechanism to prove its competitive ratio and improve the practicality of the auction mechanism.

## Acknowledgments

The authors thank IBM for providing the full version of CPLEX12, which sets no limitations for solving the optimal solution. This work is supported in part by the National Natural Science Foundation of China (Nos. 61762091, 61662088, 61472345, and 61402398), the Project of the Natural Science Foundation of Yunnan Province of China (Nos. 2014FA023, and 2014FB114), the Scientific Research Foundation of Yunnan Provincial Department of Education (2017ZZX228), and the Program for Excellent Young Talents, Yunnan University, China.

## References

* (1) Amazon EC2 Instance Types [OL], [2017-7-1] [https://amazonaws-china.com/cn/ec2/instance-types/](https://amazonaws-china.com/cn/ec2/instance-types/).
* (2) M.N. Nejad, L. Mashayekhy, D. Grosu, Truthful greedy mechanisms for dynamic virtual machine provisioning and allocation in clouds, IEEE Trans. Parallel Distrib. Syst. 26 (2) (2015) 594-603.
* (3) V.M. Teo, M. Muhliese, A strategy-proof pricing scheme for multiple resource type allocations, in: Proc of International Conf on Parallel Processing, ISE, Piscataway, NJ, 2009, pp. 172-179.
* (4) L. Mashayekhy, M.M. Nejad, D. Grosu, A PTAS mechanism for provisioning and allocation of heterogeneous cloud resources, IEEE Trans. Parallel Distrib. Syst. 26 (9) (2015) 2386-2399.
* (5) T. Sandholm, S. Suri, A. Gilpin, et al., CAROB: A fast optimal algorithm for winner determination in combinatorial auctions, Manage. Sci. 51 (3) (2005) 374-390.
* (6) Q. Wu, J.K. Hao, A clique-based exact method for optimal winner determination in combinatorial auctions, Inform. Sci. (334) (2016) 103-121.
* (7) J. Lai, D. Parkes, Monotone branch-and-bound search for restricted combinatorial auctions, in: Proc of the 13th ACM Conf on Electronic Commerce, ACM, New York, 2012, pp. 705-722.
* (8) L. Mashayekhy, M.M. Nejad, D. Grosu, et al., Incentive-compatible online mechanisms for resource provisioning and allocation in clouds, in: IEEE, International Conference on Cloud Computing, IEEE, 2014, pp. 312-319.
* (9) L. Mashayekhy, M.M. Nejad, D. Grosu, et al., An online mechanism for resource allocation and pricing in clouds, IEEE Trans. Comput. 65 (4) (2016) 1172-1184.
* (10) W. Shi, L. Zhang, C. Wu, et al., An online auction framework for dynamic resource provisioning in cloud computing, IEEE/ACM Trans. Netw. 24 (4) (2016) 2060-2073.
* (11) H. Zhang, B. Li, H. Jiang, et al., A framework for truthful online auctions in cloud computing with heterogeneous user demands, in: INFOCOM, 2013 Proceedings IEEE, IEEE, 2013, pp. 1510-1518.

\begin{table}
\begin{tabular}{c c c c c c c} \hline Number of users ($n$) & OVRAP & OVMAP & & Optimal (CPLEX) & \\ \hline Social welfare & Execution time & Social welfare & Execution time & Social welfare & Execution time \\ \hline
100 & 320 & 46 ms & 292 & 42 ms & 352 & 658 ms \\
1 000 & 951 & 487 ms & 896 & 442 ms & 1176 & 2976 ms \\
10,000 & 4463 & 12 708 ms & 4203 & 11056 ms & None & None \\ \hline \end{tabular}
\end{table}
Table 6: OVRAP ($k=1$) versus OVMAP [8].

Figure 6: OVRAP versus optimal (CPLEX) resource utilization.

Figure 7: OVRAP versus optimal (CPLEX): Served users.

* (12) H. Zhang, H. Jiang, B. Li, et al., A framework for truthful online auctions in cloud computing with heterogeneous user demands, IEEE/ACM Trans. Comput. 65 (3) (2016) 805-818.
* (13) H. Kellerer, U. Pferschy, D. Pisinger, Introduction to NP-Completeness of Knapsack Problems, in: Knapsack Problems, Springer, Berlin, 2004, pp. 483-493.
* (14) N. Jain, I. Menache, J.S. Naor, et al., A truthful mechanism for value-based scheduling in cloud computing, Theory Comput. Syst. 54 (3) (2014) 388-406.
* (15) S. Zaman, D. Grosu, Combinatorial auction-based dynamic vm provisioning and allocation in clouds, in: Proc of the 2011 IEEE Third International Conf on Cloud Computing Technology and Science, (CloudCom), IEEE, Piscataway, NJ, 2011, pp. 170-114.
* (16) S.Zaman, D. Grosu, Combinatorial auction-based allocation of virtual machine instances in clouds, J. Parallel Distrib. Comput. 73 (4) (2013) 495-508.
* (17) G. Wei, A.V. Vasilakos, Y. Zheng, et al., Azure-theoretic method of fair resource allocation for cloud computing services, J. Supercomput. 54 (2) (2010) 252-269.
* (18) L. Mashayekhy, N. Fisher, D. Grosu, Truthful mechanisms for competitive reward-based scheduling, IEEE Trans. Comput. 65 (7) (2016) 2299-2312.
* (19) T. Nisan, Roughgarden, E. Tardos, V. Vazirani, Algorithmic Game Theory, Cambridge Univ. Press, Cambridge, 2007, pp. 218-233.
* (20) F. Xu, F. Liu, H. Jin, et al., Managing performance overhead of virtual machines in cloud computing: A survey, state of the art, and future directions, Proc. IEEE 102 (1) (2013) 11-31.
* (21) D. Xu, X. Liu, A.V. Vasilakos, Traffic-aware resource provisioning for distributed clouds, IEEE Cloud Comput. 2 (1) (2015) 30-39.
* (22) M.R. Rahimi, N. Venkatasubramanian, S. Mehrotra, et al., MAPCloud: Mobile applications on an elastic and scalable 2-tier cloud architecture, in: IEEE/ACM Fifth International Conference on Utility and Cloud Computing, IEEE Computer Society, 2012, pp. 83-90.
* (23) M.R. Rahimi, N. Venkatasubramanian, S. Mehrotra, et al., On optimal and fair service allocation in mobile cloud computing, Comput. Sci. 2801 (2013) 75-82.
* (24) Baidu cloud Instance Types [OL], [2017-7-1] [https://cloud.baidu.com/calcult.or.html#/bcc/price](https://cloud.baidu.com/calcult.or.html#/bcc/price)..
* (25) Grid Workloads Archives [OL], [2016-11-2] [http://gwa.ewi.tudelft.nl](http://gwa.ewi.tudelft.nl).
* (26) Jixian Zhang born in 1980. He received the M.S. degree in computer science from University of Electronic Science and Technology of China in 2006, and received the Ph.D. degree in computer science from University of Electronic Science and Technology of China in 2010. He is a lecturer at Yunnan University. His research interests include distributed system, cloud computing, mobile computing. Ning Xie born in 1991. She received the BSc degree in computer science from Northeast Normal University in 2014. She is currently working toward the M.S. degree at Yunnan University. Her research interests include virtual resource allocation in cloud computing, service-oriented computing. \\ \end{tabular} \begin{tabular}{c c}  & Xuejie Zhang received the masters degree in computer science engineering, from Harbin Institute of Technology in 1990. He received the Ph.D. degree in computer science engineering from The Chinese University of Hong Kong in 1998. He is currently a professor with the Department of Computer Science and Engineering of Yunnan University. His main research interests are high performance computing, distributed systems, and computer networks. \\ \end{tabular} 
\begin{tabular}{c c}  & Weidong Li received the Ph.D. degree in department of mathematics, from Yunnan University in 2010. He is currently an associate professor at Yunnan University. His main research interests are combinatorial optimization, approximation algorithm, randomized algorithm and cloud computing. \\ \end{tabular}