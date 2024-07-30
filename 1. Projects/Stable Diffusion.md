---
aliases: 'Pony Diffusion V6 **XL**'
tags: 
cssclass:
source:
date created: 2024-07-22 20:56
created: "2024-07-21 15:33"
updated: "2024-07-29 11:53"
---

# Pony Diffusion V6 **XL**

<https://civitai.com/models/257749/pony-diffusion-v6-xl>

- 重要信息：
  - 加载此模型需用 clip skip 2（部分软件中为 -2），否则图像质量差。
- 该模型支持多种风格，有默认提示模板可生成高质量样本，无需负面提示和其他设置。包含 score_9、score_8_up、score_7_up、score_6_up、score_5_up、score_4_up 等标签。
  - 此前 Pony Diffusion 模型的 score_9 较简单，V6 XL 版的较长版本是训练问题，效果弱。可在此了解更多关于这些标签的信息。
- 模型多数情况无需负面提示和如“hd”“masterpiece”等修饰符。
- 特殊数据选择标签有：'source_pony'、'source_furry'、'source_cartoon'、'source_anime'，还有'rating_safe'、'rating_questionable'、'rating_explicit'评级。
- 模型能识别众多角色和系列。若要小马风格，建议用“anthro/feral pony, 提示其余部分”或“source_pony, 提示其余部分”模板。
- 基于自然语言提示和标签训练，能理解两者。用正常语言描述通常可行，也可添加标签增强。
- 建议用 Euler a，25 步，1024px 分辨率，能处理多数 SDXL 分辨率。
- 模型有时生成难去除的伪签名，这是训练问题，未来纠正。若有问题，可试 V5.5 或修复。

# [PONY XL] Yabuki Kentarou/矢吹健太朗 《To LOVE RU》/《To LOVEる -とらぶる-》/《出包王女》 - Artist Style

<https://civitai.com/models/347905/pony-xl-yabuki-kentarou-to-love-ruto-love-artist-style>

Animagine XL V3版本：<https://civitai.com/models/275386>

Neta Art XL版本：<https://civitai.com/models/463454>

SD1.5版本：<https://civitai.com/models/136677>

可以使用以下角色提示词：

| 名字       | 发音                      |
| -------- | ----------------------- |
| 结城梨斗     | `yuuki rito`            |
| 夕崎梨子     | `yuusaki riko`          |
| 菈菈       | `lala satalin deviluke` |
| 娜娜       | `nana asta deviluke`    |
| 梦梦       | `momo velia deviluke`   |
| 西连寺春菜    | `haruna sairenji`       |
| 结城美柑     | `yuuki mikan`           |
| 金色之暗伊芙   | `konjiki no yami`       |
| 古手川唯     | `kotegawa yui`          |
| 黑咲芽亚     | `kurosaki meia`         |
| 露恩       | `run elise jewelria`    |
| 天条院沙姬    | `Tenjiuin Saki`         |
| 雾崎恭子     | `Kirizaki Kyoko`        |
| 御门凉子     | `Ryuko Mikado`          |
| 提亚悠·鲁娜提克 | `Tearju Lunatique`      |
| 涅墨西斯     | `Nemesis`               |
| 籾冈里纱     | `Momioka Risa`          |
| 九条凛      | `Kujou Rin`             |

# PD for Anime

<https://civitai.com/models/315596/pd-for-anime>
**Prompting Guide**

**・1girl/1boy/2girls..., characters, copyright, style, general tags, rating, score_9, score_8_up, score_7_up.**

Negative Prompts

・score_4, score_5, score_6, source_pony, source_furry, monochrome, realistic, rough sketch, fewer digits, extra digits
