

# `ris:InkBottle`Notes
## Vim-plug 介绍
- 插件管理工具
	1. 没有插件管理器时,需要手动下载tarball文件,解压到`~/.vim`
	2. 当插件多时难以管理
- 功能	
	1. 将安装插件的文件保存在单独目录
	2. 并行安装更新插件
	3. 回滚更新
	4. 按需加载插件

## 安装
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

## 配置
安装插件需要在Vim配置文件中声明
一般配置文件为`~/.vimrc`
- 在配置文件中声明插件时
	- 以`call plug#begin(PLUGIN_DIRECTORY)`开始
	- `plug#end()`结束
### 举例
安装”lightline.vim”插件
在VIm配置文件顶部添加
```
call plug#begin('~/.vim/pligged')
Plug 'itchyny/lightline.vim'call
plug#end()
```

## 使用
- `:PlugStates` 查看插件状态
- `:PlugInstall` 安装在配置文件中声明的插件

# `fas:ShoePrints`Cue
- 这里写线索

# `ris:Loader`Summary
- 这里写总结

>[!link]
>- [[2022-08-15 Vim学习]]

