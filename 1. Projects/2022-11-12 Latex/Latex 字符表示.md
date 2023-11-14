
#Todo 图片替换
## 一. 花式字体
不同字体宏包下，同一字体的表现不同。一般不用加宏包即可。
### 黑板粗体字
实数、整数、有理数、复数的大写字母。  
`$\mathbb{ABCDEF}$`:$\mathbb{ABCDEF}$
`$\Bbb{ABCDEF}$`:$\Bbb{ABCDEF}$

### 黑体字
`$\mathbf{ABCDEFGHIJKLMNOPQRSTUVWXYZ}$` : $$\mathbf{ABCDEFGHIJKLMNOPQRSTUVWXYZ}$$
`$\mathbf{abcdefghijklmnopqrstuvwxyz}$` :$$\mathbf{abcdefghijklmnopqrstuvwxyz}$$

### 打印机字体
`$\mathtt ABCDEFGHIJKLMNOPQRSTUVWXYZ$` : ![\mathtt {ABCDEFGHIJKLMNOPQRSTUVWXYZ}](https://latex.codecogs.com/gif.latex?%5Cmathtt%20%7BABCDEFGHIJKLMNOPQRSTUVWXYZ%7D)


```
\begin{array}{ll} \texttt{"normal"}      & ABCDEFGHIJKLMNOPQRSTUVWXYZ\\ \texttt{"blackboard"}  &$\mathbb{ABCDEFGHIJKLMNOPQRSTUVWXYZ}$\\ \texttt{"boldface"}    &$\mathbf{ABCDEFGHIJKLMNOPQRSTUVWXYZ}$\\ \texttt{"typewriter"}  &$\mathtt{ABCDEFGHIJKLMNOPQRSTUVWXYZ}$\\ \texttt{"roman"}       &$\mathrm{ABCDEFGHIJKLMNOPQRSTUVWXYZ}$\\ \texttt{"sans-serif"}  &$\mathsf{ABCDEFGHIJKLMNOPQRSTUVWXYZ}$\\ \texttt{"calligraphic"}&$\mathcal{ABCDEFGHIJKLMNOPQRSTUVWXYZ}$\\ \texttt{"script"}      &$\mathscr{ABCDEFGHIJKLMNOPQRSTUVWXYZ}$\\ \texttt{"fraktur"}     &$\mathfrak{ABCDEFGHIJKLMNOPQRSTUVWXYZ}$\\\end{array}
```

输出结果

$$
\begin{array}{ll}   \texttt{"normal"}      & ABCDEFGHIJKLMNOPQRSTUVWXYZ\\   \texttt{"blackboard"}  &$\mathbb{ABCDEFGHIJKLMNOPQRSTUVWXYZ}$\\   \texttt{"boldface"}    &$\mathbf{ABCDEFGHIJKLMNOPQRSTUVWXYZ}$\\   \texttt{"typewriter"}  &$\mathtt{ABCDEFGHIJKLMNOPQRSTUVWXYZ}$\\   \texttt{"roman"}       &$\mathrm{ABCDEFGHIJKLMNOPQRSTUVWXYZ}$\\   \texttt{"sans-serif"}  &$\mathsf{ABCDEFGHIJKLMNOPQRSTUVWXYZ}$\\   \texttt{"calligraphic"}&$\mathcal{ABCDEFGHIJKLMNOPQRSTUVWXYZ}$\\   \texttt{"script"}      &$\mathscr{ABCDEFGHIJKLMNOPQRSTUVWXYZ}$\\   \texttt{"fraktur"}     &$\mathfrak{ABCDEFGHIJKLMNOPQRSTUVWXYZ}$\\  \end{array}
$$

## 二. 希腊字母

##  小写希腊字母

|   样式  |   语法  |   样式  |   语法  |   样式  |   语法  |
|   :----:  |   :----   |   :----:  |   :----   |   :----:  |   :----   |
|   $\alpha$    |   `\alpha`    |   $\vartheta$ |   `\vartheta` |   $\rho$  |   `\rho`  |
|   $\beta$ |   `\beta` |   $\iota$ |   `\iota` |   $\varrho$   |   `\varrho`   |
|   $\gamma$    |   `\gamma`    |   $\kappa$    |   `\kappa`    |   $\sigma$    |   `\sigma`    |
|   $\delta$    |   `\delta`    |   $\lambda$   |   `\lambda`   |   $\tau$  |   `\tau`  |
|   $\epsilon$  |   `\epsilon`  |   $\mu$   |   `\mu`   |   $\phi$  |   `\phi`  |
|   $\varepsilon$   |   `\varepsilon`   |   $\nu$   |   `\nu`   |   $\varphi$   |   `\varphi`   |
|   $\zeta$ |   `\zeta` |   $\xi$   |   `\xi`   |   $\chi$  |   `\chi`  |
|   $\eta$  |   `\eta`  |   $\pi$   |   `\pi`   |   $\psi$  |   `\psi`  |
|   $\theta$    |   `\theta`    |   $\varpi$    |   `\varpi`    |   $\omega$    |   `\omega`    |


## 大写希腊字母

|   样式  |   语法  |   样式  |   语法  |   样式  |   语法  |
|   :----:  |   :----   |   :----:  |   :----   |   :----:  |   :----   |
|   $\Gamma$    |   `\Gamma`    |   $\Xi$   |   `\Xi`   |   $\Phi$  |   `\Phi`  |
|   $\Delta$    |   `\Delta`    |   $\Pi$   |   `\Pi`   |   $\Psi$  |   `\Psi`  |
|   $\Theta$    |   `\Theta`    |   $\Sigma$    |   `\Sigma`    |   $\Omega$    |   `\Omega`    |
|   $\Lambda$   |   `\Lambda`   |   $\Upsilon$  |   `\Upsilon`  |       |       |

## 三. 色彩表

## 色彩表1

```
\begin{array}{|lc|}\hline \verb+\color{black}{黑色}+    & \color{black}{黑色}   \\ \verb+\color{darkgray}{深灰}+ & \color{darkgray}{深灰}\\ \verb+\color{gray}{灰色}+     & \color{gray}{灰色}    \\ \verb+\color{silver}{银色}+   & \color{silver}{银色}  \\ \verb+\color{lightgray}{浅灰}+&\color{lightgray}{浅灰}\\ \verb+\color{white}{白色}+    & \color{white}{白色}   \\\hline \verb+\color{brown}{棕色}+    & \color{brown}{棕色}   \\ \verb+\color{maroon}{栗色}+   & \color{maroon}{栗色}  \\ \verb+\color{red}{红色}+      & \color{red}{红色}     \\ \verb+\color{fuchsia}{桃红}+  & \color{fuchsia}{桃红} \\ \verb+\color{magenta}{品红}+  & \color{magenta}{品红} \\ \verb+\color{pink}{粉红}+     & \color{pink}{粉红}    \\ \verb+\color{orange}{橙色}+   & \color{orange}{橙色}  \\ \verb+\color{yellow}{黄色}+   & \color{yellow}{黄色}  \\ \verb+\color{lime}{青柠}+     & \color{lime}{青柠}    \\ \verb+\color{olive}{橄榄}+    & \color{olive}{橄榄}   \\ \verb+\color{green}{绿色}+    & \color{green}{绿色}   \\ \verb+\color{aqua}{水绿}+     & \color{aqua}{水绿}    \\ \verb+\color{cyan}{青色}+     & \color{cyan}{青色}    \\ \verb+\color{teal}{靛青}+     & \color{teal}{靛青}    \\ \verb+\color{blue}{蓝色}+     & \color{blue}{蓝色}    \\ \verb+\color{navy}{海蓝}+     & \color{navy}{海蓝}    \\ \verb+\color{violet}{罗兰}+   & \color{purple}{罗兰}  \\  \verb+\color{purple}{紫色}+   & \color{purple}{紫色}  \\ \hline\end{array}
```

**实现效果：**

$$
\begin{array}{|lc|}  \hline   \verb+\color{black}{黑色}+    & \color{black}{黑色}   \\   \verb+\color{darkgray}{深灰}+ & \color{darkgray}{深灰}\\   \verb+\color{gray}{灰色}+     & \color{gray}{灰色}    \\   \verb+\color{silver}{银色}+   & \color{silver}{银色}  \\   \verb+\color{lightgray}{浅灰}+&\color{lightgray}{浅灰}\\   \verb+\color{white}{白色}+    & \color{white}{白色}   \\  \hline   \verb+\color{brown}{棕色}+    & \color{brown}{棕色}   \\   \verb+\color{maroon}{栗色}+   & \color{maroon}{栗色}  \\   \verb+\color{red}{红色}+      & \color{red}{红色}     \\   \verb+\color{fuchsia}{桃红}+  & \color{fuchsia}{桃红} \\   \verb+\color{magenta}{品红}+  & \color{magenta}{品红} \\   \verb+\color{pink}{粉红}+     & \color{pink}{粉红}    \\   \verb+\color{orange}{橙色}+   & \color{orange}{橙色}  \\   \verb+\color{yellow}{黄色}+   & \color{yellow}{黄色}  \\   \verb+\color{lime}{青柠}+     & \color{lime}{青柠}    \\   \verb+\color{olive}{橄榄}+    & \color{olive}{橄榄}   \\   \verb+\color{green}{绿色}+    & \color{green}{绿色}   \\   \verb+\color{aqua}{水绿}+     & \color{aqua}{水绿}    \\   \verb+\color{cyan}{青色}+     & \color{cyan}{青色}    \\   \verb+\color{teal}{靛青}+     & \color{teal}{靛青}    \\   \verb+\color{blue}{蓝色}+     & \color{blue}{蓝色}    \\   \verb+\color{navy}{海蓝}+     & \color{navy}{海蓝}    \\   \verb+\color{violet}{罗兰}+   & \color{purple}{罗兰}  \\    \verb+\color{purple}{紫色}+   & \color{purple}{紫色}  \\   \hline  \end{array}
$$

 

## 色彩表2

```
\begin{array}{|rrrrrrrr|}\hline\verb+#000+ & \color{#000}{text} & \verb+#005+ & \color{#005}{text} & \verb+#00A+ & \color{#00A}{text} & \verb+#00F+ & \color{#00F}{text}  \\\verb+#500+ & \color{#500}{text} & \verb+#505+ & \color{#505}{text} & \verb+#50A+ & \color{#50A}{text} & \verb+#50F+ & \color{#50F}{text}  \\\verb+#A00+ & \color{#A00}{text} & \verb+#A05+ & \color{#A05}{text} & \verb+#A0A+ & \color{#A0A}{text} & \verb+#A0F+ & \color{#A0F}{text}  \\\verb+#F00+ & \color{#F00}{text} & \verb+#F05+ & \color{#F05}{text} & \verb+#F0A+ & \color{#F0A}{text} & \verb+#F0F+ & \color{#F0F}{text}  \\\hline\verb+#080+ & \color{#080}{text} & \verb+#085+ & \color{#085}{text} & \verb+#08A+ & \color{#08A}{text} & \verb+#08F+ & \color{#08F}{text}  \\\verb+#580+ & \color{#580}{text} & \verb+#585+ & \color{#585}{text} & \verb+#58A+ & \color{#58A}{text} & \verb+#58F+ & \color{#58F}{text}  \\\verb+#A80+ & \color{#A80}{text} & \verb+#A85+ & \color{#A85}{text} & \verb+#A8A+ & \color{#A8A}{text} & \verb+#A8F+ & \color{#A8F}{text}  \\\verb+#F80+ & \color{#F80}{text} & \verb+#F85+ & \color{#F85}{text} & \verb+#F8A+ & \color{#F8A}{text} & \verb+#F8F+ & \color{#F8F}{text}  \\\hline\verb+#0F0+ & \color{#0F0}{text} & \verb+#0F5+ & \color{#0F5}{text} & \verb+#0FA+ & \color{#0FA}{text} & \verb+#0FF+ & \color{#0FF}{text}  \\\verb+#5F0+ & \color{#5F0}{text} & \verb+#5F5+ & \color{#5F5}{text} & \verb+#5FA+ & \color{#5FA}{text} & \verb+#5FF+ & \color{#5FF}{text}  \\\verb+#AF0+ & \color{#AF0}{text} & \verb+#AF5+ & \color{#AF5}{text} & \verb+#AFA+ & \color{#AFA}{text} & \verb+#AFF+ & \color{#AFF}{text}  \\\verb+#FF0+ & \color{#FF0}{text} & \verb+#FF5+ & \color{#FF5}{text} & \verb+#FFA+ & \color{#FFA}{text} & \verb+#FFF+ & \color{#FFF}{text}  \\\hline\end{array}
```

**实现效果：**

$$
\begin{array}{|rrrrrrrr|}  \hline  \verb+#000+ & \color{#000}{text} & \verb+#005+ & \color{#005}{text} & \verb+#00A+ & \color{#00A}{text} & \verb+#00F+ & \color{#00F}{text}  \\  \verb+#500+ & \color{#500}{text} & \verb+#505+ & \color{#505}{text} & \verb+#50A+ & \color{#50A}{text} & \verb+#50F+ & \color{#50F}{text}  \\  \verb+#A00+ & \color{#A00}{text} & \verb+#A05+ & \color{#A05}{text} & \verb+#A0A+ & \color{#A0A}{text} & \verb+#A0F+ & \color{#A0F}{text}  \\  \verb+#F00+ & \color{#F00}{text} & \verb+#F05+ & \color{#F05}{text} & \verb+#F0A+ & \color{#F0A}{text} & \verb+#F0F+ & \color{#F0F}{text}  \\  \hline  \verb+#080+ & \color{#080}{text} & \verb+#085+ & \color{#085}{text} & \verb+#08A+ & \color{#08A}{text} & \verb+#08F+ & \color{#08F}{text}  \\  \verb+#580+ & \color{#580}{text} & \verb+#585+ & \color{#585}{text} & \verb+#58A+ & \color{#58A}{text} & \verb+#58F+ & \color{#58F}{text}  \\  \verb+#A80+ & \color{#A80}{text} & \verb+#A85+ & \color{#A85}{text} & \verb+#A8A+ & \color{#A8A}{text} & \verb+#A8F+ & \color{#A8F}{text}  \\  \verb+#F80+ & \color{#F80}{text} & \verb+#F85+ & \color{#F85}{text} & \verb+#F8A+ & \color{#F8A}{text} & \verb+#F8F+ & \color{#F8F}{text}  \\  \hline  \verb+#0F0+ & \color{#0F0}{text} & \verb+#0F5+ & \color{#0F5}{text} & \verb+#0FA+ & \color{#0FA}{text} & \verb+#0FF+ & \color{#0FF}{text}  \\  \verb+#5F0+ & \color{#5F0}{text} & \verb+#5F5+ & \color{#5F5}{text} & \verb+#5FA+ & \color{#5FA}{text} & \verb+#5FF+ & \color{#5FF}{text}  \\  \verb+#AF0+ & \color{#AF0}{text} & \verb+#AF5+ & \color{#AF5}{text} & \verb+#AFA+ & \color{#AFA}{text} & \verb+#AFF+ & \color{#AFF}{text}  \\  \verb+#FF0+ & \color{#FF0}{text} & \verb+#FF5+ & \color{#FF5}{text} & \verb+#FFA+ & \color{#FFA}{text} & \verb+#FFF+ & \color{#FFF}{text}  \\  \hline  \end{array}
$$

 

## 四. 公式

## 常用公式符号

### 加粗
|名称|   样式  |   语法  |
|:---|:---:|:---|
|加粗|$\mathbf h$|`\mathbf h`|
|分数|$\frac{a-1}{b-1}$ |`\frac{a-1}{b-1}`|
|矢量|$\overleftarrow{xy}$|`\overleftarrow{xy}`|
||$\overleftrightarrow{xy}$|`\overleftrightarrow{xy}`|
||$\overrightarrow{xy}$|`\overrightarrow{xy}`|
|积分|$\int_0^1 {x^2} \,{\rm d}x$|`\int_0^1 {x^2} \,{\rm d}x`|
|累加|$\sum_{i=1}^n \frac{1}{i^2}$|`\sum_{i=1}^n \frac{1}{i^2}`|
|累乘|$\prod_{i=1}^n \frac{1}{i^2}$|`\prod_{i=1}^n \frac{1}{i^2}`|
|交集|$\bigcup_{i=1}^{2} R$|`\bigcup_{i=1}^{2} R`|


### 元素省略

```
$$\begin{pmatrix}1&a_1&a_1^2&\cdots&a_1^n\\1&a_2&a_2^2&\cdots&a_2^n\\\vdots&\vdots&\vdots&\ddots&\vdots\\1&a_m&a_m^2&\cdots&a_m^n\\\end{pmatrix}$$
```

$$
\begin{pmatrix}  1&a_1&a_1^2&\cdots&a_1^n\\  1&a_2&a_2^2&\cdots&a_2^n\\  \vdots&\vdots&\vdots&\ddots&\vdots\\  1&a_m&a_m^2&\cdots&a_m^n\\  \end{pmatrix}
$$

### 增广矩阵

```
$$\left[  \begin{array}  {c c | c} %这里的c表示数组中元素对其方式：c居中、r右对齐、l左对齐，竖线表示2、3列间插入竖线1 & 2 & 3 \\\hline %插入横线，如果去掉\hline就是增广矩阵4 & 5 & 6\end{array}  \right]$$
```

$$
\left[  \begin{array}  {c c | c}   1 & 2 & 3 \\  \hline   4 & 5 & 6  \end{array}  \right]
$$

  
 

## 分式

```
\begin{equation}x = a_0 + \cfrac{1^2}{a_1        + \cfrac{2^2}{a_2        + \cfrac{3^2}{a_3         + \cfrac{4^4}{a_4 + \cdots}}}}\end{equation}
```

**实现效果：**

$$
\begin{equation}  x = a_0 + \cfrac{1^2}{a_1          + \cfrac{2^2}{a_2          + \cfrac{3^2}{a_3           + \cfrac{4^4}{a_4 + \cdots}}}}  \end{equation}
$$

 

```
\begin{equation}\underset{j=1}{\overset{\infty}{\LARGE\mathrm K}}\frac{a_j}{b_j}=\cfrac{a_1}{b_1+\cfrac{a_2}{b_2+\cfrac{a_3}{b_3+\ddots}}}\end{equation}
```

**实现效果：** 

$$
\begin{equation}  \underset{j=1}{\overset{\infty}{\LARGE\mathrm K}}\frac{a_j}{b_j}  =\cfrac{a_1}{b_1  +\cfrac{a_2}{b_2  +\cfrac{a_3}{b_3  +\ddots}}}  \end{equation}
$$

```
\begin{equation}x = a_0 + \frac{1^2}{a_1+}          \frac{2^2}{a_2+}          \frac{3^2}{a_3 +}           \frac{4^4}{a_4 +} \cdots\end{equation}
```

**实现效果：** 

$$
\begin{equation}  x = a_0 + \frac{1^2}{a_1+}            \frac{2^2}{a_2+}            \frac{3^2}{a_3 +}             \frac{4^4}{a_4 +} \cdots  \end{equation}
$$

## 线性代数

```
\begin{array}{ll} \texttt{\overline}&\overline{AAA}\\ \texttt{\underline}&\underline{BBB}\\ \texttt{\widetilde}&\widetilde{CCC}\\ \texttt{\widehat}&\widehat{DDD}\\ \texttt{\fbox}&\fbox{EEE}\\\hline \texttt{\vec}&\vec{x}\ \mathrm{or}\ \vec{AB}\\ \texttt{\check}&\check{x}\\ \texttt{\acute}&\acute{x}\\ \texttt{\grave}&\grave{x}\\ \texttt{\bar}&\bar{x}\\ \texttt{\hat}&\hat{x}\\ \texttt{\tilde}&\tilde{x}\\ \texttt{\mathring}&\mathring{x}\\ \texttt{\dot}&\dot{x}\\ \texttt{\ddot}&\ddot{x}\\ \texttt{\dddot}&\dddot{x}\\\end{array}
```

**实现效果：** 
$$
\begin{array}{ll}

    \backslash hoverline&\overline{AAA}\\

    \backslash hunderline&\underline{BBB}\\

    \backslash hwidetilde&\widetilde{CCC}\\

    \backslash hwidehat&\widehat{DDD}\\

    \backslash hfbox&\fbox{EEE}\\

    \hline

    \backslash vec&\vec{x} \mathrm{or} \vec{AB}\\

    \backslash check&\check{x}\\

    \backslash acute&\acute{x}\\

    \backslash grave&\grave{x}\\

    \backslash bar&\bar{x}\\

    \backslash hat&\hat{x}\\

    \backslash tilde&\tilde{x}\\

    \backslash mathring&\mathring{x}\\

    \backslash dot&\dot{x}\\

    \backslash ddot&\ddot{x}\\

    \backslash dddot&\dddot{x}\\

    \end{array}
$$

## 矩阵


```
\begin{array}{lc} \texttt{smallmatrix}&\bigl(\begin{smallmatrix} a & b \\ c & d \end{smallmatrix}\bigr)\\ \texttt{matrix} &\begin{matrix} 1&2\\3&4\\ \end{matrix} \\ \texttt{pmatrix}&\begin{pmatrix}1&2\\3&4\\ \end{pmatrix}\\ \texttt{bmatrix}&\begin{bmatrix}1&2\\3&4\\ \end{bmatrix}\\ \texttt{Bmatrix}&\begin{Bmatrix}1&2\\3&4\\ \end{Bmatrix}\\ \texttt{vmatrix}&\begin{vmatrix}1&2\\3&4\\ \end{vmatrix}\\ \texttt{Vmatrix}&\begin{Vmatrix}1&2\\3&4\\ \end{Vmatrix}\\\end{array}
```

**实现效果：**

$$
\begin{array}{lc}   \texttt{smallmatrix}&\bigl(\begin{smallmatrix} a & b \\ c & d \end{smallmatrix}\bigr)\\   \texttt{matrix} &\begin{matrix} 1&2\\3&4\\ \end{matrix} \\   \texttt{pmatrix}&\begin{pmatrix}1&2\\3&4\\ \end{pmatrix}\\   \texttt{bmatrix}&\begin{bmatrix}1&2\\3&4\\ \end{bmatrix}\\   \texttt{Bmatrix}&\begin{Bmatrix}1&2\\3&4\\ \end{Bmatrix}\\   \texttt{vmatrix}&\begin{vmatrix}1&2\\3&4\\ \end{vmatrix}\\   \texttt{Vmatrix}&\begin{Vmatrix}1&2\\3&4\\ \end{Vmatrix}\\  \end{array}
$$

## ()矩阵

```
\begin{pmatrix}1 & a_1 & a_1^2 & \cdots & a_1^n \\1 & a_2 & a_2^2 & \cdots & a_2^n \\ \vdots  & \vdots& \vdots & \ddots & \vdots \\1 & a_m & a_m^2 & \cdots & a_m^n \\\end{pmatrix}
```

**实现效果：**  

$$
\begin{pmatrix}   1 & a_1 & a_1^2 & \cdots & a_1^n \\   1 & a_2 & a_2^2 & \cdots & a_2^n \\   \vdots  & \vdots& \vdots & \ddots & \vdots \\   1 & a_m & a_m^2 & \cdots & a_m^n \\  \end{pmatrix}
$$

## []矩阵

```
$$\left[\begin{array}{cc|c}1&2&3\\4&5&6\\\end{array}\right]$$
```

**实现效果：**

$$
\left[  \begin{array}{cc|c}    1&2&3\\    4&5&6\\  \end{array}  \right]
$$


### **方程式组**

```
\begin{array}{ll} a_1x+b_1y+c_1z=\frac{p_1}{q_1} \\[2ex]  a_2x+b_2y+c_2z=\frac{p_2}{q_2} \\[2ex]  a_3x+b_3y+c_3z=\frac{p_3}{q_3}\end{array}
```

**实现效果：**

$$
\begin{array}{ll}   a_1x+b_1y+c_1z=\frac{p_1}{q_1} \\[2ex]    a_2x+b_2y+c_2z=\frac{p_2}{q_2} \\[2ex]    a_3x+b_3y+c_3z=\frac{p_3}{q_3}  \end{array}
$$

## 约去符,删除线

```
\require{cancel}\require{enclose}\begin{array}{ll} \verb|y+\cancel{x}| & y+\cancel{x}\\ \verb|y+\bcancel{x}| & y+\bcancel{x}\\ \verb|y+\xcancel{x}| & y+\xcancel{x}\\ \verb|y+\cancelto{0}{x}| & y+\cancelto{0}{x}\\ \verb+\frac{1\cancel9}{\cancel95} = \frac15+& \frac{1\cancel9}{\cancel95} = \frac15 \\ \verb|\enclose{horizontalstrike}{x+y}| & \enclose{horizontalstrike}{x+y}\\ \verb|\enclose{verticalstrike}{\frac xy}| & \enclose{verticalstrike}{\frac xy}\\ \verb|\enclose{updiagonalstrike}{x+y}| & \enclose{updiagonalstrike}{x+y}\\ \verb|\enclose{downdiagonalstrike}{x+y}| & \enclose{downdiagonalstrike}{x+y}\\\end{array}
```

**实现效果：**
$$
\require{cancel}\require{enclose}\begin{array}{ll} \verb|y+\cancel{x}| & y+\cancel{x}\\ \verb|y+\bcancel{x}| & y+\bcancel{x}\\ \verb|y+\xcancel{x}| & y+\xcancel{x}\\ \verb|y+\cancelto{0}{x}| & y+\cancelto{0}{x}\\ \verb+\frac{1\cancel9}{\cancel95} = \frac15+& \frac{1\cancel9}{\cancel95} = \frac15 \\ \verb|\enclose{horizontalstrike}{x+y}| & \enclose{horizontalstrike}{x+y}\\ \verb|\enclose{verticalstrike}{\frac xy}| & \enclose{verticalstrike}{\frac xy}\\ \verb|\enclose{updiagonalstrike}{x+y}| & \enclose{updiagonalstrike}{x+y}\\ \verb|\enclose{downdiagonalstrike}{x+y}| & \enclose{downdiagonalstrike}{x+y}\\\end{array}
$$
## 五. 数学符号表

```
$$\hat{a} \check{a} \tilde{a} \acute{a}\grave{a} \dot{a} \ddot{a} \breve{a}\bar{a} \vec{a} \widehat{A} \widetilde{A}$$
```

$$
\hat{a} \check{a} \tilde{a} \acute{a}  \grave{a} \dot{a} \ddot{a} \breve{a}  \bar{a} \vec{a} \widehat{A} \widetilde{A}
$$

 

## 二元关系符

你可以在下述命令的前面加上\\not 来得到其否定形式。

![](https://img-blog.csdn.net/20180110120632516?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvY2NsZXRoZQ==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)

##  二元运算符

![](https://img-blog.csdn.net/20180110120646998?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvY2NsZXRoZQ==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)

## 大尺寸运算符 

![](https://img-blog.csdn.net/20180110120702635?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvY2NsZXRoZQ==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)

## 箭头

![](https://img-blog.csdn.net/20180110120733762?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvY2NsZXRoZQ==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)

##  定界符

![3-8](https://img-blog.csdn.net/20180110120745800?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvY2NsZXRoZQ==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)

## 大尺寸定界符

![](https://img-blog.csdn.net/20180110120758701?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvY2NsZXRoZQ==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)

## 其它符号

![](https://img-blog.csdn.net/20180110120831140?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvY2NsZXRoZQ==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)

## 非数学符号

![](https://img-blog.csdn.net/20180110120814709?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvY2NsZXRoZQ==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)

## AMS 定界符

 ![](https://img-blog.csdn.net/20180110120845203?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvY2NsZXRoZQ==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)

## AMS 希腊和希伯来字母

![3-12](https://img-blog.csdn.net/20180110120845203?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvY2NsZXRoZQ==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)

## AMS 二元关系符

![](https://img-blog.csdn.net/20180110120908923?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvY2NsZXRoZQ==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)

## AMS 箭头

![](https://img-blog.csdn.net/20180110120921290?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvY2NsZXRoZQ==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)

## AMS 二元否定关系符和箭头

![](https://img-blog.csdn.net/20180110120934677?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvY2NsZXRoZQ==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)

## AMS 二元运算符

![](https://img-blog.csdn.net/20180110120948160?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvY2NsZXRoZQ==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)

## AMS 其它符号


|  样式   | 语法  |  样式   | 语法  |  样式   | 语法  |
|  :----:  | :----  |  :----:  | :----  |  :----:  | :----  |
| $\hbar$  | `\hbar` |$\hslash$|`\hslash`|$\Bbbk$|`\Bbbk`|
| $\square$  | `\square` | $\blacksquare$ |`\blacksquare`|$\circledS$|`\circledS`|
|$\vartriangle$|`\vartriangle`|$\blacktriangle$|`\blacktriangle`|$\complement$|`\complement`|
|$\triangledown$|`\triangledown`|$\blacktriangledown$|`\blacktriangledown`|$\Game$|`\Game`|
|$\lozenge$|`\lozenge`|$\blacklozenge$|`\blacklozenge`|$\bigstar$|`\bigstar`|
|$\angle$|`\angle`|$\measuredangle$|`\measuredangle`|$\sphericalangle$|`\sphericalangle`|
|$\diagup$|`\diagup`|$\diagdown$|`\diagdown`|$\backprime$|`\backprime`|
|$\nexists$|`\nexists`|$\Finv$|`\Finv`|$\varnothing$|`\varnothing`|
|$\eth$|`\eth`|$\mho$|`\mho`|

## 大型运算符
$\underset{i}{argmax}$ 