---
UID: 20231205151722 
aliases: 
tags: 
source: 
cssclass: 
created: 2023-12-05
---

## ✍内容


LaTex是一款非常强大的文档排版工具，也经常被用于论文的书写与排版。因为LaTeX的学习曲线比较抖，初学者对于通常会对格式不是很熟，并且需要花很多的时间去查找如何排版图表。

我们这里分享一篇文章，给LaTeX初学者提一些经验，以及提供多个图表排版的例子，方便大家日后使用到自己的论文书写当中。

文章和LaTex文件可以在Github上看到：
https://github.com/guanyingc/latex_paper_writing_tips


> 首先介绍两个资源：  
> 1、Tips for Writing a Research Paper using LaTeX，[https://github.com/guanyingc/latex\_paper\_writing\_tips](https://link.zhihu.com/?target=https%3A//github.com/guanyingc/latex_paper_writing_tips)  
> 由陈冠英老师维护，给LaTeX初学者提供多个图表排版的例子，方便用到自己的论文当中。还有种会议poster的例子，可以参考。附[陈老师的知乎文章](https://zhuanlan.zhihu.com/p/435701387)。
> 
> 2、[ML Visuals](https://link.zhihu.com/?target=https%3A//github.com/dair-ai/ml-visuals)，里面包含100多个常用的神经网络的图，是google在线PPT的形式，[下载地址](https://link.zhihu.com/?target=https%3A//docs.google.com/presentation/d/11mR1nkIR9fbHegFkcFq8z9oDQ5sjv8E3JJp1LfLGKuk/edit)
> 
> 下面内容只分析科研作图，是我的一些个人想法，如果有不足可以留言指出。绘制表格可参考上面 陈老师 的文章。

审稿人看论文时非常容易关注论文里的图。论文里的图就是“第一印象”，规范的、高质量的图片是发表高水平文章的必备条件。个人感觉，论文里的图基本分为两种：模型图、数据展示图。

-   **模型图：**论文的总体框架图、模块细节图、流程图等
-   **数据展示图：** 展示数据的折线图、柱状图、散点图等

无论是哪种图，参考最近的CV顶会论文，配色一般是淡蓝、淡红、淡黄、淡绿 四种（彩虹一共才7种颜色，要体现对比就只能是这四种颜色了，汗 ... ... ），有时会用 紫色、灰色补充（紫色多用于模块，灰色多用于小区域或者大面积打底）。整个论文的配色风格需要一致，比如说后面的折线图、柱状图、散点图最好还是以前面框架的颜色一致。（如果前面模型图是淡蓝色，后面再出现过于鲜艳的其它颜色就有些突兀）

下面展示一些典型模型图的例子：

![](https://pic2.zhimg.com/v2-2570b5ff4d626907e2f223ef1b991585_b.jpg)

![](https://pic3.zhimg.com/v2-2a57ee2bfd0bb353e4c3cacd500d8ef2_b.jpg)

![](https://pic2.zhimg.com/v2-fffd1f14e58e8e72d55cbe4b974c594d_b.jpg)

![](https://pic3.zhimg.com/v2-19806ad482129e26ad4b81d7aee1766a_b.jpg)

![](https://pic1.zhimg.com/v2-94b0d307178ee82b742620be2e8cf3d0_b.jpg)

下面展示一些典型数据展示图的例子：

![](https://pic4.zhimg.com/v2-4cd79b427983d017f8237b5e7dcb3b97_b.jpg)

![](https://pic2.zhimg.com/v2-48f174f8e51c5cb430de20f1bc845e05_b.jpg)

![](https://pic2.zhimg.com/v2-8815fc9fc013e540c3b8cf39f11491ed_b.jpg)

![](https://pic3.zhimg.com/v2-cc85254bcb349ae97fa59aeaa473c052_b.jpg)

![](https://pic1.zhimg.com/v2-8a2ad76521db34a2b2d627eef378fdb4_b.jpg)

## **1、模型图**

论文里的模型架构图一般我会使用PPT来画。下面的图来自Yongming Rao 在 ECCV2022的AMixer，使用PPT画下面的图是毫无压力的。这个图里也体现了一些作者的一些作图习惯。比如，图里不要出现过多的色彩，以蓝、黄、绿、红为主（色调都比较淡）。

推荐大家也多找一些优秀的论文图为模板，里面的颜色可以用截图来取（ALT+A可以调用微信的截图工具，能够看到每个元素的RGB色调）。也可以把图片粘贴到PPT里，用PPT里的滴管工具来取色。

![](https://pic4.zhimg.com/v2-917d709c464f873d5876ab9665435543_b.jpg)

我也阅读了Rao老师其它的论文，可以看到，他的论文绘图风格使用的色调、整体风格还是比较一致。

下图是CVPR022的DenseClip：

![](https://pic4.zhimg.com/v2-f71c138482fa2f32b6fd885a98909207_b.jpg)

下图是NeurIPS2022 的 P2P：

![](https://pic4.zhimg.com/v2-ec1ec286486f8f35fe42fb606dec073f_b.jpg)

  
这些图都是可以用PPT画出来的。需要注意的是：（1）色调不会很深，给人很舒服的感觉；（2）论文中需要给多个模块绘图，或者出现折线图、柱状图，颜色字体风格要前后一致。如果不一致会给人感觉很突兀。比如NeurIPS2022的P2P，因为使用了蓝、绿、紫、红、黄，在后面的实验里仍然使用这些颜色绘制柱状图，颜色字体也没有发生变化，风格非常一致（如下图）。（3）PPT文件可以直接导出为PDF，使用软件裁剪后即可插入到论文中，这样插入到论文里的是矢量图，效果非常好。（我买了wps会员，用wps pdf专业版裁剪的，如果有其他方式也可以）

![](https://pic2.zhimg.com/v2-478e176ced155f45093cd85b0f16eab9_b.jpg)

![](https://pic4.zhimg.com/v2-9d79ddad9b1ddfe3541cb923219d4453_b.jpg)

## 2、数据展示图

除了模型架构图以外，常用的折线图、柱状图、散点图等等，我建议使用 AxGlyph 来绘制，官网：[https://www.amyxun.com/](https://link.zhihu.com/?target=https%3A//www.amyxun.com/) 这是一个收费软件，价格为 36元，不是特别贵，可以支持一下国产软件。

下图是我用AxGlyph画的一个折线图供大家参考，[下载地址](https://link.zhihu.com/?target=https%3A//gaopursuit.oss-cn-beijing.aliyuncs.com/2023/demo_line.agx)。

![](https://pic3.zhimg.com/v2-92d2d3de5299f080ea6503e27d110662_b.jpg)

下图是我用AxGlyph画的一个柱状图供大家参考，[下载地址](https://link.zhihu.com/?target=https%3A//gaopursuit.oss-cn-beijing.aliyuncs.com/2023/demo_histo.agx)。

![](https://pic4.zhimg.com/v2-1208f226b70d2c86a19880e064663463_b.jpg)

当同时在论文里需要多个数据图、拆线图时，颜色也可以适当变化，如下图所示，效果也不错。

![](https://pic1.zhimg.com/v2-0c351bf9a56a8f385a017cba672fd144_b.jpg)

可以看出，AxGlyph绘制的图，是比 office 默认要美观的，而且支持直接导出为PDF，可以以矢量的形式直接在论文里使用。我最近论文里的一些展示数据的图也都是用AxGlyph绘制（如下图），效果比较好，所以向大家推荐这个工具。

![](https://pic2.zhimg.com/v2-312341e9f56ae78680a96e68608bcdb1_b.jpg)

##   
3、总结

个人感觉，正常的科研做图，用好PPT（画框架）和 AxGlyph（画数据），完全足够了。科研人员就像作家写小说，展示出来好的内容给读者。必须承认，就跟导演拍电影一样，需要天份，天份高的拍出来好看，天份不够的拍出来难看。但是，模仿别人的论文做图风格，使用别人的论文做图配色，是不算抄袭的。建议大家以某个学者的论文为模板多积累，坚持下去会显著提高水平。