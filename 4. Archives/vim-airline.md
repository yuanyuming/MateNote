
#Todo

# `ris:InkBottle`Notes
## 介绍
底部状态栏增强美化插件
可以试试提示该文件有多少报错和警告

## 安装
```
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
```

## 配置
```
let laststatus=2 "永远显⽰状态栏 
let g:airline_powerline_fonts = 1 " ⽀持 powerline 字体 
let g:airline#extensions#tabline#enabled = 1 “ 显⽰窗⼝tab和buffer 
let g:airline_theme='moloai' " murmur配⾊不错 

if !exists('g:airline_symbols') 
let g:airline_symbols = {} 
endif 
let g:airline_left_sep = '▶' 
let g:airline_left_alt_sep = '❯' 
let g:airline_right_sep = '◀' 
let g:airline_right_alt_sep = '❮' 
let g:airline_symbols.linenr = '¶' 
let g:airline_symbols.branch = '⎇'
```
# `fas:ShoePrints`Cue
- 这里写线索

# `ris:Loader`Summary
- 这里写总结

>[!link]
>[[2022-08-15 Vim学习]]
>- 
