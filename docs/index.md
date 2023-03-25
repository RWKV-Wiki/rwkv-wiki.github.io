title: RWKV Wiki

<center><img src="img/huge_logo.png" alt="RWKV" width="30%" /></center>

## 欢迎来到 **RWKV Wiki**

> **RWKV** is an **attention-free RNN**, thus **faster** and **saves VRAM**. It also supports a GPT-mode for parallelized training.  
> **RWKV** 是一种**无需注意力**机制的**循环神经网络**，因此速度更**快**且更**省**显存。它还支持 GPT 模式并行训练。
> 
> —— Peng Bo，RWKV 作者，Reddit  
> （原文为 RWKV-4）

**RWKV** 是由 Peng Bo 受 AFT（Attention-Free Transformer）等语言模型启发，设计并进一步开发的一种**大型语言模型**（Large Language Model）。

**RWKV Wiki** 是由 RWKV 社区自发创办的开放文档站点，致力于持续整合 RWKV 模型的有关资料，并推进 RWKV 及有关模型的开发。

## 我怎么感觉它和 [R-Transformer](https://arxiv.org/abs/1907.05572) 没啥区别呢？

严格来说二者根本不是一种模型，甚至设计的动机都不一样。 R-Transformer 是针对高维嵌入导致位置编码失效的解决方案，而 RWKV 是针对 Self-Attention 的改进。

![GPT versus RWKV](img/GPT_versus_RWKV.svg)

包括 GPT 在内，所有基于 Self-Attention 的模型都面临以下两个问题：

* Self-Attention 使用的缩放点积注意力并不包含 Token 以及 Token 之间的位置信息。
* 整个序列中的每个 Token 都需要相互运算，导致训练与推断复杂度不佳（$O(n^2)$）。

RWKV 通过使用 [WKV 计算](/model/wkv.md) 代替 Self-Attention 同时解决了上述两个问题：

* WKV 计算过程直接向 Token 引入了具有平移不变性的位置编码，不需要引入额外的位置编码。
* Token 之间无需相互运算，WKV 计算过程只对各 Token 分别变换并累加结果（$O(n)$）。

此外，WKV 计算也可以实现类似 Self-Attention 的 Cache，从而在连续推断时也有 $O(n)$ 的时间复杂度。

更多常见问答请见 [FAQ](/intro/faq.md)。

## 致谢

本项目受 CTF Wiki 及 OI Wiki 的启发，在排版过程中参考了诸多资料，在此一并致谢。

罗马不是一天建成的，RWKV 的建设也离不开许多人的帮助，而且需要更多有志之士的参与。

受篇幅所限，完整的致谢名单不能在此列出，[请点击这里访问](/intro/thanks.md)。
