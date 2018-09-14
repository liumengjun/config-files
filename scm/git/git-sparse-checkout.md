# git clone/checkout 克隆或下载仓库中指定文件/文件夹(目录)

对比svn，svn可以更新或下载特定目录(甚至精确控制每个目录权限)，可是git不可以吗？在Git1.7.0以前，这无法实现，但是幸运的是在Git1.7.0以后加入了Sparse Checkout（直译为：稀疏检出）模式，这使得Check Out指定文件或者目录成为可能。操作如下：


### 对于已有项目

```sh
# 使能Sparse Checkout(稀疏检出)
git config core.sparsecheckout true
# 编辑'.git/info/sparse-checkout'，规则类似gitignore。比如
echo '
/src
readme.md
' > .git/info/sparse-checkout
# 只保留根目录下/src目录和readme.md文件
git checkout
# ls，就可以看到内容已经变了，只有src和readme.md两项
```


### 对于新项目

```sh
git init newdir && cd newdir
# 使能Sparse Checkout(稀疏检出)
git config core.sparsecheckout true
# 编辑'.git/info/sparse-checkout'，具体略
git remote add origin git@github.com:yourname/yourrepo.git
# 下载
git pull origin master
```
