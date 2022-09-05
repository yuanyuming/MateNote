
#Todo

# `ris:InkBottle`Notes
## 环境迁移
使用`pyenv`+`virtualenv`
- 如果没有修改库的源码
	- `pip freeze` 生成 `requirements.txt`文件
	- 在新机器`pip install -r requirements.txt`
- 如果修改了某些库
	- `virtualenv -relocatable` 将绝对路径改为相对路径
	- 将bin目录下的文件首行解释器路径改为相对

## 自动配置脚本
### alias
减少敲击数
```
function enshort() {
	alias l='ls -a'
	alias d='du -h --max-depth 1'
	alias n='nvidia-smi'
	alias vb='vi ~./bashrc'
	alias sb='. ./.bashrc'
	alias sc='screen'
	alias nvfind='fuser -v /dev/nvidia*'
	alias nving='watch -n 0.1 nvidia-smi'
}
```
可以将函数封装在`virtualenv`的启动脚本

### bash function
减少流程命令数
```
# Usage: psfind <keyword> (RegExp Supported)
function psfind() {
	ps aux | head -n 1
	ps aux | grep -E $1 | grep -v grep
}
```
支持进程号,关键词,正则表达式

## 文本处理相关
### 查看
查看文件前100行
```
head -100 train.csv
```
查看最后一行
```
tail -f log
```
[[grep使用]]
```
cat eval.log ! grep '\[dev'
```
[[awk]]
[[sed]]
### 处理
sort 排序
uniq 去重
cut 从csv文件去除某些列
```
cat train.tsv | cut -f 4.5.6 > train.tsv.cut
```
paste 横向连接两个文件
shuf shuffle操作
wc -l 确定行数
### 并行
```
for i in {0..99}:
do 
	python process.py train.tsv.part$i >train.tsv.part$i.tmp &
done
wait
cat *.tmp > train.tsv.processed
rm *part*
```
`pkill -f 'process.py'` 杀死包含某名字的进程
## shell输出过量
使用`ctrl z`将进程后台
使用`kill %n`杀死,一般为1,除非还有其他后台进程
# `fas:ShoePrints`Cue
- 这里写线索

# `ris:Loader`Summary
- 这里写总结

>[!link]
>
>- 
