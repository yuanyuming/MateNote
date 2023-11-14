
#Todo

# `ris:InkBottle`Notes
## 统一概念
- 工作区:改动(增删文件和内容)
- 暂存区:`git add 改动的文件名`
- 本地仓库:`git commit 描述` 改动放到本地仓库,
	- 版本: 一个commit
- 远程仓库:`git push 远程仓库`
- commit-id:`git log` 上面的commit xxxx
## 命令用法
#### 库管理
`git help -g` 展示帮助信息
`git fetch --all && git reset --head origin/master` 回到远程仓库的状态
`git update-ref -d HEAD` 重设第一个commit 将所有改动放回工作区,清空所有commit,可重新提交第一个commit
#### 显示区别
`git diff` 展示工作区和缓存区不同
`git diff <commit-id> <commit-id>` 两个commit不同
`git diff --cached` 暂存区和本地最近commit不同
`git diff HEAD` 工作区,暂存区,最近commit不同
### 分支管理
`git checkout -` 切换到上一个分支
`git branch --merged master |grep -v '^\*\| master' | xargs -n 1 git` 移除合并到master的分支
`git branch -vv` 显示本地分支关联远程仓库情况
`git branch -u origin/mybranch` 关联远程分支,Push时可直接Push,不用指定
	或者`git push origin/mybranch -u`
`git branch -r` 列出所有远程分支
`git checkout -b <branch-name>` 构建并切换到本地分支
`git checkout -b <branch-name> origin/<branch-name>` 从远程分支构建并切换到本地分支
`git branch -d <local-branchname>` 移除本地分支
	`git push origin :<remote-branchname>`
`git branch -m <new-branchname>` 重命名本地分支
### 标签管理
`git tag` 查看标签
`git describe --tag --abbrev-0` 显示当前分支最近的tag
`git tag -ln` 查看标签详细信息
`git tag <version-number>` 本地构建标签
	默认打到最近一次commit
`git tag -a <version-number> -m "v1.0 描述" <commit-id>` 指定commit打tag
`git push orgin <local-version-number>` 本地构建标签之后才可以push到远程仓库
`git push orgin --tags` 一次push所有标签
`git tag -d <tag-name>` 移除本地标签
`git push orgin :ref/tags/<tags-name>` 移除远程标签
`git checkout -b branch_name tag_name` 切换某个标签
`git checkout <file-name>` 放弃工作区更改
`git checkout .` 放弃所有更改
### 恢复更改
`git rev-list -n 1 HEAD -- <file_path>` 得到deleting_commit
`git checkout <deleting_commit>^ -- <file_path>` 回到删除文件deleting
`git revert <commit-id>` 以新commit方式还原某个commit更改
#### 回到某个commit状态并移除之后的commit
- `git reset <commit-id>` 默认开启`-mixed`
	- `git reset -mixed HEAD^` 返回上一个版本
	- `git reset -soft HEAD~3` 回退到三个版本前
	- `git reset -hard <commit-id>` 彻底回退到指定`commit-id`
### Commit
`git commit --amend` 如果缓存区有改动,将改动提交到上一个commit
### 查看
`git log` 查看commit历史
`git blame <file-name>` 查看某代码的贡献者
`git reflog` 显示本地更新过HEAD的git命令记录,如commit amend reset等
### 更改
`git commit --amend --author='Author Name <email>'` 更改作者名
`git romote set-url origin <URL>` 更改远程仓库URL
`git remote add origin <remote-url>` 增加远程仓库
`git remote` 举出所有远程仓库
`git whatchanged --since='2 weeks ago'` 查看两星期内改动
`git checkout <branch-name> && git cherry-pick <commit-id>` 把A分支commit放到B上
## 别名
`git config -global alias.<handle> <command>`
- `git config --global alias,st status`
	- `git st`
