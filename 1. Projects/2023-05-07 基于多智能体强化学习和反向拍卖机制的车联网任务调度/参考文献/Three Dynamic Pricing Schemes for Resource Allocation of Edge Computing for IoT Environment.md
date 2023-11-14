
## Abstract
With the widespread use of Internet of Things (IoT), edge computing has recently emerged as a promising technology to tackle low-latency and security issues with personal IoT data. In this regard, many works have been concerned with computing resource allocation of the edge computing server, and some studies have conducted to the pricing schemes for resource allocation additionally. However, few works have attempted to address the comparison among various kinds of pricing schemes. In addition, some schemes have their limitations such as fairness issues on differentiated pricing schemes. To tackle these limitations, this article considered three dynamic pricing mechanisms for resource allocation of edge computing for the IoT environment with a comparative analysis: BID-proportional allocation mechanism (BID-PRAM), uniform pricing mechanism (UNI-PRIM), and fairness-seeking differentiated pricing mechanism (FAIDPRIM). BID-PRAM is newly proposed to overcome the limitation of the auction-based pricing scheme; UNI-PRIM is a basic uniform pricing scheme; FAID-PRIM is newly proposed to tackle the fairness issues of the differentiated pricing scheme. BIDPRAM is formulated as a noncooperative game. UNI-PIM and FAID-PRIM are formulated as a single-leader–multiple-followers Stackelberg game. In each mechanism, the Nash equilibrium (NE) or Stackelberg equilibrium (SE) solution is given with the proof of existence and uniqueness. Numerical results validate the proposed theorems and present a comparative analysis of three mechanisms. Through these analyses, the advantages and disadvantages of each model are identified, to give edge computing service providers guidance on various kinds of pricing schemes.

**Index Terms** Bid-proportional pricing, dynamic pricing, edge computing, fairness-seeking differentiated pricing, Internet of Things (IoT).

## 1. INTRODUCTION

IN RECENT years, thanks to the rapid advancement of the artificial intelligence (AI) technology for data analytics of Internet of Things (IoT) [1]–[3] and the emergence of IoT dedicated networks, such as LoRa, NB-IoT LTE-M [4], [5], the number of IoT devices such as mobiles, wearable devices, tablets, smart metering devices, and smart speaker has been exponentially increasing. According to “Erriccson Mobility Report 2018,” the number of IoT devices worldwide is expected to exceed 4.1 billion in 2024, increasing at a compound annual growth rate of 33% since 2013 [6]. Under these circumstances, lack of computation power from handling this explosive growth of IoT data, and security issue of personal IoT data forced IoT devices to use an edge computing for the Quality-of-Experience (QoE) [7]–[13].

In this regard, lots of works have been concerned with optimal resource allocation of edge servers for computation offloading for IoT or mobile devices [8], [14]–[26]. In these studies, the optimization problems have been suggested, and solved to achieve optimal resource allocation in order to maximize energy efficiency or minimize latency where the resource can be considered as computing power, transmission power, bandwidth, etc. However, most of these studies only focus on improving the overall system-wide performance, causing many fairness problems of IoT devices. In this manner, there has been a lot of research to resolve this issue [27]– [36]. Nevertheless, those works devoted to improve the fairness issue cannot properly account for some users who may have a stronger desire to use edge server even with a higher price (simply called the nonpricing edge computing system). Accordingly, the pricing mechanism can be a good option to differentiate the resource allocation considering both system level performance and different user desire levels.

### A . Related Works

From this point of view, several studies have been recently conducted to optimize the pricing schemes for edge computing servers’ resources [16], [37]–[41]. In [37], uniform pricing is considered in edge computing systems of which users consider the energy efficiency and cost. Kim _et al._ [37] formulated the Stackelberg game model among the users and edge seller, and determined an optimal unit price to maximize the seller’s revenue. Also, Jošilo and Dán [38] suggested an algorithm, which finds Nash equilibrium (NE) among users by considering energy efficiency, cost, and delay under the given fixed-price policy. In [39], the Stackelberg game model between users considering the delay and cost of the sellers is proposed. In addition, they proposed two algorithms that can maximize the seller’s revenue in the case of using a uniform and differentiated pricing policy. In addition, Yi _et al._ [40] proposed a differentiated pricing scheme that maximized the overall happiness of both the users and the seller. In [41], differentiated pricing is considered in the system model with the coalition between device users and edge servers. Finally, Chen _et al._ [16] introduced a bidbased auction style pricing mechanism by considering joint communication and computation resource allocation.

Some studies also considered pricing schemes of edge computing on specific situations. Xiong _et al._ [42]–[44] formulated a case where mobile users run blockchain applications using edge computing to mine blocks and considering both the uniform and the differentiated pricing. Also, in [45], the Double auction system for edge computing is discussed. The authors proposed two different systems, breakeven-based Double auction and dynamic pricing-based Double auction, and analyzed their efficiencies. Moreover, in [46], they formulated resource management as a Double auction game and analyzed it. In [47], a system with mobile users, edge clouds, and remote clouds are considered. In [48], the concept of general equilibrium is suggested within systems that are composed of edge nodes with capacity limitations and services with budget limitations. Furthermore, De Pellegrini _et al._ [49] focused on a certain situation where sellers offer the edge-cloud-based caching service to users. As providers purchase the caching space at a fixed price, Stackelberg equilibrium (SE) between the sellers and users is considered.

![[Pasted image 20230802091625.png]]
TABLE I SUMMARY OF THE WORKS ON PRICING SCHEMES FOR EDGE COMPUTING

All the aforementioned studies have concentrated on designing the optimal pricing mechanisms with given specific scenarios or metrics, such as energy efficiency, delay, fairness, etc for the edge computing system. However, none of the above have provided comparative analysis among several pricing policies. Furthermore, most of the studies on edge computing considered only a single pricing scheme. Thus, it is difficult to measure the advantages and disadvantages of various pricing schemes. Table I gives a summary of the studies on pricing schemes for edge computing from this perspective.

### B. Contributions

