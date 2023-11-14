# An online auction mechanism for time-varying multidimensional resource allocation in clouds

Jixian Zhang

School of Information Science and Engineering, Yunnan University, Kunming, Yunnan 650504, PR China

Xutao Yang

School of Information Science and Engineering, Yunnan University, Kunming, Yunnan 650504, PR China

Ning Xie

School of Information Science and Engineering, Yunnan University, Kunming, Yunnan 650504, PR China

Xuejie Zhang

School of Information Science and Engineering, Yunnan University, Kunming, Yunnan 650504, PR China

Athanasios V. Vasilakos

School of Information Science and Engineering, Yunnan University, Kunming, Yunnan 650504, PR China

Weidong Li

School of Information Science and Engineering, Yunnan University, Kunming, Yunnan 650504, PR China

###### Abstract

Multidimensional resource allocation is a hot topic in cloud computing, but current cloud platforms support only fixed resource allocation, that is, the user resource requirements are consistent throughout the usage period, which may cause a waste of resources and reduce the revenue of resource providers. Therefore, time-varying multidimensional resource allocation and the corresponding pricing mechanism represent a new challenge in cloud computing. We address the problem of online time-varying multidimensional resource allocation and pricing in clouds. Specifically, (1) we propose a novel integer programming model for the time-varying multidimensional resource allocation problem and (2) we design a truthful online auction mechanism for resource allocation in a competitive environment. For the resource allocation algorithm, we propose a waiting period strategy and dominant-resource-based strategy to improve the social welfare and resource utilization. Simultaneously, a payment pricing algorithm based on critical value theory is proposed. Finally, we prove that the mechanism is truthful and individual rationality. Compared with existing research, our approach is characterized by high social welfare, high resource utilization and short execution time.