### stash
`git stash` 保存当前更改但不提交commit
`git stash -u` 存储当前状态,包括untracked文件(新建文件)
`git stash list` 显示所有stashes
`git stash apply <stash@{n}>` 回到某个stash状态
`git stash pop` 回到最后一个stash状态.并移除这个stash
`git stash clear` 移除所有stash
`git checkout <stash@{n} -- <file-path>` 从stash中拿出某个文件更改
`git ls-files -t` 显示所有tracked文件
`git ls-files --others` 显示所有untracked 文件
`git ls-files --others -i --exclude-standard` 显示所有忽略文件
`git clean <file-name> -f` 强制移除untracked文件,无法找回,只移除untracked文件
`git clean <directory-name> -df` 强制移除untracked 目录
`git log --pretty=oneline --graph --decorate --all` 显示简化commit历史
### 导出
`git bundle create <file> <branch-name>` 把某分支导出成一个文件
`git clone repo.bundle <repo-dir> -b <branch-name>` 从包导入分支
`git rebase --autostash` 执行rebase自动stash
`git fetch origin pull/<id>/head:<branch-name>` 从远程仓库根据id拉某一状态到本地分支
`git diff --word-diff` 详细显示一行中的更改
`git clean -X -f` 清除gitignore文件记录中的文件
`git config --local(--global) --list` 显示alias和configs
`git status --ignored` 显示忽略的文件
`git log Branch1 ^Branch2`显示历史中Branch1有但是2没有的commit
`git log --show-signature` 在commit log中显示GPG签名
`git config -global --unset <entry-name>` 移除全局设置
`git checkout --orphan <branch-name>` 新建并切换到新分支
`git show <branch-name>:<file-name>` 显示任意分支某一文件的内容
`git clone -b <branch-name> --single-branch <URL>` clone单一分支
`git update-index --assume-unchanged <filepath>` 忽略某个文件改动
`git update-index --no-assume-unchanged <filepath>` 恢复track文件改动
`git config core.fileMode false` 忽略文件权限变化
`git for-each-ref --sort=-committerdate --format='%(refname:short)'` 以最后提交顺序举出所哟git分支
`git log --all --grep='<given-text>'` 在commit log查找相关内容
`git reset <file-name>` 把暂存区指定file放到工作区
`git push -f <remote-name> <branch-name>` 强制push
## 使用流程
### 创建新仓库
创建新文件夹,打开,执行
`git init`
### 检出仓库
#### 本地仓库的克隆版本
`git clone /path/to/repository`
#### 远程仓库
`git clone username@host:/path/to/repository`
#### 工作流
![[Pasted image 20220826154340.png]]
本地仓库由三个树构成
1. 工作目录 Working Dir 持有实际文件
2. 暂存区 Index 缓存区域,临时保存改动
3. HEAD 指向最后一次提交的结果

#### 添加和提交
向git中添加文件
`git add <filename>`  
`git add *`
提交改动
`git commit -m "代码提交信息"`
这时改动提交到了HEAD但是没有和远端仓库同步

#### 推送改动
`git push origin master` 将改动提交到远端仓库 master可以换成其他分支
`git remote add origin <server>`添加仓库到某远程服务器

#### 分支
用于将特性开发绝缘,默认为master分支,可在其他分支开发,之后合并到主分支
![[Pasted image 20220826165342.png]]
- 创建分支
	- `git checkout -b feature_x`
- 切换回主分支
	- `git checkout master`
- 删除分支
	- `git checkout master`
- 推送分支到远端仓库
	- `git push origin <branch>`

### 更新与合并
- 更新本地仓库至最新改动
	- `git pull`
- 以当前工作目录获取(fetch)并合并(merge),合并其他分支到当前分支
	- `git merge <branch>`
- 出现冲突,手动修改文件手动合并冲突
	- 修改完成后使用`git add <filename>` 标记合并成功
	- 改动前可使用`git diff <source_branch> <target>` 预览差异

### 标签
软件发布时创建
创建标签
`git tag 1.0.0 1b2e1d63ff`
_1b2e1d63ff_ 是你想要标记的提交 ID 的前 10 位字符
`git log` 用于获取提交ID,也可以在唯一的情况使用较短的前几位ID

### log
了解本地仓库的历史记录 `git log`
只看某一个人的提交记录 `git log --author=bob`
每一条提交记录只占一行的输出 `git log --pretty=oneline`
通过 ASCII 艺术的树形结构来展示所有的分支, 标示名字和标签 `git log --graph --oneline --decorate --all`
查看文件改动 `git log --name-status`
更多帮助 `git log --help`

### 替换本地改动
`git checkout -- <filename>`
使用HEAD中最新内容替换工作目录文件

丢弃在本地的所有改动与提交，到服务器上获取最新的版本历史，并将本地主分支指向它
`git fetch origin`  
`git reset --hard origin/master`

### 其他实用内容
内建的图形化 git：  
`gitk`  

彩色的 git 输出：  
`git config color.ui true`  

显示历史记录时，每个提交的信息只显示一行：  
`git config format.pretty oneline`  

交互式添加文件到暂存区：  
`git add -i`


# `fas:ShoePrints`Cue
- 这里写线索

# `ris:Loader`Summary
- 这里写总结

>[!link]
>-   [Git 社区参考书](http://book.git-scm.com/)
>-   [专业 Git](http://progit.org/book/)
>-   [像 git 那样思考](http://think-like-a-git.net/)
>-   [GitHub 帮助](http://help.github.com/)
>-   [图解 Git](http://marklodato.github.io/visual-git-guide/index-zh-cn.html)
>- 