To this end, this article considers three dynamic pricing mechanisms for edge computing, and provides a comparative analysis among them: BID-proportional allocation mechanism (BID-PRAM), uniform pricing mechanism (UNI-PRIM), and fairness-seeking differentiated pricing mechanism (FAIDPRIM). Based on the analysis, it is emphasized that the detailed modeling of pricing schemes should be recognized, and that a detailed pricing scheme should also be studied in depth for efficient edge computing operation.

The contributions of this article are summarized as follows.

1. This article clearly defines three dynamic pricing schemes for edge computing for the IoT environment where all the data are transmitted to be processed: BID-PRAM, UNI-PRIM, and FAID-PRIM.
2. We rigorously analyze all three in a game-theoretical approach. BID-PRAM is formulated as a noncooperative game. UNI-PIM and FAID-PRIM are formulated as a single-leader–multiple-followers Stackelberg game. In each mechanism, the NE or SE solution is given with the proof of existence and uniqueness.
3. BID-PRAM is proposed based on the auction-based models in [16]. Specifically, the auction-based pricing model has limitations in markets requiring low latency, such as edge computing, because the final deal is not well formed when there are few sellers and buyers. Accordingly, BID-PRAM is newly proposed to overcome these limitations. In this method, when there are one seller and several buyers, the transaction is always, quickly made based on the buyers’ bid price.
4. To tackle fairness issues on differentiated pricing schemes for edge computing, FAID-PRIM is newly proposed based on the previous mechanisms [39]–[41]. In this mechanism, the pricing-fairness factor is introduced so that the price difference does not exceed a certain level.
5. In particular, this FAID-PRIM provides a more rigorous analysis of how much the fairness factor should be set for service providers to earn more than UNI-PRIM. This analytic guideline is expected to be useful to the edge service providers; they can predict how much revenue will be generated compared to UNI-PRIM, as long as users do not complain.
6. From the performance analysis and numerical analysis, we compare the advantages and disadvantages of three pricing schemes. Through this analysis, service providers can choose an appropriate pricing scheme based on their IoT operational environment.
7. This article will emphasize the necessity and importance of pricing schemes for edge computing for IoT, and will provide a basis for studying various pricing policies.

The remainder of this article is organized as follows. Section II presents an overview of the proposed pricing mechanisms. Section III formulates each mechanism as a noncooperative game model, and derives the NE solution of each model with the proof of existence and uniqueness. Section IV gives several numerical and experimental results of the proposed models to validate the proposed theorems and to give comparison of the average performances of each of them. Section V provides discussions about realization, game model, and future work. Finally, Section VI concludes this article.

## 2. SYSTEM MODEL

In this section, system models for the allocation of CPU cycles of the edge computing are proposed with the cost function of the device and the revenue of the edge computing server. Also, the following three pricing schemes for resource allocation are provided: 1) BID-PRAM; 2) UNI-PRIM; and 3) FAID-PRIM.

Assume that there is an edge computing server with $N$ IoT devices to use the edge server at certain time. Let the set of IoT devices $\mathcal I$, denoted by ${1,2,...,N}$. Every IoT device $k ∈\mathcal I$ has to use the edge computing server to process its offloading data with size $R_k$ (bits); denote the set of all the devices’ offloading data by $R =\{R_1,R_2,...,R_N\}$. There are total $F$ CPU cycles per second available in the edge computing server that will be allocated to the IoT devices by some allocation mechanisms; three allocation mechanisms are proposed in the remainder of this section.

Now, let $F_k$ be the allocated CPU cycles to the k-th device with a set of all the devices’ allocated CPU cycles, $\mathcal F = \{F_1,F_2,...,F_N\}$. Also, let $w_k$ be the payment of the k-th device to use CPU cycles of the edge computing server with a set of all the devices’ payment $w = [w_1,w_2,...,w_N] (w_i > 0 ∀ i ∈ \mathcal I)$. Then the computation time of each data $R_i$ is $R_iC_i/F_i$, where $Ci ∈ \{C_1,C_2,...,C_N\}$ denotes the needed CPU cycles when the edge computing computes 1 bit of data of the i-th device.

For each IoT device, it is beneficial to reduce the computation time $R_kC_k/F_k$ while minimizing the cost $w_{k.}$ Now, to analyze each device’s happiness, the cost function of the i-th IoT device can be defined as a real-valued function from all the devices’ strategies to its cost, which proportionally increases when the computation time and the cost increase.

*Definition 1 (Cost Function of the kth IoT Device)*: The cost function of the kth IoT device, $u_i : \mathbb R_N → \mathbb R$ is defined by
$$u_{i}(w_{i},\mathrm{\bf~W}_{-i}):=\frac{R_{i}C_{i}}{F_{i}}+\mu_{i}w_{i}.\tag{1}$$

Here, $w_i$ is the k-th device’s strategy of the payment and $\mathbf w_{−i}$ is the others’ strategies, that is, $\mathbf w_{−i} = \{\mathbf w_1,...,\mathbf w_{k−1},\mathbf w_{k+1},...,\mathbf w_N\}$. $μ_i$ is a weight factor indicating the tendency of the k-th IoT device to think about how much the payment cost is more important than the delay time.

Last, for the convenience of calculation, the utility function of the k-th IoT device $v_i$ is defined as follows.

*Definition 2 (Utility Function of the kth IoT Device)*: The utility function of the kth IoT device, $v_i : \mathbb R_N → \mathbb R$ is defined by
$$
\begin{aligned}v_i(w_i,\mathbf{w}_{-i})&:=-u_i(w_i,\mathbf{w}_{-i})\\&=-\frac{R_iC_i}{F_i}-\mu_iw_i.\end{aligned}\tag2
$$


The utility function of the device seems to be only as a function of $w_i$. Based on the CPU allocation mechanism, $F_i$ can be expressed as a function of all the strategies $\mathbf w$, that is, $F_i(w_i,\mathbf w_{−i})$. Then, the strategy of all the other devices will ultimately affect its utility $v_i$, which formulates a noncooperative game among IoT devices. As will be discussed in more detail in the following sections, in summary, only BID-PRAM among the three mechanisms is formulated as a noncooperative game.

### A. BID-PRAM

