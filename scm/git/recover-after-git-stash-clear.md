# git stash clear 后，找回 stash 的代码

使用`git stash`隐藏工作区内修改但未提交的代码，`git stash list`查看`stash`的历史记录，`git stash clear`清除所有的stash栈。

有时候可能不小心`git stash clear`掉了所有的记录，可是那些代码还有用。哎呀，杯具了，白写了！其实不用慌，可用下面的方法找回：

```sh
git fsck --no-reflogs 2>&1 | awk '/dangling commit/ {print $3}' | xargs git show --stat
```

上述命令得到了所有dangling commit，其描述，以及修改的文件列表。观察一下，`stash`记录描述以`WIP`开头（work in progress缩写，进行中的工作），结合修改文件列表就能找到那个commit了。

然后执行``git cherry-pick``或者``git stash apply``命令就可以恢复了，参数是那个commit id。

**解析**：

> ``git fsck``找出所有dangling的对象，也可以不加`--no-reflogs`参数。`2>&1`为了隐藏烦人的错误输出，可不加。  
> ``awk``过滤commit类型，并输出commit id值  
> ``xargs git show --stat``对所有commit_id执行`git show --stat`命令  
