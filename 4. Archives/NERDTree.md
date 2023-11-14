
#Todo

# `ris:InkBottle`Notes
## 介绍
目录树,在不退出vim编辑器前提下,快速切换文件

## 安装
使用plug-vim
```
call plug#begin()
Plug 'preservim/nerdtree'
call plug#end()
```

## 配置
默认无需配置
可在`~/.vimrc`添加指令
```
map <C-n> :NERDTreeToogle<CR>
```
使用Ctrl+n快速开启目录树

## 使用
通过vim的command模式输入
- `?` : 快速帮助文档
- `o` : 打开一个目录或文件,创建buffer.打开书签
- `go` : 打开一个文件,创建buffer.光变依然留在NERDTree
- `t` : 打开文件,创建Tab,对书签生效
- `T` : 打开文件,光标留在NERDTree,创建Tab,对书签生效
- `l` : 水平分割创建文件的窗口,创建buffer
- `gl` : 水平分割创建文件的窗口,光标留在NERDTree
- `s` : 垂直分割创建文件的窗口,创建buffer
- `gs` : 垂直分割创建文件的窗口,光标留在NERDTree
- `x` : 收起当前打开的目录
- `X` : 收起所有打开的目录
- `e` : 以文件管理器打开选中目录
- `D` : 删除书签

# `fas:ShoePrints`Cue
- 这里写线索

# `ris:Loader`Summary
- 这里写总结

>[!link]
> [[2022-08-15 Vim学习]]
>- 