1
Footnote 1: [https://doi.org/10.1016/j.future.2020.04.029](https://doi.org/10.1016/j.future.2020.04.029)

0167-3930/L 2020 Elsevier B.V. All rights reserved.

## 1 Introduction

Resource allocation is an important topic in cloud computing. On the cloud platform, users submit their requirements, which involves multiple resource requirements and time constraints, such as arrival time, execution time, and deadline. Therefore, a reasonable resource allocation algorithm must be designed. Many resource allocation problems can be transformed into a multidimensional knapsack problem (MRP) or its variants [1, 2, 3, 4, 5, 6]. Resource providers have introduced auction mechanisms into cloud computing to allow idle resources to be sold at a dynamic price for greater profit. Amazon EC2 [7] was the first provider to use this approach in practice, and providers such as Alibaba Cloud [8] have provided similar methods. The main issue of mechanism design is the truthfulness feature (also known as incentive compatibility or strategy proof) [9], that is, the user should not be able to obtain more profits from submitting an untruthful resource requirement. In order to adapt to the resource allocation, the auction mechanisms are divided into two types: offline and online. In offline allocation-based auctions, all users' requirements and bids must be collected in advance; this has the advantage of obtaining higher social welfare but the disadvantage of users needing to wait for a period of time before the resource allocation is conducted. The advantage of online allocation-based auctions is that the user can enter at any time, and the user's demands for a pay-as-you-go process are satisfied. However, the disadvantage is that optimal resource allocation cannot be achieved, and the total social welfare is lower than that of the offline mode [9].

According to data released by Alibaba in 2019 [10], users have a strong willingness to design their resource usage based on time periods. However, in current research, both offline resource allocation and online resource allocation are based on fixed user resource requirements; that is, the user's resource requirements are consistent throughout the time period of using the resource, which wastes resources. For example, the server of a taxi APP does not need many resources to process data at night. Therefore, a time-varying resource allocation and a corresponding pricing mechanism represent a new challenge in cloud computing. Time-varying resource means the user resource requirements can be different over time. Specifically, for resource providers, time-varying resource requirements can improve resources utilization and serve more users in a competitive environment, which increases the profits of resource providers. For users, because the resource requirements at different moments can be accuratelydefined, the resource use costs are reduced. This scenario is a win-win situation. The data provided by the Alibaba Global Scheduling Algorithm Competition already contain time-varying resource requirement information, and the competition openly seeks a solution to this resource allocation problem globally. Therefore, both the academic community and industry reflect the importance of this issue.

### Our contribution

We address the problem of online time-varying multidimensional resource allocation and pricing in clouds. Specifically, we propose a novel integer programming model for the time-varying resource allocation problem and design a truthful online auction mechanism to solve the pricing problem in a competitive environment.

The auction mechanism includes a corresponding resource allocation algorithm and a payment pricing algorithm. In the resource allocation algorithm, we design a waiting period strategy that can obtain additional user requirements over a period of time while achieving better online resource allocation. Furthermore, we propose a dominant-resource-based strategy to make the resource allocation algorithm more reasonable. These two approaches can significantly improve the social welfare and resource utilization for the resource providers.

To ensure the truthfulness of the mechanism, a payment pricing algorithm based on a dichotomy and satisfying critical value theory is proposed.

We compare the proposed algorithm with the offline optimization algorithm and the state-of-the-art algorithm [11] in terms of social welfare, execution time, and resource utilization. The experimental results demonstrate that our approaches achieve good results.

### Organization

The remainder of this paper is organized as follows. In Section 2, we discuss existing studies on cloud computing resource allocation. In Section 3, we describe the time-varying resource allocation problem and models in the cloud. In Section 4, we introduce the offline optimal auction mechanism design. In Section 5, we design an online auction mechanism and propose a corresponding online resource allocation algorithm and payment pricing algorithm. Finally, we prove that the mechanism is truthful. In Section 6, we evaluate the mechanisms through extensive experiments. In Section 7, we summarize our results and present possible directions for future research.

## 2 Related works

Many researchers are exploring the optimal solution for the offline resource allocation problem that can maximize the social welfare of resource providers. Angelelli et al. [4] considered an interval scheduling problem, where $n$ jobs are carried out by $m$ nonidentical machines in an offline-scheduling manner, and proposed a column generation scheme for obtaining the optimal solution. Zhou et al. [3] obtained the optimal solution by utilizing a branch-and-bound search method for a similar problem. Wu et al. [12] transformed a combinatorial resource auction into a winner decision problem and used an clique-based method to obtain the optimal solution. The above studies use different methods to find the optimal solution for offline resource allocation. However, the constrained resource allocation problem is NP-hard [13], and it is impossible to obtain an optimal solution in polynomial time. Thus, combining optimal algorithms and mechanisms cannot solve many practical problems.

Therefore, in the offline mechanism design, approximate and heuristic methods are often used for resource allocation and payment calculation. Nejad et al. [1] formulated the dynamic virtual machine (VM) provisioning and allocation problem for the auction-based model as an integer program and designed truthful greedy and optimal mechanisms for the problem. Mashayekhy et al. [2] addressed the problem of autonomic VM provisioning and allocation of heterogeneous cloud resources for the auction-based model by designing an approximation mechanism. Mashayekhy et al. [14] proposed two truthful mechanisms (an exact and approximate) to solve competitive reward-based scheduling. Liu et al. [5] proposed an n-approximation mechanism to solve the problem of heterogeneous physical machine resource management. Zhang et al. [15] proposed a heuristic mechanism to solve the multi-requirements virtual resource allocation of cloud computing. Nonetheless, the approximation mechanism often causes the execution time of the algorithm to increase rapidly with a decrease in $\varepsilon$, and the heuristic mechanism has the disadvantage of low social welfare. In terms of economics, [1, 2, 5, 14, 15] proved the truthfulness of the mechanism via monotonicity and critical value theory, while [5] proved the individual rationality. However, the offline mechanism requires prior knowledge of all user requirements, so more researchers have begun to study online resource allocation and the corresponding mechanism design, which is more suitable for practical situations.

Online resource allocation does not result in the optimal solution, so researchers prefer to study the approximation of online algorithms. Zhang et al. [16], by means of cost-efficient online resource scheduling, presented a randomized online stack-centric scheduling algorithm and theoretically proved the lower bound of its competitive ratio. Zheng et al. [17] studied the problem of online scheduling for deadline-sensitive jobs and developed efficient online multiresource allocation algorithms that achieve low competitive ratios for both continuous and discrete job models. Tang et al. [18] developed new approaches to the competitive analysis of the commonly used first fit packing algorithm for the MinUsageTime dynamic bin packing problem, and they established a new upper bound of $\mu$ + 4 on the competitive ratio of first fit packing. Skutella et al. [19] proposed robust polynomial-time approximation schemes for parallel machine scheduling that could achieve $(1+\varepsilon)$ competitive solutions for any $(\varepsilon>0)$.

At the same time, the design of online mechanisms has attracted increasing attention. Mashayekhy et al. [11] proposed an online virtual machine allocation and pricing (OVMAP) mechanism for virtual machine instance deployment. Zhang et al. [6] proposed a heuristic mechanism to solve multi-requirement online resource allocation, and they considered the impact of user evaluation and usage cost on the total social welfare. Shi et al. [20] presented an online combinatorial auction mechanism for the VM market in cloud computing and transformed the online resource allocation problem into a continuous static resource allocation problem for a period of time. Additionally, they used a primal-dual algorithm to obtain the approximate resource allocation solution. Chen et al. [21] focused on the online restart and resume job scheduling mechanism design and studied the maximization of social welfare via competitive analysis. Zhang et al. [22] designed COCA, an incentive-compatible online cloud auction mechanism that ensures truthfulness by means of a monotonic payment rule and a utility-maximizing allocation rule. Zhang et al. [23] designed a truthful, online primal-dual optimization framework for VM allocation to maximize the social welfare and using dual variables to guarantee truthfulness. In terms of economics, [6, 11, 21] proved the truthfulness of the mechanism via monotonicity and critical value theory, while [20] proved truthfulness by the definition. Among these studies, [11, 20, 21, 23] also proved the individual rationality. However, all of these prior 

[MISSING_PAGE_FAIL:3]

[MISSING_PAGE_FAIL:4]

dominant-resource-based strategy as the basis for allocation algorithm sorting. We define the _dominant resources proportion_$\text{dr}_{i}$ as follows.

\[\text{dr}_{i}=\max_{r}\frac{\max_{r}s_{\text{dr}_{i}}^{\text{r}}}{c_{r}},\;\forall r \in R,\;\tau\in\{1,2,\ldots,e_{i}\} \tag{4}\]

where $\frac{s_{\text{dr}_{i}}^{\text{r}}}{c_{r}}$ is the ratio of the demand for the $r$th resource of user $i$ at time $r$ to the capacity of the $r$th resource provided by the resource provider. A larger $\text{dr}_{i}$ indicates that the demand of user $i$ requires a greater amount of his dominant resource (such as CPU). If the allocation is implemented, it will have a greater impact on the remaining amount of this resource.

Then, we define _resource densitlyf_, according to $\text{dr}_{i}$ as follows.

\[f_{i}=\frac{b_{i}}{\text{dr}_{i}e_{i}},\;\forall i\in U \tag{5}\]

$f_{i}$ will be used as the basis for the sorting of the following resource allocation algorithm. Under the greedy strategy, the algorithm will be more inclined to users with higher bids, shorter task execution time, and smaller dominant resource proportions.

Similarly, _bid densityf_ is used as the basis for sorting in the resource allocation algorithm OVMAP [11]; unfortunately, OVMAP does not support time-varying resource requirements. To compare OVMAP with our algorithm, we modified the bid density $\widehat{f}_{i}$ as follows.

\[\widehat{f}_{i}=\frac{b_{i}}{\sum_{\tau=1}^{e_{i}}\prod_{r\in R}s_{\text{dr}} ^{\text{r}}},\;\forall i\in U \tag{6}\]

If the user resource requirements are the same in all time slots, $\widehat{f}_{i}$ is equivalent to _bid density_ in [11].

#### 5.1.3 Example

Table 2 shows the requirement information for 5 users, including the resource demand at various time slots. For convenience, we assume that all users have the same deadline time slot of 7. The resource capacity is $(5,5,5)^{\text{T}}$ for CPU, memory and storage resources. Define the parameter $\alpha=0,1,2,3,4$ and run the allocation and payment algorithms every $\alpha$ time slot interval. When $\alpha=0$, the algorithm is equivalent to a classical online algorithm, such as OVMAP in [11]; that is, the resource requirement is immediately processed in the time slot in which the user arrives.

Fig. 2 shows the resource allocation solution obtained using our approach when the parameter $\alpha$ takes on different values. Table 3 shows that as $\alpha$ increases, the social welfare increases. Such a result illustrates that the waiting period strategy achieves better performance than that of the existing online allocation algorithms, such as OVMAP in [11], which is the main comparison algorithm in this paper.

Based on the user requirement data in Table 2, we compare the impact of _resource density_$f_{i}$ and _bid density_$\widehat{f}_{i}$ on the resource allocation algorithm in Table 4. The allocation algorithm will usually select the winning users according to these densities; however, the bid-density-based sorting algorithm cannot select cost-effective requirements, such as $u_{u}$, and instead chooses the lower social welfare $u_{2}$ and $u_{3}$. From Fig. 2, we can see that the total resources $u_{2}$ and $u_{3}$ are higher than $u_{4}$, but the total social welfare of $u_{2}$ and $u_{3}$ is lower than that of $u_{4}$, which shows that the dominant-resource-based strategy will increase social welfare and conserve space to support other requirement allocations.

### Online dominant resource allocation and pricing mechanism

The online dominant resource allocation and pricing (ODRAP) mechanism includes a resource allocation algorithm, ODRAP_, ALOC, and a payment price algorithm, ODRAP_PAY. These algorithms are invoked in every $\alpha=0,1,\ldots,T$ time slot interval. When $\alpha$= 0, the ODRAP is equivalent to the classical single-round online mechanism. When $\alpha\neq 0$, the total time period $[1,T]$ can be divided into $K_{u}$ periods, and the ODRAP is invoked at the end of every $k\in\{1,2,\ldots,K_{u}-1\}$ period to obtain the user requirement allocation and payment solution in the current period. The Algorithm (1) represents the framework of ODRAP, where the matrix

\[\textbf{C}=\begin{bmatrix}c_{1}^{1}&\cdots&c_{1}^{T}\\ \cdots&\cdots&\cdots\\ c_{m}^{1}&\cdots&c_{m}^{T}\end{bmatrix} \tag{7}\]

records the resource usage of all time slots in the range $[1,T]$. Each column represents the resource allocation of a certain time slot $t\in[1,T]$. Before first executing ODRAP, we initialize each column of the matrix **C** with the vector of the resource capacity $\textbf{c}=(c_{1},c_{2},\ldots,c_{m})^{\text{T}}$. Whenever the ODRAP is invoked, the resource matrix **C** is updated, which involves the allocation of newly arriving requirements and the release of expired resources.

The ODRAP_ALOC algorithm ($\alpha\neq 0$) is as follows.

* For period $k\in\{1,2,\ldots,K_{u}-1\}$, define the _dominant resources proportion$\text{dr}_{i}^{k}$_ of each user $i$ in the set $\boldsymbol{\theta}^{k}$, which includes the users who have not been allocated resources

\begin{table}
\begin{tabular}{l l l l l l} \hline ID & $f_{i}$ (_resurcedensity_) & $\widehat{f}_{i}$ (_bidensity_) \\ \hline $u_{1}$ & 1.00 & 0.17 \\ $u_{2}$ & 2.50 & 0.40 \\ $u_{3}$ & 5.00 & 0.33 \\ $u_{4}$ & 6.67 & 0.25 \\ $u_{5}$ & 11.1 & 0.48 \\ \hline \end{tabular}
\end{table}
Table 4: The effect of resource density and bid density on algorithm sorting.

\begin{table}
\begin{tabular}{l l l l l l l} \hline ID & CPU & Memory & Storage & Execution & Arrive & Deadine & bid \\  & time & time & time slot & time slot & time slot \\ \hline $u_{1}$ & $(1,$ 1, 1, 1, 2) & $(1,$ 1, 1, 2) & $(1,$ 1, 1, 1, 2) & 5 & 1 & 7 & 2 \\ $u_{2}$ & $(2,$ 1, 1) & $(1,$ 1, 1, 1) & $(2,$ 2, 2, 2) & 4 & 1 & 7 & 4 \\ $u_{3}$ & $(1,$ 1, 2) & $(2,$ 2, 2) & $(2,$ 2, 2, 2) & 4 & 2 & 7 & 8 \\ $u_{4}$ & $(3,$ 3, 2) & $(2,$ 2, 2) & $(3,$ 3, 3) & 3 & 3 & 7 & 12 \\ $u_{5}$ & $(2,$ 2, 3) & $(3,$ 3, 3) & $(2,$ 2, 2) & 3 & 4 & 7 & 20 \\ \hline \end{tabular}
\end{table}
Table 2: The user requirement sample.

\begin{table}
\begin{tabular}{l l l l l l} \hline  & $\alpha=0$ & $\alpha=1$ & $\alpha=2$ & $\alpha=3$ & $\alpha=4$ \\  & & (OVMAP [11]) & & & \\ \hline $u_{1}$ & $\surd$ & $\surd$ & $\surd$ & & \\ $u_{2}$ & $\surd$ & $\surd$ & $\surd$ & & \\ $u_{3}$ & $\surd$ & $\surd$ & $\surd$ & $\surd$ & \\ $u_{4}$ & & & & & $\surd$ & $\surd$ \\ $u_{5}$ & & & & & $\surd$ & $\surd$ \\ Social welfare & 14 & & 14 & 14 & 20 & 32 \\ \hline \end{tabular}
\end{table}
Table 3: Resource allocation solution for different $\alpha$.

during their window period.

\[\begin{array}{l}\text{d}r_{i}^{k}=\max_{r}\frac{\max_{r}s_{r}^{k}}{\epsilon_{r} },\\ \forall r\in R,\quad\tau\in\{1,2,\dots,\epsilon_{i}\},\quad k\in\{1,2,\dots,K_{ \alpha}-1\}\end{array} \tag{8}\]

The advantage of using dominant resource allocation is that it can make the consumption rate of each resource as consistent as possible.
* Define the _resource density${}_{i}^{k}$_ according to ${}_{i}^{k}$ as follows: \[\begin{array}{l}f_{i}^{k}=\frac{b_{i}}{d{r_{i}^{k}}\epsilon_{i}},\ \forall i\in U,\quad k\in\{1,2,\dots,K_{\alpha}-1\}\end{array}\] (9)
* Sort $f_{i}^{k}$ in descending order; then, allocate resources according to this order and update the resource capacity matrix $\mathbf{C}$ until all user requirements in $\boldsymbol{\theta}^{k}$ are processed or the remaining resources of the current period are exhausted.

Algorithm (2) is ODRAP_ALLOC, in which lines 1-3 obtain the resource density of all unallocated requirements in the current period according to the dominant resource proportion and sort them into set $D$. Lines 5-13 determine whether the users' requirements can be allocated successfully according to the order in the set $D$. $alloc\_flag=1$ indicates that the remaining resources can satisfy the current user requirement in period $k$. Lines 14-23 update the allocation success information, and lines 20-22 update the columns in the resource capacity matrix $\mathbf{C}$ that are affected by the resource allocation. Note that although resources are allocated in descending order of set $D$, the winning users are not necessarily contiguous. For example, in set $D$, the initial two users are winners, but the third user may not be allocated successfully, and the fourth user may be allocated successfully. This is because the resource requirements submitted by the user

Fig. 2: Resource allocation solution under different $\alpha$.

vary dynamically over time. It is possible that the third user will need a large amount of resources in a certain time slot, but the remaining resources of the corresponding time slot are insufficient and cannot be satisfied. However, such a situation does not affect the truthful feature of the auction mechanism. ODRAP_ALLOC describes the resource allocation algorithm when $\alpha\neq 0$. When $\alpha$=0, we can execute a similar algorithm in each time slot instead of period $k$, which is equivalent to the classical single-round online allocation. The time complexity of ODRAP_ALLOC is $O(mn\max e_{i})$.

Meanwhile, the _critical value_ theory implies that the user final payment price is determined by other users' bids, and the dichotomy can satisfy this characteristic. Thus, we choose a dichotomy to design our payment price algorithm ODRAP_PAY (3) for online environments. The basic principle of ODRAP_PAY is to continuously reduce the bid of the winning user until the lowest price that ensures winning is identified as his payment price. The time complexity of ODRAP_PAY is $O(mn^{2}\max e_{i})$.

```
0: Current period: $k$: The output of the ODRAP_ALLOC algorithm: $\mathbf{X}^{k}$: The resource capacity matrix at the beginning of the current period $k$: $\mathbf{C}$: The user requirements that are in window period $\{a_{i},d_{i}-e_{i}+1\}$ but have not been allocated at the beginning of the current period $k$: $\mathbf{\theta}^{k}$:
0: The payment solution at the current period $k$: $\mathbf{p}^{k}$:
1:$\varepsilon\leftarrow 10^{-6}$:
2:for all$i\in\{i|x_{\omega_{i}}=1,\ x_{\omega_{i}}\in\mathbf{X}^{k}\}$do
3:$\textit{UB}_{i}\gets b_{i}$; $\textit{LB}_{i}\gets 0$; $b_{i}\leftarrow(\textit{UB}_{i}+\textit{LB}_{i})/2$;
4:while ($\langle\textit{UB}_{i}-\textit{LB}_{i}|\geq\varepsilon\rangle$do
5:$\mathbf{C}\leftarrow\mathbf{C}$;
6:$(V^{k})^{*},(\mathbf{X}^{k})^{*}\leftarrow$ODRAP_ALLOC($k,\ \theta^{k},\mathbf{C}$);
7:if$x_{\omega_{i}}\in(\mathbf{X}^{k})^{*}$then
8:$\textit{UB}_{i}\gets b_{i}$;
9:$\textit{b}_{i}\leftarrow(\textit{UB}_{i}+\textit{LB}_{i})/2$;
10:else
11:$\textit{LB}_{i}\gets b_{i}$;
12:$\textit{b}_{i}\leftarrow(\textit{UB}_{i}+\textit{LB}_{i})/2$;
13:endif
14:endwhile
15:$p_{i}\leftarrow(\textit{UB}_{i}+\textit{LB}_{i})/2$;
16:$\mathbf{P}^{k}\leftarrow\mathbf{P}^{k}\cup\{p_{i}\}$;
17:endfor
18:return$\mathbf{P}^{k}$;
```

**Algorithm 3** ODRAP_PAY.

### Example of ODRAP execution

We use the information in Tables 2, 3, and 4 to show how the mechanism is implemented. For convenience, we only consider the case of $\alpha=3$, and the resource capacity remains $(5,5,5)^{7}$. From Table 5, we can see in time slot 1 that requirements 1 and 2 arrive; at this time, only requirements 1 and 2 are in the current pending set $\mathbf{\theta}^{k}$, and since $\alpha=3$, the ODRAP algorithm continues to wait. In time slot 2, requirement 3 arrives, $\mathbf{\theta}^{k}$ contains requirements 1, 2, and 3, and ORRAP continues to wait. In time slot 3, requirement 4 arrives, and $\mathbf{\theta}^{k}$ contains requirements 1, 2, 3, and 4. At the end of time slot 3, ODRAP calculates the resource density (Table 4) of each requirement and the corresponding payment price. In time slot 4, resources are allocated to requirements 3 and 4 according to the resource density. At this time, user 5 arrives, but requirement 1 cannot be completed within the deadline and is removed from $\mathbf{\theta}^{k}$. Therefore, at this time, $\mathbf{\theta}^{k}$ contains requirements 2 and 5 and waits for the next round of allocation.

According to ODRAP_PAY, user 3 and user 4 need to pay 4 and 4.5 for their requirements, respectively, and the service provider achieves revenue of 8.5 during this period. According to Definition 1, it can be observed that user 3's utility value is $5-4=1$ and user 4's utility value is $12-4.5=7.5$. This example also represents the importance of the truthfulness mechanism. Assuming that user 3 misreports his bid $b_{3}^{*}$, which remains greater than his payment price of 4, in this scenario, user 3 remains selected, and the utility value of user 3 remains unchanged. If user 3 misreports his bid $b_{3}^{*}$, which is less than his payment price of 4, then user 3 will not win in this period, resulting in a utility value of 0. Similarly, user 4 can obtain the same result. This shows that users cannot obtain greater profits in the auction by misreporting their bid; therefore, a truthful bid is the user's dominant strategy. In addition, users may misreport their resource requirements, and we will provide a detailed proof in the next section.

### Properties of ODRAP

**Theorem 1**: ODRAP provides _Individual Rationality_.

**Proof.** Assuming that user $i$ is the winning user in period $k$, now we need to prove that if user $i$ submits his true requirement, then his utility value is nonnegative. The ODRAP_PAY uses the dichotomy as the payment pricing algorithm. For any winning user $i$, the payment price converges to

\[p_{i}=\min(f_{i}^{k})\cdot d\tau_{i}^{k}e_{i},\ \ \ k\in\{1,2,\ldots K_{\alpha}-1\} \tag{10}\]

obviously, since according to the ODRAP_ALLOC algorithm, when the resource density of all winning users is slightly larger than that of the first losing user, they will still win, so the resource density of the winning users will eventually converge to a constant. Define $\min(f_{i}^{k})$ as the resource density of the first losing user according to the resource density in descending order in period $k$. If user $i$ is the winning user in period $k$, it can be observed that $f_{i}^{k}\geq\min(f_{i}^{k})$; thus,

\[\begin{array}{l}p_{i}=\min(f_{i}^{k})\cdot d\tau_{i}^{k}e_{i}\leq f_{i}^{k} \cdot d\tau_{i}^{k}e_{i}=b_{i},\ i\in\mathbf{A}(\mathbf{\theta}^{k}),\\ k\in\{1,2,\ldots,K_{\alpha}-1\}\end{array} \tag{11}\]

ODRAP_PAY always obtains a payment $p_{i}\leq b_{i}$; therefore, the utility value of user $i$ is $u_{i}=b_{i}-p_{i}\geq 0$, and user $i$ never losses. If user $i$ does not win, he obtains 0 utility value. Therefore, the ODRAP algorithm provides _Individual Rationality_, which satisfies Definition 2.

**Theorem 2**: ODRAP_PAY is based on critical value theory._

**Proof.** According to Formula (10) in Theorem 1, the payment price of the winning user $i$ depends on the resource density of the first losing user according to the resource density descending order in period $k$, that is, if user $i$'s bid $b_{i}$ is less than $p_{i}$, then user $i$ will not win. If user $i$'s bid $b_{i}$ is greater than $p_{i}$, then user $i$ will still win; therefore, $p_{i}$ is the critical value of user $i$, which satisfies Definition 3.

**Theorem 3**: ODRAP is _truthful in $k\in\{1,2,\ldots,K_{\alpha}-1\}$ period._

\begin{table}
\begin{tabular}{l l l l l} \hline Time slot & $\varepsilon$ & $\theta^{k}$ & $X$ & $p$ \\ \hline
1 ($k=1$) & $(5,5,5)$ & $(\theta_{1},\theta_{2})$ & $\phi$ & $[...]$ \\
2 ($k=1$) & $(5,5,5)$ & $(\theta_{1},\theta_{2},\theta_{1})$ & $\phi$ & $[...==]$ \\
3 ($k=1$) & $(5,5,5)$ & $(\theta_{1},\theta_{2},\theta_{1},\theta_{4})$ & $\phi$ & $[...====]$ \\
4 ($k=2$) & $(1,\,1,0)$ & $\{\theta_{2},\theta_{3}\}$ & $[\theta_{3},\theta_{4}]$ & $[...==4,4.5..]$ \\ \hline \end{tabular}
\end{table}
Table 5: Execution of ODRAP ($\alpha=3$).

**Proof.**

1. Assuming that user $i$ is the winning user in period $k$, according to Formula (11) in Theorem 1, we know that $p_{i}\leq b_{i}$. 1. Assuming that user $i$ submits a declared bid $b_{i}^{\prime}\geq p_{i}$, according to Theorem 2, user $i$ will still win in this period, and user $i$ needs to pay $p_{i}^{\prime}=\min(f_{i}^{k})\cdot dr_{i}^{k}e_{i}=p_{i}$, where the utility value of user $i$ is $u_{i}^{\prime}=b_{i}-p_{i}^{\prime}=b_{i}-p_{i}=u_{i}$. If the user submits a declared bid $b_{i}^{\prime}<p_{i}$, according to Theorem 2, it is known that $f_{i}^{k^{\prime}}=\frac{b_{i}^{\prime}}{d\hat{r}_{i}^{k}e_{i}}<\min(f_{i}^{k})$. User $i$ will not win in this period, and the utility value is $0\leq u_{i}$. Thus, when a user submits a declared bid, it will not improve his utility value. 2. Assume that user $i$ submits a declared requirement, which can be divided into two cases. * Suppose that the user increases their demand of the $r$th resource $s_{i^{r}}{}^{\prime}>s_{i^{r}}^{\prime}$ in time slot $\tau\in\{1,2,\ldots,e_{i}\}$, but $dr_{i}^{k}\geq\frac{s_{i^{r}}}{d\tau}$, $\forall\tau\in R$. It can be seen that the dominant resource of user $i$ has not changed at this time, that is,$f_{i}^{k}$ has not changed. However, because the user increases the resource requirement in a certain time slot, the number of winning users will decrease. If the first losing user resource density is currently $\min(f_{i}^{k^{\prime}})$, it is known that $\min(f_{i}^{k^{\prime}})\geq\min(f_{i}^{k})$, the user $i$'s payment price is $p_{i}^{\prime}=\min(f_{i}^{k^{\prime}})\cdot dr_{i}^{k}e_{i}\geq p_{i}$, the utility value of user $i$ is $u_{i}^{\prime}=b_{i}-p_{i}^{\prime}\leq b_{i}-p_{i}=u_{i}$, and the user's utility value will be reduced. * Suppose that the user increases the demand of the $r$th resource $s_{i^{r}}{}^{\prime}>s_{i^{r}}^{\prime}$ in time slot $\tau\in\{1,2,\ldots,e_{i}\}$, but $dr_{i}^{k}<\frac{s_{i^{r}}}{d\tau}$. $\forall\tau\in R$. It can be seen that the dominant resource of user $i$ has changed to $dr_{i}^{k}=\frac{s_{i^{r}}}{d\tau}>dr_{i}^{k}$; similarly, $\min(f_{i}^{k^{\prime}})\geq\min(f_{i}^{k})$, it's payment price is $p_{i}^{\prime}=\min(f_{i}^{k^{\prime}})\cdot dr_{i}^{k}e_{i}\geq p_{i}$, the utility value of user $i$ is $u_{i}^{\prime}=b_{i}-p_{i}^{\prime}\leq b_{i}-p_{i}=u_{i}$, and the user's utility will be reduced. 
2. Assume that user $i$ does not win in period $k$, resulting in a utility value of $0$. 1. Suppose that user $i$ submits a declared bid $b_{i}^{\prime}\geq b_{i}$. If $f_{i}^{k^{\prime}}=\frac{b_{i}^{\prime}}{d\hat{r}_{i}^{k}e_{i}}\leq\min(f_{i}^ {k})$, the user will still not be selected, and the user's utility value is $0$, which remains unchanged compared with the previous utility value. If $f_{i}^{k^{\prime}}=\frac{b_{i}^{\prime}}{d\hat{r}_{i}^{k}e_{i}}>\min(f_{i}^ {k})$, then user $i$ wins in this period, and $p_{i}^{\prime}=\min(f_{i}^{k})\cdot dr_{i}^{k}e_{i}>b_{i}$ needs to be paid. The utility values of user $i$ are $u_{i}^{\prime}=b_{i}-p_{i}^{\prime}<0$, and the user utility will be reduced. If user $i$ decreases their bid $b_{i}^{\prime}<b_{i}$, according to Theorem 2, the user will not be selected, and the user's utility is $0$, which remains unchanged compared with the previous utility value. 2. Suppose that user $i$ submits a declared requirement, increasing the demand of the $r$th resource $s_{i^{r}}{}^{\prime}>s_{i^{r}}^{\prime}$ in time slot $\tau\in\{1,2,\ldots,e_{i}\}$. It can be seen that the resource density of user $i$ becomes $f_{i}^{k^{\prime}}\leq f_{i}^{k}$, and it is impossible to be selected according to the ODRAP_PAY algorithm; therefore, the user's utility is $0$, which remains unchanged compared with the previous utility value. 

In summary, when a user submits a declared bid or requirement, the utility value cannot be improved; thus, the ODRAP mechanism is truthful, which satisfies Definition 4.

**Theorem 4**: _The time complexity of the ODRAP mechanism is polynomial._

**Proof.** According to Algorithms 2 and 3, we know that the time complexity of ODRAP_ALLOC is $O(mn\max e_{i})$, and the time complexity of ODRAP_PAY is $O(mn^{2}\max e_{i})$. The ODRAP framework will be invoked $K_{a}-1$ times during the entire time period $[1,T]$. As a result, the time complexity of the ODRAP mechanism is polynomial.

## 6 Experimental results

We use the dataset provided by the Alibaba Global Scheduling Algorithm Contest [10], which includes a total of 9,338 user requirements. Each requirement has 98 data points and includes time-varying CPU, memory and storage demands for different time slots, as well as priority information, which is not used in this article. Table 6 shows an example of requirement ID 565 in the raw dataset. It can be observed that the resource request is different throughout the usage time.

The experimental platform's hardware configuration includes an S-core Intel Xeon E5 CPU, 48 GB of memory, and 500 GB of storage. The experimental settings are as follows.

* Each requirement in the raw dataset includes 98 data points. We use the random system sampling method to obtain data points, which include CPU, memory and disk resources, to simulate time-varying requirements.
* We normalize the requirement data in the dataset, making them easier to analyze and represent.
* We divide the requirements into two categories: rat requirements and elephant requirements. In rat requirements, the resources are limited to CPU $(1,4)$, Memory $(1,4)$, and Disk $(10,100)$ in each time slot; for elephant requirements, the resources are limited to CPU $(8,64)$, Memory $(8,128)$, and Disk $(100,1000)$ in each time slot.

\begin{table}
\begin{tabular}{l l l l l l} \hline ID & Time slot & CPU & Memory & Storage & Priority \\ \hline
565 & 1 & 0.05 & 0.6 & 60 & 1 \\
565 & 2 & 0.05 & 0.8 & 60 & 1 \\
565 & 3 & 0.06 & 0.8 & 80 & 1 \\
565 &... &... &... &... &... \\
565 & 98 & 0.08 & 1 & 200 & 1 \\ \hline \end{tabular}
\end{table}
Table 6: Example requirement in raw dataset.

Figure 3: The social welfare under different user requirement scales.

* For each requirement, we generate a random value in $(1,24)$ to simulate the requirement submit time, a random value in (0, 12) to simulate the maximum waiting time, and a random number in (1, 12) to simulate the execution times in first three experiments; however, in the last experiment, all requirements have the same execution time of 12. In this way, it is easy to find the most reasonable $\alpha$ in different situations.
* In the bid setting, we define the _unit time cost_ of each resource. For elephant requirements, the bid is a random value of (0.8, 10)-times its _unit time cost_; for rat requirements, the bid is a random value of (0.5, 2)-times its _unit time cost_. The advantage of this is that one can clearly observe the impact of $\alpha$ on the social welfare and resource utilization when the rat and elephant requirements are given in different proportions.
* We preset the resource capacity as $\boldsymbol{\epsilon}=(80,400,4000)^{\mathsf{T}}$.
* For each experiment, we randomly generate 100 samples. We use the property mean of these samples to eliminate the effects of randomization.
* We use IBM CPLEX12 to program the optimal allocation algorithm and optimal payment algorithm: VCG-VMAP [11]. The optimal solution is based on offline allocation; however, for comparison, we observe the performance of ODRAP.
* We use the C++ programming language to program the ODRAP algorithm and comparison algorithm, OVMAP, in [11].

### _The impact of user requirement scale on allocation_

In this experiment, all requirements are rat requirements. We analyze the impact of the user requirement scale on the social welfare, algorithm execution time, and resource utilization in the classical online allocation mode ($\alpha$=0). It can be observed from Fig. 3 that when the requirement number increases, the social welfare of all algorithms increases simultaneously (VCG-VMAP cannot generate a solution when the user requirement number reaches 500). With 50 and 100 users, ODRAP obtains the same social welfare as the optimal solution. It can also be observed that ODRAP is superior to the OVMAP algorithm in all cases:

This also indicates that the dominant resource proportion-based algorithms have an advantage over algorithms based on average resource proportions. Fig. 4 shows the resource utilization of different algorithms. The resource utilization under the online model is defined as (_The allocated resource usage time_/_Total resource availability time_) because the online allocation cannot exhaust all resources simultaneously. The resource utilization of online allocation is generally lower than that of the optimal solution obtained offline. However, the ODRAP algorithm also has obvious advantages over the OVMAP algorithm in terms of resource utilization, which also benefits from the proportion of dominant resources. Fig. 5 shows the execution time of different algorithms. Compared with the VCG-VMAP optimal solution, the execution times of the ODRAP and OVMAP algorithms remain very short.

### _The impact of user requirement type on allocation_

This experiment shows the impact of different types of requirements on social welfare and resource utilization. In this experiment, the total number of user requirements is 200, and $\alpha$=0. We designed 6 test cases with different elephant requirement proportions of 0, 1, 5, 10, 20, and 50%. Fig. 6 shows that the social welfare increases with increasing elephant requirement proportion, indicating that allocating resources for elephant requirements can bring greater social welfare. Fig. 7 presents the resource utilization in different experiments. We can find that the greater the elephant requirements are, the higher the resource utilization. For example, when elephant requirements represent 20% of the total requirements, the resource utilization is higher than that in the 10, 5, 1, and 0% experiments, which indicates that the number of elephant requirements have a greater impact on resource utilization.

Fig. 4: The resource utilization under different user requirement scales.

Fig. 5: The execution time under different user requirement scales.

Fig. 6: The social welfare under different requirement proportions.

### The impact of parameter $\alpha$ on social welfare and resource utilization

In this experiment, the total number of user requirements is 200, and the proportion of elephant requirements is 10%. We observe changes in social welfare and resource utilization when $\alpha$ changes. It can be observed from Fig. 8 that the classical online resource allocation algorithm (ODRAP $\alpha$=0) cannot obtain the maximum social welfare; the social welfare increases first with increasing $\alpha$ but then decreases. When $\alpha$=4, the social welfare is maximized. When $\alpha>8$, the ODRAP social welfare is lower than the (ODRAP $\alpha$=0) mode. This is because the execution time of each requirement is a random value in $(1,\,12)$. When $\alpha>8$, the interval between the two allocations is already greater than the average of all requirement execution times; therefore, there will be time slots in each time period that are not allocated. In particular, compared to OVMAP, the ODRAP social welfare value increased by 100% in $\alpha$=4. Fig. 9 presents the resource utilization in different experiments. The ODRAP algorithm has obvious advantages over the OVMAP algorithm in terms of resource utilization, which also benefits from the proportion of dominant resources.

### Requirements with a fixed execution time

Simultaneously, we also designed an experiment concerning fixed execution times. In this experiment, the requirement number is 200, the execution time of all requirements is 12, the elephant requirement proportion is 10%, and other parameters and settings remain unchanged. It can also be observed from Figs. 10, 11, and 12 that there are large fluctuations in social

Figure 11: The execution time under fixed execution time requirements.

Figure 8: The social welfare in different $\alpha$.

Figure 7: The resource utilization under different requirement proportions.

Figure 9: The resource utilization under different $\alpha$.

welfare and resource utilization in certain places. For example, when $\alpha=5,7,11$, ODRAP performs poorly; the main reason for this is that all requirements have the same execution time. When $\alpha$ takes on certain values, a gap is generated between the resource release time and the next resource allocation time, resulting in resources not being allocated effectively. For example, when $\alpha$=10, resources are allocated at time slot 11. Assuming that this allocation completely exhausts a certain type of resources, the next allocations, that is, in time slot 21, cannot be allocated; however, the requirements to be allocated at time slot 11 will be completed at time slot 22. Therefore, no resource requirements will be allocated between time slot 23 and the next allocation time slot 31, resulting in wasted resources and lower social welfare. The solution to this problem is to make $\alpha$ be a divisor of the execution time. For example, if the execution time is 12, $\alpha$ achieves a good performance at 2, 3, 4, 6, and 12, which can complete the resource release immediately before a new allocation begins. Note that in the fixed execution time experiment, our approach still shows good performance.

## 7 Conclusion

This paper proposes an online auction mechanism to solve a new cloud provider problem: obtaining higher social welfare under time-varying resource requirements from users. Specifically, we combine a waiting period strategy and dominant resource proportions into the resource allocation algorithm to obtain higher social welfare and resource utilization than those of classical algorithms. In addition, a payment pricing algorithm that satisfies critical value theory is proposed to ensure the truthfulness of the auction mechanism. In our experiments, we observed the impact of the time-varying requirements allocation under different parameter $\alpha$ values for obtaining an better time interval, which provides good advice to cloud providers. For future work, we will study emerging constraint issues in cloud computing, such as strict availability constraints and anti-affinity constraints [10], and apply them to offline or online resource allocation algorithms to provide more realistic recommendations for cloud providers.

**CRediT authorship contribution statement**

**Jixian Zhang:** Methodology, Formal analysis, Writing - original draft. **Xutao Yang:** Software, Investigation, Visualization. **Ning Xie:** Software, Visualization. **Xuejie Zhang:** Supervision, Validation, Funding acquisition. **Athanasios V. Vasilakos:** Validation. **Weidong Li:** Conceptualization, Methodology, Writing - review & editing, Funding acquisition.

**Declaration of competing interest**

The authors declare that they have no known competing financial interests or personal relationships that could have appeared to influence the work reported in this paper.

## Acknowledgments

The authors thank IBM for providing a full version of CPLEX12 that does not set limitations on solving for optimal solutions. We thank Alibaba Global Scheduling Algorithm Contest for providing the raw time-varying resource allocation dataset. This work is supported in part by the National Natural Science Foundation of China (Nos. 61762091, 61662088 and 11663007), the Project of the Natural Science Foundation of Yunnan Province of China (2019FB142 and 2018ZF017), and the Program for Excellent Young Talents, Yunnan University, China.

## References

* (1) M. Nejad, L. Mashayekhy, D. Grosu, Truthful greedy mechanisms for dynamic virtual machine provisioning and allocation in clouds, IEEE Trans. Parallel Distrib. Syst. 26 (2) (2015) 594-603.
* (2) L. Mashayekhy, M. Nejad, D. Grosu, A PTAS mechanism for provisioning and allocation of heterogeneous cloud resources, IEEE Trans. Parallel Distrib. Syst. 26 (9) (2015) 2386-2399.
* (3) H. Zhou, G. Bai, S. Deng, Optimal interval scheduling with nonidentical given machines, Cluster Comput. (2019) 1-9.
* (4) E. Angelelli, N. Bianchesi, C. Flippi, Optimal interval scheduling with a resource constraint, Comput. Oper. Res. 51 (2014) 268-281.
* (5) X. Liu, W. Li, X. Zhang, Strategy-proof mechanism for provisioning and allocation virtual machines in heterogeneous clouds, IEEE Trans. Parallel Distrib. Syst. 29 (7) (2018) 1650-1663.
* (6) J. Zhang, N. Xie, X. Zhang, W. Li, An online auction mechanism for cloud computing resource allocation and pricing based on user evaluation and cost, Future Gener. Comput. Syst. 89 (2018) 286-299.
* (7) Amazon EC2, 2019, [Online]. Available: [https://amazonaws-china.com/cn/en/2en/instance-types/](https://amazonaws-china.com/cn/en/2en/instance-types/).
* (8) Alibaba, Alibaba cloud, 2019, [Online]. Available: [https://help.nl/jwm.com/document_detail/5/2088.html](https://help.nl/jwm.com/document_detail/5/2088.html).
* (9) T. Nisan, E. Roughgarden, E. Tardos, V. Vazirani, Algorithmic Game Theory, Cambridge Univ. Press, Cambridge, 2007, pp. 218-233.
* (10) Alibaba, Alibaba cloud, 2019, [Online]. Available: [https://tianchial.nl/jwm.com/](https://tianchial.nl/jwm.com/).
* (11) L. Mashayekhy, M. Nejad, D. Grosu, A. Vasilakos, An online mechanism for resource allocation and pricing in clouds, IEEE Trans. Comput. 65 (4) (2016) 1172-1184.
* (12) Q. Wu, J. Hao, A clique-based exact method for optimal winner determination in combinatorial auctions, Inform. Sci. 334 (2016) 103-121.
* (13) E. Angelelli, C. Flippi, On the complexity of interval scheduling with a resource constraint, Theoret. Comput. Sci. 412 (29) (2011) 3650-3657.
* (14) L. Mashayekhy, M. Fisher, D. Grosu, Truthful mechanisms for competitive reward-based scheduling, IEEE Trans. Comput. 65 (7) (2016) 2299-2312.
* (15) J. Zhang, N. Xie, W. Li, X. Yue, X. Zhang, Truthful multi requirements auction mechanism for virtual resource allocation of cloud computing, J. Electron. Inf. Technol. 40 (1) (2018) 25-34.
* (16) R. Zhang, K. Wu, M. Li, J. Wang, Online resource scheduling under concave pricing for cloud computing, IEEE Trans. Parallel Distrib. Syst. 27 (4) (2016) 1131-1145.
* (17) Z. Zheng, S.Roses, Online multi-resource allocation for deadline sensitive jobs with partial values in the cloud, in: IEEE Infocom -The IEEE International Conference on Computer Communications, 2016, pp. 1-9.
* (18) X. Tang, Y. Li, R. Ren, W. Cai, On first fit bin packing for online cloud server allocation, in: IEEE International Parallel and Distributed Processing Symposium, 2016, pp. 323-332.

Figure 12: The resource utilization under fixed execution time requirements.

* [19] M. Skutella, J. Verschae, Robust polynomial-time approximation schemes for parallel machine scheduling with job arrivals and departures, Math. Oper. Res. 41 (3) (2016) 991-1021.
* [20] W. Shi, L. Zhang, C. Wu, Z. Li, C. Francis, An online auction framework for dynamic resource provisioning in cloud computing, IEEE/ACM Trans. Netw. 42 (1) (2014) 71-83.
* [21] X. Chen, X. Hu, T. Liu, W. Ma, T. Qin, P. Tang, C. Wang, B. Zheng, Efficient mechanism design for online scheduling, J. Artificial Intelligence Res. 56 (1) (2016) 429-461.
* [22] H. Zhang, B. Li, H. Jiang, F. Liu, A. Vasilakos, J. Liu, A framework for truthful online auctions in cloud computing with heterogeneous user demands, IEEE Trans. Comput. 55 (2016) 805-818.
* [23] X. Zhang, Z. Huang, C. Wu, Z. Li, C. Francis, Online auctions in laa5 clouds: Welfare and profit maximization with server costs, IEEE/ACM Trans. Netw. (2015) 1034-1047.
* [24] A. Mu'Alem, N. Nisan, Truthful approximation mechanisms for restricted combinatorial auctions, Games Econom. Behav. 64 (2) (2008) 612-631.
* [25] W. Wang, B. Liang, B. Li, Multi-resource fair allocation in heterogeneous cloud computing systems, IEEE Trans. Parallel Distrib. Syst. 28 (10) (2014) 2822-2836.

\begin{tabular}{c c}  & Jixian Zhang born in 1980. He received the M.S. degree in computer science from University of Electronic Science and Technology of China in 2006, and received the Ph.D. degree in computer science from University of Electronic Science and Technology of China in 2010. He is a lecturer at Yunnan University. His research interests include distributed system, cloud computing, mobile computing. \\ \end{tabular} \begin{tabular}{c c}  & Xutao Yang born in 1984. He received the B.Sc. degree in computer science from Shanghai University in 2011. He is a lecturer and a Ph.D. candidate at the School of Information Science and Engineering, Yunnan University. His research interests include cloud computing and edge computing. \\ \end{tabular} \begin{tabular}{c c}  & Ning Xie born in 1991. She received the B.Sc. degree in computer science from Northeast Normal University in 2014. She is currently working toward the M.S. degree at Yunnan University. Her research interests include virtual resource allocation in cloud computing, service-oriented computing. \\ \end{tabular} \begin{tabular}{c c}  & Xuejie Zhang received the masters degree in computer science engineering, from Harbin Institute Of Technology in 1990. He received the Ph.D. degree in computer science engineering from The Chinese University of Hong Kong 1998. He is currently a professor with the Department Computer Science and Engineering of Yunnan University. His main research interests are high performance computing, distributed systems, and computer networks. \\ \end{tabular} \begin{tabular}{c c}  & Athanasios V. Vasilakos is currently a Professor with the Lulea University of Technology, Sweden. He served or is serving as an editor for many technical journals, such as the IEEE Transactions on Network and Service Management, the IEEE Transactions on Cloud Computing, the IEEE Transactions on Information Forensics and Security, the IEEE Transactions on Nanobioscience, the IEEE Transactions on Information Technology in Biomedicine, ACM Transactions on Autonomous and Adaptive Systems, and the IEEE Journal on Selected Areas in Communications. \\ \end{tabular} 
\begin{tabular}{c c}  & Weidong Li received the Ph.D. degree in department of mathematics, from Yunnan University in 2010. He is currently an associate professor at Yunnan University. His main research interests are combinatorial optimization, approximation algorithm, randomized algorithm and cloud computing. \\ \end{tabular}