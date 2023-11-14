## main.exe


-ins  --color -t 12 --in-prefix "[User] :" --in-suffix  "[Assistant] :" --multiline-input -f startup.txt -c 4096 

./main -m mistral-7b-openorca.Q4_K_M.gguf --color -c 2048 --temp 0.7 --repeat_penalty 1.1 -n -1 -p "<|im_start|>system\n{system_message}<|im_end|>\n<|im_start|>user\n{prompt}<|im_end|>\n<|im_start|>assistant"

### 选项

- `-h, --help`: 显示帮助信息并退出
- `-i, --interactive`: 以交互模式运行
- `--interactive-first`: 以交互模式运行并立即等待输入
- `-ins, --instruct`: 使用阿帕卡模型的指令模式
- `--multiline-input`: 允许输入多行文本而无需使用`\`结束每行
- `-r PROMPT, --reverse-prompt PROMPT`: 在特定提示处停止生成，并返回交互模式控制
- `--color`: 使用颜色区分提示、用户输入和生成内容
- `-s SEED, --seed SEED`: 随机数种子
- `-t N, --threads N`: 生成时使用的线程数
- `-tb N, --threads-batch N`: 批处理和提示处理时使用的线程数
- `-p PROMPT, --prompt PROMPT`: 生成的起始提示语
- `-e, --escape`: 处理提示中的转义序列
- `--prompt-cache FNAME`: 用于快速启动的提示状态缓存文件
- `--prompt-cache-all`: 如果指定，也将用户输入和生成内容保存到缓存中
- `--prompt-cache-ro`: 使用提示缓存但不更新它
- `--random-prompt`: 使用随机化的提示语开始生成

### 生成设置

- `-n N, --n-predict N`: 预测的标记数量
- `-c N, --ctx-size N`: 提示上下文的大小
- `-b N, --batch-size N`: 提示处理的批处理大小
- `--top-k N`: 使用 top-k 抽样
- `--top-p N`: 使用 top-p 抽样
- `--tfs N`: 使用 tail free 抽样
- `--typical N`: 使用局部典型抽样
- `--repeat-last-n N`: 考虑用于惩罚的最后 n 个标记
- `--repeat-penalty N`: 惩罚标记序列的重复
- `--presence-penalty N`: 重复 alpha 出现惩罚
- `--frequency-penalty N`: 重复 alpha 频率惩罚
- `--mirostat N`: 使用 Mirostat 抽样
- `--mirostat-lr N`: Mirostat 学习速率
- `--mirostat-ent N`: Mirostat 目标熵
- `-l TOKEN_ID(+/-)BIAS, --logit-bias TOKEN_ID(+/-)BIAS`: 修改生成完成中标记出现的可能性
- `--grammar GRAMMAR`: 用于限制生成的 BNF 类似语法

### 其他设置

- `--hellaswag`: 计算来自数据文件的随机任务的 HellaSwag 分数
- `--draft N`: 用于推测解码的标记数量
- `--chunks N`: 处理的最大块数
- `-np N, --parallel N`: 解码的并行序列数
- `-ns N, --sequences N`: 解码的序列数
- `-cb, --cont-batching`: 启用连续批处理
- `--mmproj MMPROJ_FILE`: 用于 LLaVA 的多模态投影仪文件路径
- `--image IMAGE_FILE`: 图像文件路径，用于多模态模型
- `--mlock`: 强制系统将模型保留在 RAM 中
- `--no-mmap`: 不使用内存映射模型
- `--numa`: 尝试优化适用于某些 NUMA 系统的设置
- `-ngl N, --n-gpu-layers N`: 存储在 VRAM 中的层数
- `-ngld N, --n-gpu-layers-draft N`: 用于推测解码的 VRAM 中的层数
- `-ts SPLIT, --tensor-split SPLIT`: 如何在多个 GPU 上分割张量
- `-mg i, --main-gpu i`: 用于临时和小张量的 GPU
- `--verbose-prompt`: 在生成之前打印提示
- `--simple-io`: 使用基本 IO，以便在子进程和有限控制台中获得更好的兼容性
- `--lora FNAME`: 应用 LoRA 适配器
- `--lora-scaled FNAME S`: 使用用户定义的缩放应用 LoRA 适配器
- `--lora-base FNAME`: 用作 LoRA 适配器修改层的基础的可选模型
- `-m FNAME, --model FNAME`: 模型路径
- `-md FNAME, --model-draft FNAME`: 用于推测解码的草稿模型路径
- `-ld LOGDIR, --logdir LOGDIR`: 保存 YAML 日志的路径




## startup

As a personal assistant, computers need to have the following three abilities:
* **Understanding and responding to user input:** The personal assistant needs to be able to understand user input and provide appropriate responses based on user input. When responding to user input, the personal assistant should avoid responding to irrelevant content.
* **Friendly communication with users:** The personal assistant needs to be able to communicate with users in a friendly way, making users feel valued.
* **Providing accurate and timely assistance:** The personal assistant needs to be able to provide accurate and timely assistance, making users feel satisfied.
## Specific requirements for interaction with users:
* **Always maintain a friendly attitude:** The personal assistant should interact with users in a polite and respectful manner, avoiding the use of rude or offensive language.
* **Proactively provide assistance:** The personal assistant should take the initiative to understand user needs and strive to provide assistance.
* **Promptly resolve issues:** The personal assistant should resolve user issues as soon as possible, avoiding keeping users waiting for long periods of time.

## Notes
- User input is prefixed with `[User]:` and personal assistant output is prefixed with `[Assistant]:`.
- Markdown markup language is used for interaction between users and assistants.
Fellowing is the dialog.
---