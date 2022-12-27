强化学习被用来训练竞拍商
$<\mathcal{S},\mathcal{A},\mathcal{P},\mathcal{R}>$ 

# A.DDA的马尔可夫决策过程
## 1. 状态空间 S
回合t的动作空间为
$\mathcal{S}^t=\{\Psi^t,t,C^t_B,C^t_S,|W^t_B|,|W^t_S|\}$
- $\Psi^t$ 竞拍标志
- $t$ 竞拍回合
- $C^t_B,C^t_S$ 买卖双方的荷兰钟
- $|W^t_B|,|W^t_S|$ 买卖双方的胜者数 
## 2.动作空间 A
可行的调整荷兰钟的步长
$\forall t,a^t=\Theta^t \in \mathcal{A}$ 
## 3.回报 R
$$r(\mathcal{S}^tma^t,\mathcal{S}^{t+1})=\begin{cases}-u^t_B+tk_pp^t_C, &\Psi^t=0\\-u^t_S+tk_pp^t_C, &\Psi^t=1\end{cases}$$
- $u^t_B=\sum_{i\in W^{t+1}_B\backslash W^t_B} (v^B_i-C^t_B)$ 买家效用
- $u^t_S=\sum_{i\in W^{t+1}_S\backslash W^t_S} (C^t_S-v^S_i)$ 卖家效用
- $p^t_C=p_b * N_A(t)$ 广播信息交换费用
- $p_k$ 惩罚项
## 价值函数
给定政策$\pi$ ,状态S的价值函数$V_{\pi}$
$$V_\pi(S) := \mathbb{E}_\pi[\sum^K_{k=0}\gamma^k R(S^k,a^k)|S^0=S]$$
- $\mathbb{E}_\pi(·)$ 在折扣因子$\gamma\in [0,1]$ 智能体使用策略$\pi$ 的期望
- 通过调整时钟策略最大化价值函数
- 使用基于随机梯度上升的近似策略优化算法验证