
#Todo

# `ris:InkBottle`Notes
## 简介
在Visual模式下快速注释和取消注释多行代码
在行尾追加注释并自动进入insert模式,方便进行行内注释

## 安装
```
Plug 'preservim/nerdcommenter'
```

## 配置

```
" Add spaces after comment delimiters by default 
let g:NERDSpaceDelims = 1 

" Use compact syntax for prettified multi-line comments 
let g:NERDCompactSexyComs = 1 

" Align line-wise comment delimiters flush left instead of following code indentation 
let g:NERDDefaultAlign = 'left' 

" Set a language to use its alternate delimiters by default 
let g:NERDAltDelims_java = 1 

" Add your own custom formats or override the defaults 
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } 

" Allow commenting and inverting empty lines (useful when commenting a region) 
let g:NERDCommentEmptyLines = 1 

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1 

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1
```

## 使用
- `\cc` : 注释当前行和选中行
- `\cn` : 
- `\c ` : 如果选中区域有部分被注释,取消;其他情况反转注释
- `\cm` : 对选中区域用一对注释符进行注释
- `\ci` : 反转注释
- `\cs` : 增加高级注释,代码开头
- `\cy` :增加注释并复制
- `\c$` : 注释当前光标到行尾
- `\cA` : 跳转到改行捍卫增加注释,进入编辑模式
- `\ca` : 转换注释的方式
- `\cl` `\cb` : 针对`/*  */` 左对齐和左右对齐
- `\cu` : 取消注释
# `fas:ShoePrints`Cue
- 这里写线索

# `ris:Loader`Summary
- 这里写总结

>[!link]
>
>- 