![[Pasted image 20230802091935.png]]
Fig. 1. System model of BID-PRAM.

First, in this section, BID-PRAM is proposed to resolve the problem that it takes too long for transactions to be completed for all computing resources in the auction-based pricing mechanism, and is formulated as a noncooperative game among IoT devices. Fig. 1 shows the overall schematic of this mechanism.

In BID-PRAM, each IoT device user bids some amount of money to the edge computing server to get more CPU cycles. Let _wi_ be the amount of bids to the provider of the edge computing to get more CPU cycles for faster computation. Then the provider allocates certain portions of the cycles to the users in exact proportion to their bids, that is, the distributed CPU cycles are given by
$$
F_i=F\frac{w_i}{\sum_{i\in\mathcal{I}}w_i}.\tag3
$$


Based on this utility function, every device in I is going to choose its best strategy to maximize its own utility function. Then, the computing resource competition among the devices is formulated as a noncooperative strategic form game _G_ = (W,_vi_)_i_∈I, where W is the strategy domain for all the IoT devices, given by WIn this noncooperative game, the market price is determined automatically, which is going to be analyzed in Section III-A.

In the auction-based mechanism, the edge server may have to participate in the market many times to sell all of its computing resources. On the other hand, in BID-PRAM, all users have to bid up to one time in order to deal with all resources. In this respect, BID-PRAM achieves the final transaction for all resources very quickly compared to the auction-based mechanism.

### B. UNI-PRIM

![[Pasted image 20230802092105.png]]
Fig. 2. System model of UNI-PRIM.

This section describes the simple procedure of UNI-PRIM. In UNI-PRIM, at first, the edge server declares a uniform unit price, $p$, to all devices. Then, each device, decides the amount of payment, _wi_ to get CPU cycles _Fi_ = (_wi_/_p_), maximizing its utility _vi_. Fig. 2 shows the overall schematic of this mechanism.

Note that the edge server predicts the costs of the users and determines the unit price to use all CPU cycles in the edge computing in BID-PRIM. Thus, UNI-PRIM is formulated as a single-leader–multiple-followers Stackelberg game model, where the edge server role is a leader and IoT devices roles are multiple followers.

### C. FAID-PRIM

![[Pasted image 20230802092235.png]]
Fig. 3. System model of FAID-PRIM.

In this section, FAID-PRIM is newly proposed based on the previous mechanisms to resolve fairness issues on the differentiated pricing scheme for edge computing [39]–[41]. In FAID-PRIM, the edge server can differentiate the unit price of each user. Fig. 3 shows the overall schematic of this mechanism. Each user decides their payments to maximize their utility function, and the edge server changes the unit price of each user to allocate all CPU cycles and to maximize the revenue based on exact prediction. Thus, FAID-PRIM is also formulated as a single-leader–multiple-followers Stackelberg game model, where the edge server roles as a leader and IoT devices role as multiple followers.

However, if the unit prices have huge differences with each other, there are some possibilities that the users could feel a sense of unfairness. Thus, a fairness factor $f$ is proposed to restrict the portion between the highest and lowest unit prices
$$
1\leq\frac{\max_{k\in\mathcal{I}}p_k}{\min_{k\in\mathcal{I}}p_k}\leq f.\tag4
$$


## 3. PERFORMANCE ANALYSIS

In this section, a Nash equilibrium of BID-PRAM is defined and the unique NE solution is provided with the existence and uniqueness. Also, each of SE of UNI-PRIM and FAID-

PRIM is defined, and the unique SE solution is provided with the existence and uniqueness. Finally, a comparative analysis among the three models is provided, which concludes this section.

### A. BID-PRAM

In BID-PRAM, the market price of CPU cycles in the edge computing is totally determined by strategies of device users, without any participation of the seller. We assume that the users are independent and choose their strategies to maximize each user’s own utility function.

In this noncooperative game of BID-PRAM, the stable market price may exist at the NE point among users, defined as follows.

_Definition 3 (NE of BID-PRAM): _ The NE point of BID-PRAM among the users, w∗ ,...,_w_∗_N_], is defined as $v_i (w_i^*,\mathbf{w}_{-i}^*)\geq v_i (w_i,\mathbf{w}_{-i}^*)\quad\forall w_i>0, i\in\mathcal{I}.$

Whether there exists an NE point of the game or not is crucial to analyze the behaviors of the users in the system. We suggest mathematical approaches to prove the uniqueness of the NE of BID-PRAM.

Lemma 1: The utility function vi(wi,w∗ −i) is strictly con cave and continuously differentiable in wi > 0.
Proof: By taking first and second partial derivatives of vi(wi, w∗ −i) with respect to wi
$$
\frac{\partial}{\partial w_i}v_i(w_i,\mathbf{w}_{-i}^*)=\frac{R_iC_i}{F}\frac{\sum_{k\in\mathcal{I}\setminus\{i\}}w_k^*}{w_i^2}-\mu_i \tag5
$$

$$
\frac{\partial^{2}}{\partial w_{i}^{2}}v_{i}(w_{i},\mathbf{w}_{-i}^{*})=-\frac{2R_{i}C_{i}}{F}\frac{\sum_{k\in\mathcal{I}\setminus\{i\}}w_{k}^{*}}{w_{i}^{3}}\tag6
$$

we can see that the second derivative is negative for all _wi_ > 0, proving the concavity of the utility function.

Also, the first derivative is in a rational form with respect to _wi_, proving the continuous differentiability of the utility function.

Lemma 2: w∗ = [w∗ 1,w∗ 2,...,w∗ N] is an NE point among the users if and only if the following condition holds:
$$
\frac{\sum_{k\in\mathcal{I}\setminus\{i\}}w_k^*}{w_i^{*2}}=\frac{F\mu_i}{R_iC_i}.\tag7
$$


