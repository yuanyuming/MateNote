#Todo

# `ris:InkBottle`Notes
## 介绍
- 智能补全插件
	- YouComplete
		- 号称最全能
		- 功能
			- 语法智能补全
			- 语法检错
			- 函数跳转
		- 缺点
			- 依赖环境复杂
	- deoplete.nvim
	- coc.nvim
- 特点
	- 多种触发方式,支持手工触发
		- 默认使用always自动模式
			- 输入单词首字母以及trigger character触发补全
		- 可配置为trigger模式,仅在输入trigger character触发
		- none
			- 禁用自动触发
		- 任何模式下都可以使用快捷键手动触发
	- 模糊匹配,智能大小写
	- 多source异步并发获取,效率高
	- 支持通过删除字符纠正错误输入
		- 删除过多的字符不会导致补全停止
## 安装
### 安装node.js
```
curl -sL install-node.now.sh/lts | bash
```
### 安装coc.nvim
```
Plug 'neoclide/coc.nvim' , {'branch':'release'}
```
### 验证安装
命令行输入`:CocInfo`
有类似信息则为成功
![[Pasted image 20220815165132.png]]

## 配置
只有安装对应语言插件才有补全效果
### C/C++配置
在vim命令模式输入`:CocConfig`
配置coc.nvim配置文件`coc-settings.json`
```
{

    "languageserver": {

        "clangd": {

            "command": "clangd",

            "rootPatterns": [

                "compile_flags.txt",

                "compile_commands.json"

            ],

            "filetypes": [

                "c",

                "cc",

                "cpp",

                "c++",

                "objc",

                "objcpp"

            ]

        }

    }

}
```
主要依赖clangd进行代码补全,需要安装clangd
> [!help] 
> 
> [更多语言支持](https://github.com/neoclide/coc.nvim/wiki/Language-servers#supported-features)

## 进阶
### 安装其他拓展
- `CocInstall 插件名` :安装
- `CocUninstall 插件名` :移除
- `CocList extensions` :查看已安装
- `CocUpdate` :更新

[更多拓展帮助](https://github.com/neoclide/coc.nvim)

### 对coc进行映射扩展
```
" Use `[g` and `]g` to navigate diagnostics

nmap <silent> [g <Plug>(coc-diagnostic-prev)

nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.

nmap <silent> gd <Plug>(coc-definition)

nmap <silent> gy <Plug>(coc-type-definition)

nmap <silent> gi <Plug>(coc-implementation)

nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()

if (index(['vim','help'], &filetype) >= 0)

execute 'h '.expand('<cword>')

else

call CocAction('doHover')

endif

endfunction
```

# `fas:ShoePrints`Cue
- 这里写线索

# `ris:Loader`Summary
- 这里写总结

>[!link]
> [[2022-08-15 Vim学习]]