Proof:  Let w∗ be an NE among the users. _vi_(_wi_,wis strictly concave and continuously differentiable in _wi_** > 0 by Lemma 1. Thus, by Definition 1, _vi_(_wi_,whas the unique local and global maximizer _w_**∗**_i_ over _wi_** > 0. By Fermat’s theorem, the following condition holds:
$$
\frac{\partial}{\partial w_{i}}v_{i}(w_{i}^{*},\mathbf{w}_{-i}^{*})=0 \tag8
$$

which is equivalent to (7).

Conversely, suppose that condition (7) holds for w∗. The utility function_wvii_(>_wi_,0wby Lemma 1. Also, the first derivative∗−_i_) is strictly concave and continuously
of the utility function at _w_**∗**_i_ is 0, meaning _v__i_**(**_wii_**,**w**∗−**_i_0). Byhas the unique local and global maximizer _w_**∗**_i_ in _w_** > Definition 1, w**∗ **is an NE**

Lemma 3: Consider a problem finding e∗ = [e∗ 1,e∗ 2,...,e∗ N] and scalar p that satisfies the following conditions for all i∈I:
$$
\begin{cases}\frac{R_iC_i}{\mu_iF}\frac{F-e_i^*}{e_i^{*2}}-p=0\\\sum_{k\in\mathcal{I}}e_k^*-F=0\\e_i^*,p>0.\end{cases}.\tag9
$$

Then this problem has the unique solution, given by
$$
e_i^*=\frac{-R_iC_i+\sqrt{R_i^2C_i^2+4\mu_iF^2R_iC_ip}}{2\mu_iFp}\tag{10}
$$
where $p$ is a real number satisfying $\sum_{k\in\mathcal{I}}e_{k}^{*}=F$ 

Proof:  By the first condition of (9) $\mu_iFpe_i^{*2}+R_iC_ie_i^{*}-FR_iC_i=0.$


The discriminant of this quadratic equation, 4μ_iF_2_RiCip_ + _R_2_i Ci_2, is obviously positive, proving the existence of _e_∗_i_ .

By quadratic formula and the third condition of (9), the solution is given by
$$
e_i^*=\frac{-R_iC_i+\sqrt{R_i^2C_i^2+4\mu_iF^2R_iC_ip}}{2\mu_iFp}
$$
showing the uniqueness of _e_∗_i_ .

Also, by the second condition of (9)
$$
\begin{aligned}\sum_{k\in\mathcal{I}}\frac{-R_iC_i+\sqrt{R_i^2C_i^2+4\mu_iF^2R_iC_ip}}{2\mu_i}-F^2p=0.\end{aligned}
$$

Let the left-handed side be _f_(_p_). Taking first and second derivative, we get
$$
\frac{\partial f(p)}{\partial p}=\sum_{k\in\mathcal{I}}\frac{F^2R_iC_i}{\sqrt{R_i^2C_i^2+4\mu_iF^2R_iC_ip}}-F^2
$$
and
$$
\frac{\partial^2f(p)}{\partial p^2}=-\sum_{k\in\mathcal{I}}\frac{2\mu_iF^4R_i^2C_i^2}{(R_i^2C_i^2+4\mu_iF^2R_iC_ip)^{3/2}}.
$$

Since** (**[**∂**_f_**(**_p_**)**]**/∂**_p_**)|**_p_**=**0** > **0 and** (**[**∂**2_f_**(**_p_**)**]**/∂**_p_2**) < **0 for all _p_** > **0, there exists a unique _p_** > **0 that satisfies (9).**

_Lemma 4: _ If w∗ is an NE of noncooperative game among users, then the vector e∗ $=([w_{k}^{*}]/p)_{k\in\mathcal{I}}$ and the scalar $p$ defined by $([\sum_{k\in\mathcal{I}}w_{k}^{*}]/F)$  **are the unique solution to (9).**

_Proof: _ By Lemma 2, w∗ satisfies condition (7). **Substituting _w_** $_i^*=pe_i^*$  **and _p_** $=([\sum_{k\in\mathcal{I}}w_{k}^{*}]/F)$  , we get
$$\frac{{ F}-e_{i}^{*}}{p e_{i}^{*2}}=\frac{\mu_{i}{F}}{R_{i}C_{i}}\tag{11}$$


**which shows that w**∗ **satisfies the first condition of (9). Similarly, we can easily show that**  $\sum_{k\in\mathcal{I}}e_k^*-F=0$, proving that newly defined vector e∗ and the scalar $p$ are a solution to (9).

**Also, Lemma 3 ensures that the newly defined solution of (9) is unique.**

**_Lemma 5: _ If** (**e**∗,**_p_**) **satisfies the condition (9), then the vector w**∗ = $(pe_k^*)_{k\in\mathcal{I}}$  **is an NE.**

_Proof: _ It can be shown by the reverse argument of the proof of Lemma 4. Also by Lemma 3, such (e∗,_p_) is unique.

_Theorem 1: _ There exists the unique NE w∗ of noncooperative game among device users in I, which is given by
$$\begin{array}{c c}{{\displaystyle{\displaystyle w_{i}^{*}=\frac{-R_{i}C_{i}+\sqrt{R_{i}^{2}C_{i}^{2}+4\mu_{i}F^{2}R_{i}C_{i}p}}{2\mu_{i}F}}}}&\end{array}\tag{12}$$

**where $p$ is a real number satisfying** $\sum_{k\in\mathcal{I}}w_k^*= pF$ .

Proof:  Lemmas 3 and 5 prove the existence of NE, and Lemma 4 proves the uniqueness of the equilibrium. By substituting w∗ = $(pe_k^*)_{k\in\mathcal{I}}$  to the (10), it is easily shown that the unique NE among users is given by (12).

Theorem 1 states that there exists a unique NE point and we can calculate the point through (12). This result shows that the payments of users will tend to be fixed after competitions between the users, regardless of the initial payments. Therefore, the edge seller can predict the strategies of IoT devices and determine the amount of CPU cycles for users with Theorem 1.

### B. UNI-PRIM

In the Stackelberg game of UNI-PRIM, the stable market price may exist at the SE point, defined as follows.

Definition 4 (SE of UNI-PRIM):  An SE point of UNI-PRIM is a set of strategies $\{\{w_i^*\}_{i\in\mathcal{I}},p^*\}$  satisfying the following conditions.

Condition 1: $v_i (w_i^*)\geq v_i (w_i)~\forall w_i\in[0,\infty), i\in\mathcal{I}.$
Condition 2: $\sum_{i\in\mathcal{I}}F_i (w_i^*, p^*)=\sum_{i\in\mathcal{I}}w_i^*/p^*=F.$


Since UNI-PRIM is the same as FAID-PRIM with a fairness factor of 1, the following theorem is provided to find the SE of UNI-PRIM, which concludes this section.

_Theorem 2: _ The SE solution of UNI-PRIM is uniquely given by
$$
w_i^*=\sqrt{\frac{R_iC_ip^*}{\mu_i}}\tag{13}
$$

And
$$p^{*}=\frac{\left(\sum_{k\in\mathcal{I}}{\sqrt{\frac{R_{k}C_{k}}{\mu_{k}}}}\right)^{2}}{F^{2}}.\tag{14}$$


_Proof: _ Suppose that the provider declares a uniform unit price _p_∗ to all users. Then, the user’s utility function is given by
$$\nu_{i}(w_{i})=-\frac{R_{i}C_{i}p^{*}}{w_{i}}-\mu_{i}w_{i}.\tag{15}$$

Taking first and second derivative, we get
$$\frac{d}{d w_{i}}\nu_{i}(w_{i})=\frac{R_{i}C_{i}p^{\ast}}{w_{i}^{2}}-\mu_{i}\tag{16}$$
And
$$\frac{d^{2}}{d w_{i}^{2}}\nu_{i}(w_{i})=-\frac{2R_{i}C_{i}p^{\star}}{w_{i}^{3}}.\tag{17}$$


The second derivative is negative over _wi_ > 0, proving the concavity of the utility function. Then, if there exists _wi_ that makes the first derivative 0, it is the unique maximizer of the function. Thus, the optimal point _w_∗_i_ is uniquely given by (13). Meanwhile, the provider exactly predicts how much the users pay and decides the unit price to sell all of the CPU cycles in edge computing. Then, _p_∗ is determined to satisfy $\sum_{k\in\mathcal{I}}w_k^*= p^*F$ . Thus, ${F}p^{*}-(\sum_{k\in\mathcal{I}}\sqrt{(R_{k}C_{k}/\mu_{k})})\sqrt{p^{*}}=0$, proving the uniqueness of _p_∗ and (14).

Theorem 2 shows that the users’ payments and the unit price to sell all CPU cycles in edge computing are uniquely determined when the IoT devices choose their strategies to maximize their own utilities.

### C. FAID-PRIM

In the Stackelberg game of FAID-PRIM, the stable market price may exist at the SE point, defined as follows similar to UNI-PRIM.

_Definition 5 (SE of FAID-PRIM): _ An SE point of FAIDPRIM is a set of strategies $\{\{w_{i}^{*}\}_{i\in\mathcal{I}},\{p_{i}^{*}\}_{i\in\mathcal{I}}\}$  satisfying the following conditions.

Condition 1: $v_i (w_i^*)\geq v_i (w_i)$ $\forall w_i\in[0,\infty), i\in\mathcal{I}.$
Condition 2:\colon $\sum_{i\in\mathcal{I}}F_i (w_i^*, p_i^*)=\sum_{i\in\mathcal{I}}w_i^*/p_i^*=F.$


To find the optimal unit prices to maximize the seller’s revenue in FAID-PRIM, following definition and lemma are provided.

_Definition 6: _ The vector of the optimal differentiated unit prices, $p=[p_{1}, p_{2},\ldots, p_{N}]\ (p_{i}\in[0, p_{\mathrm{max}}]\forall i\in\mathcal{I})$, are defined as
$$P=\mathrm{arg\,max}\sum_{k\in\mathbb{Z}}w_{i}\tag{18}$$

where $w_i=\arg\max_{w_i}\nu_i (w_i, p_i)=\arg\max_{w_i}(-[(R_iC_ip_i)/w_i]-\mu_iw_i)$, $\sum_{k\in\mathcal{I}}F_k=F$, and the condition(4) holds.

**_Lemma 6: _ The vector _p_** = **[_p_1**,**_p_2**,...,**_pN_]** (**_pi_** > **0** ∀**_i_** ∈ I) **is the optimal differentiated unit price vector if and only if it is the solution to the following** optimization problem:
$$
\begin{aligned}\max_p&\sum_{k\in\mathcal{I}}\sqrt{\frac{R_kC_kp_k}{\mu_k}}\\\text{subject to }&\begin{cases}\sum_{k\in\mathcal{I}}\sqrt{\frac{R_kC_k}{\mu_kp_k}}=F\\1\leq\frac{\max_{k\in\mathcal{I}}p_k}{\min_{k\in\mathcal{I}}p_k}\leq f.\end{cases}\end{aligned}\tag{19}
$$

**_Proof:_ The utility function, _vi_**(**_wi_**) = −(**[_RiCipi_]**/**_wi_**) − μ**_iwi_, is strictly concave and continuously differentiable. Thus, it has a unique maximizer _wi_** = √(**[_RiCipi_]**/μ**_i_**)**, making its first derivative 0. Substituting _wi_ to (18), we get (19)**

**_Problem 1:_ To solve this optimization problem, a more simplified problem is proposed.**
$$
\begin{aligned}\max_{\mathbf{x}}&\sum_{i=1}^N\frac{a_i}{x_i}\\\text{subject to}&\begin{cases}\sum_{i=1}^Na_ix_i=s\\1\leq\frac{\max_{i\in\mathcal{I}}x_i}{\min_{i\in\mathcal{I}}x_i}\leq K\\a_i,x_i>0\quad\forall i\in\mathcal{I}.\end{cases}\end{aligned}\tag{20}
$$


_Lemma 7: _ If x = [_x_1,_x_2,...,_xN_] is the solution to Problem 1, then _xi_ ∈ {max_k_∈I _xk_,min_k_∈I _xk_} for every $i∈ I$ .

**_Proof: _ The proof is in the Appendix.**

_Theorem 3: _ Suppose that two sets A_= {α1,α2,...,α_n} and B = {β1,β2,...,β_N_−_n_} satisfy _A_ ∩ _B_ = ∅,_A_ ∪ _B_ ={_a_1,_a_2,...,_aN_}, and $|\sum_{x\in A}x-\sum_{x\in B}x|$ is the smallest among all divisions of the set {_a_1,_a_2,...,_a__N_}. Here, let $\sum_{x\in A}x={\alpha}$  and $\sum_{x\in B}x={\beta}$.

Then, the solution to the Problem 1 is uniquely given by
$$
x_i=\begin{cases}\frac{s}{\alpha+K\beta},&\text{if}\ a_i\in A\\\frac{Ks}{\alpha+K\beta},&\text{if}\ a_i\in B.\end{cases}\tag{21}
$$


_Proof: _ By Lemma 7, the solution to Problem 1 consists of two different real numbers, denoted by _x_max and _x_min. Suppose that x is the solution to the problem. Then, define _A_ = {max_ai_|_xi_ = _x_min} and _B_ = {_ai_|_xi_ = _x_max}. Also, denote that _xx_min = _k_.
**According to the equality condition**
$$
\begin{gathered}
x_{\mathrm{min}} =\frac{s}{\sum_{x\in A}x+k\sum_{x\in B}x} \\
x_{\mathrm{max}} =\frac{ks}{\sum_{x\in A}x+k\sum_{x\in B}x}. 
\end{gathered}
$$


Denote x∈A=α, x∈B=β,andα+β=γ.Then,the following equality is satisfied:
$$
\begin{gathered}
\sum_{i=1}^{N}{\frac{a_{i}}{x_{i}}} =\sum_{x\in A}\frac{x(\alpha+k\beta)}{s}+\sum_{x\in B}\frac{x(\alpha+k\beta)}{ks} \\
=\frac{\alpha(\alpha+k\beta)}{s}+\frac{\beta(\alpha+k\beta)}{ks} \\
=\frac{(\alpha+\beta)^{2}+(k+\frac{1}{k}-2)\alpha\beta}{s} \\
=\frac{\gamma^{2}+(k+\frac{1}{k}-2)\alpha(\gamma-\alpha)}{s}. 
\end{gathered}
$$
Here, it is a quadratic function of α, which has a negative leading coefficient and the axis _x_ = γ/2. Since x is the solution to Problem 1, α is the closest to γ/2 among all other possible divisions of the coefficient set. Therefore, it satisfies (21).

Conversely, we can prove that x satisfying (21) is the solution to Problem 1 in the same way.

_Theorem 4: _ Suppose that two sets _A_ = {α1,α2,...,α_n_} and√ _B_ = {β1,β2,...,β_N_−_n_} satisfy _A_ ∩ _B_ = ∅,_A_ ∪ _B_| ={the smallest among all divisions of the set $\{\sqrt{([R_{i}C_{i}]/\mu_{i})}|i= 1,2,...,N\}$, and $|\sum_{x\in A}x-\sum_{x\in B}x|$  is the smallest among all divisions of the set $\{\sqrt{([R_{i}C_{i}]/\mu_{i})}|i= 1,2,...,N\}$. Here, let $\sum_{x\in A}x={\alpha}$  and $\sum_{x\in B}x={\beta}$.

Then, the optimal differentiated unit price vector $p$ is uniquely given by
$$
p_i=\begin{cases}\left(\frac{\alpha+\beta f^{1/2}}{F}\right)^2,&\text{if }\sqrt{\frac{R_iC_i}{\mu_i}}\in A\\\left(\frac{\alpha+\beta f^{1/2}}{f^{1/2}F}\right)^2,&\text{if }\sqrt{\frac{R_iC_i}{\mu_i}}\in B.\end{cases}\tag{22}
$$

_Proof: _ By substituting _pi_,and _K_ = √_f_ to (21), we can easily get the optimal differentiated unit price as (22).

### D. Comparison of Three Models

In this section, the mathematical comparisons among the proposed three models are provided.

_Theorem 5:_ The seller’s total revenue of FAID-PRIM is strictly increasing with $f ≥ 1$. Especially, it is identical to UNI-PRIM when $f = 1$.

_Proof:_ In FAID-PRIM
$$
\sum_{k\in\mathcal{I}}w_k=\frac{\alpha^2+\beta^2+(f^{1/2}+f^{-1/2})\alpha\beta}F.\tag{23}
$$

In UNI-PRIM
$$
\sum_{k\in\mathcal{I}}w_k=\frac{(\alpha+\beta)^2}F.\tag{24}
$$

The difference of total revenues between these two models is $$\frac{(f^{1/2}+f^{-1/2}-2)\alpha\beta}F\tag{25}$$ 

which is strictly increasing with $f$. Especially, when $f$ = 1, the difference equals to 0, showing that UNI-PRIM is identical to FAID-PRIM when _f_= 1.

_Corollary 1:_ The ratio of the difference of the revenue between the second and FAID-PRIM to the revenue of UNI-PRIM approximately equals to
$$
\frac{f^{1/2}+f^{-1/2}-2}4
$$


when α and β are close enough.
_Proof: _ The ratio equals to
$$
\frac{(f^{1/2}+f^{-1/2}-2)\alpha\beta}{(\alpha+\beta)^2}.\tag{26}
$$


When α and β are close enough, we can assume that α ≈ β.Therefore
$$
\begin{aligned}\frac{\left(f^{1/2}+f^{-1/2}-2\right)\alpha\beta}{(\alpha+\beta)^2}&\approx\frac{\left(f^{1/2}+f^{-1/2}-2\right)\alpha^2}{(2\alpha)^2}\\&=\frac{f^{1/2}+f^{-1/2}-2}{4}.\end{aligned}
$$


Corollary 1 suggests an approximate formula about how much increase in revenue the seller can expect by choosing FAID-PRIM instead of UNI-PRIM. Taking $f$ = 3.47, the edge seller can expect 10% increase in their revenue.

_Theorem 6:_ The seller’s total revenue of UNI-PRIM is always higher than the total revenue of BID-PRAM.

_Proof: _ Consider the first and second allocation models for the same users I = {1,2,...,_N_}. Let the unit prices of the two models be _p_1 and _p_2. Denote that [_w_∗1,_w_∗2,...,_w_∗_N_] and [_w,...,_w_∗_N_] represent the costs users pay in first and second models. Then, the unit prices and costs satisfy the following equalities:
$$
\begin{aligned}\sum_{k\in\mathcal{I}}w_k^*&=p_1F\\\sum_{k\in\mathcal{I}}w_k^*&=p_2F.\end{aligned}
$$

These equalities yield another equation relating the unit prices and costs
$$
\begin{array}{l}
\sum_{k\in\mathcal{I}}\biggl({\frac{w_{k}^{*}}{p_{1}}}-{\frac{w_{k}^{*}}{p_{2}}}\biggr) \\
=\sum_{k\in\mathcal{I}}\left(\frac{-R_{k}C_{k}+\sqrt{R_{k}^{2}C_{k}^{2}+4\mu_{k}F^{2}R_{k}C_{k}p_{1}}}{2\mu_{k}Fp_{1}}-\sqrt{\frac{R_{k}C_{k}}{\mu_{k}p_{2}}}\right) \\
=0. 
\end{array}\tag{27}
$$
Let $f_k (x)=([-R_{k}C_{k}+\sqrt{R_{k}^{2}C_{k}^{2}+4\mu_{k} F^{2} R_{k} C_{k} x}/[2\mu_kF_x])$ and $g_k (x)=\sqrt{([R_kC_k/\mu_kx])}$. Then, both are positive over $x>0$. Also
$$
\begin{array}{l}
g_{k}^{2}(x)-f_{k}^{2}(x) \\
=\frac{R_{k}C_{k}}{2\mu_{k}^{2}F^{2}x^{2}}\left(\sqrt{R_{k}^{2}C_{k}^{2}+4\mu_{k}F^{2}R_{k}C_{k}x}-R_{k}C_{k}\right) \\
>0
\end{array}
$$
Which means $f_k (x)<g_k (x)$.
In addition, both functions are decreasing on $x>0$. Assume that $p_1\ge p_2$. Then
$$
\begin{aligned}
\sum_{k\in\mathcal{I}}\biggl(\frac{w_{k}^{*}}{p_{1}}-\frac{w_{k}^{*}}{p_{2}}\biggr)& =\sum_{k\in{\cal I}}(f_{k}(p_{1})-g_{k}(p_{2}))  \\
&\leq\sum_{k\in{\cal I}}(f_{k}(p_{2})-g_{k}(p_{2})) \\
&\text{<0}
\end{aligned}
$$
Which contradicts (27).

**Therefore, _p_1 is smaller than _p_2, proving that the total revenue of UNI-PRIM, _p_2_F_, is always higher than the revenue of BID-PRAM, _p_1_F_.**

Theorems 5 and 6 show that the seller’s revenue decreases in this order: FAID-PRIM, UNI-PRIM, and BID-PRAM. However, the seller using FAID-PRIM has to deal with complaints about price discrimination of users, so he or she should adopt one of the three trading system models considering each model’s strengths and weaknesses.

## 4. NUMERICAL RESULTS

![[Pasted image 20230802100058.png]]
TABLE II ROLES OF EACH FILE IN GITHUB CODES

In this section, several numerical results of the proposed three allocations mechanisms are given to validate the proposed theorems and to analyze the performances of them. All simulations used in this section are based on Python 3.5, and the programmed codes are provided in GitHub [50]. The role of each file is explained in Table II.

Let the set of users be {1,2,3,4,5}, and consider the situation that two users (users 1 and 2) are trying to run voice recognition algorithms, two users (users 3 and 4) are running face recognition programs, and one device (user 5) is playing a video game. Assume the set of the sizes of their data be (_a_1,_a_2,_a_3,_a_4,_a_5) = (1,2,8,10,15) MB. Also, assume that the constants μ_i_ of each user are given by (μ1,μ2,μ3,μ4,μ5) = (1,1.5,2,3,5). The total CPU cycles of the edge computing are set to be 8 GHz. In [51], the processing densities of face recognition algorithms and 400 frame video game are 31680 and 2640 cycles per bit, so it is reasonable to let the needed CPU cycles per 1 bit for users 3, 4, and 5 be 31680, 31680, and 2640, respectively. Likewise, we assumed that the processing density of voice recognition programs is 20000 cycles per bit.

### A. Validation of Theorems

First, validation of Theorem 1 will be proposed. For the situation suggested above, the NE point is given by
w∗ = [122.4, 139.7, 275.0, 255.2, 79.23] (28)
which can be obtained by Theorem 1. To verify the validity of this result, it is sufficient to check that the utility of the third user is maximized when _w_∗3 = 275.0.

![[Pasted image 20230802100316.png]]
Fig. 4. Utility of each users when the payment of the third user varies from 137.5 to 412.5.

From Fig. 4, when the third user’s payment varies from 0.5 ![[Pasted image 20230802100134.png]] to 1. ![[Pasted image 20230802100142.png]], the utility of the third user reaches the highest value −1354 at _w_3 = 275.0, which is equivalent to the calculated NE point from Theorem 1.

Second, Theorem 2 will be verified numerically. For same users suggested in the beginning of the section, Theorem 2 proposes that the unit price is determined as 0.1444 to allocate all of the CPU Cycles in UNI-PRIM. For validation of this result, the unit price will be changed from 0 to theoretical unit price.

![[Pasted image 20230802100342.png]]
Fig. 5. Distributed CPU cycles and their sum when the unit price varies from 0.11 to 0.16.

From Fig. 5, we can see that when the unit price changes from 0 to 0.1444, the total distributed CPU cycles keep decreasing. Also, the distributed CPU cycles reach 8 GHz, the total CPU cycles of the edge computing, at 0.1444, certifying Theorem 2.

### B. Comparison Among Three Models

We first compare the value of the utility function and payments of each user in three models. Assumptions for properties of device users and the cloud are equivalent to the previous section.

![[Pasted image 20230802100405.png]]
Fig. 6. Each user’s absolute value of the utility function in each model.

In Fig. 6, the absolute values of the utility function are suggested through the 3-D graph, and the average value is demonstrated in gray bars. It is shown that the absolute value of the utility function has a tendency to increase in the order of BID-PRAM, UNI-PRIM, and FAID-PRIM, meaning the real value decreases in the same order.

![[Pasted image 20230802100428.png]]
Fig. 7. Each user’s payment in each model.

Also, Fig. 7, showing the payments of users in three models, demonstrates the tendency of increasing payments in the order of BID-PRAM, UNI-PRIM, and FAID-PRIM. This result is consistent with theorems in Section III-D, giving a theoretical comparison between the models. These tendencies of utilities and payments are summarized in Fig. 8. The absolute values of the sum of utilities and total revenues of the seller are both increasing in order of BID-PRAM, UNI-PRIM, and FAIDPRIM.

In addition, a simulation containing randomly generated device users is designed for the realization of real-life situations. Assume the total CPU cycles of the edge computing is 100, the needed CPU cycles per 1 bit is 10, and the fairness factor is 3.5. Also, each user is generated, taking μ and the size of its data randomly between 0 to 10. We differentiated the number of device users and plotted the unit prices of three models in each number of users. Fig. 9 effectively demonstrates the result.

![[Pasted image 20230802100506.png]]
Fig. 9. Trend of unit prices as the number of users increase.

In Fig. 9, we can easily see the increasing value of unit prices as the number of users increases, showing the principle of supply and demand. Also, the relations between each model demonstrated in Theorems 5 and 6 are verified even in the systems of more users.

### C. Changes of Systems as CPU Cycles Increase

With same mobile users of previous sections, we analyzed the systems of three models, increasing the total CPU cycles of edge computing. We can intuitively predict that the utilities of users will increase and the total delays of users will decrease as CPU cycles increase. Also, we can anticipate that the payments will decrease, according to the principle of supply and demand.

![[Pasted image 20230802100831.png]]
Fig. 10. Average processing time of mobile users as CPU cycles increase.

![[Pasted image 20230802100848.png]]
Fig. 11. Average payment of mobile users as CPU cycles increase.

![[Pasted image 20230802100907.png]]
Fig. 12. Average utility of mobile users as CPU cycles increase.

Increasing the CPU cycles of the edge computing from 2 to 8 GHz, the changes of average processing times, payments, and utilities are shown in Figs. 10–12. Figs. 10 and 11 show that the average processing times and payments of mobile users tend to decrease as the total CPU cycles increase, and they follow the tendencies similar to inversely proportional relations. Hence, the average utility of users tends to increase as CPU cycles of the edge computing increase, meaning that the total CPU cycles of the edge computing can be improved to make mobile users more satisfied. These numerical results certify that the CPU cycles of the edge computing are directly related to the overall happiness of the systems.

## 5. DISCUSSIONS

In this section, we discuss potential applications of the proposed algorithms to real world, justification of the proposed game models, and the future direction of this research.

Amazon Web Services (AWSs) provides the Spot Instances pricing scheme for Amazon Elastic Compute Cloud (Amazon EC2) [52], which is a service that provides scalable computing in the AWSs cloud [53]. Compared to the on-demand pricing scheme, the Spot Instances pricing scheme reduces the cost by 90% and it varies in real time according to Amazon EC2 usage. This is a good example of how the dynamic pricing scheme is utilized in the real world.

In this manner, IoT edge servers may also implement dynamic pricing policies in order to make the best use of their resources. In order to do so, an edge server needs to determine a pricing mechanism and a corresponding price optimization algorithm, such as the proposed mechanisms and algorithms in this article, to maximize profit. These algorithms may work online by predicting the IoT users’ optimal offloading strategies for game-theoretic approaches. They may also be recommended for edge servers to provide optimal offloading strategies to all IoT users in order to lower the probability of IoT users behaving unpredictably.

In terms of game theory, the resource trading mechanism of edge computing for IoT may have various trading models in addition to the three types proposed in this article. The edge server may choose one of the resource trading mechanisms, based on the status of the edge server. One of the most widely used methods for resource trading is the Double auction mechanism, which takes a little longer to complete a transaction. Therefore, the Double auction mechanism is suitable for edge computation offloading, such as a batch process, where the delay limit is not strict. For real-time offloading applications, however, the Double auction method can hardly be used due to the long transaction time. This article proposes alternative and more suitable models for real-time offloading applications since they approach the NE quickly.

![[Pasted image 20230802100939.png]]
TABLE III AVERAGE ELAPSED TIME FOR THE PROPOSED ALGORITHMS

An important point to note here is that, for real-time applications, an optimal resource allocation algorithm should perform fast enough to run online on an edge computing server. In order to see the proposed algorithms’ performance in this respect, we evaluated the average runtime for each algorithm. Experiments were performed on a computer with 4.00-GHz i7-6700K CPU and 36-GB RAM. The experimental results are shown in Table III.

As the research progresses, we expect the following topics to be addressed. An edge resource trading model that considers not only the delay of IoT device offloading but also the energy efficiency will be proposed, and its equilibrium will be analyzed. In addition, we will propose and analyze a multipleleader-multiple-follower edge resource trading model in which one or more edge servers compete with each other. An edge resource trading model for the network between IoT devices and edge servers can also be proposed and analyzed more precisely. Last, an edge resource trading model that considers applications, networks, and offloading models in a more realistic manner will be proposed, and the performance of the trading system will be compared and analyzed using the same analysis as this article.

## 6. CONCLUSION

This article has examined the issues of how to price the computing resource of the edge computing server for edge computing in an IoT environment. To this end, three dynamic pricing mechanisms are proposed and rigorously analyzed to compare to each other: 1) BID-PRAM; 2) UNI-PRIM; and 3) FAID-PRIM. We modeled each pricing scheme from a game-theoretical perspective and derived NE solutions from existence to uniqueness. Numerical results verified our theorems, and presented statistical results to compare the three mechanisms. Through these results, we have identified the advantages and disadvantages of each model to give edge computing service providers guidance on pricing schemes. This study will emphasize the necessity and importance of the pricing scheme of edge computing for IoT, and will provide a basis for studying various pricing policies.