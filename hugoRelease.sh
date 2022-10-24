#!/bin/sh

echo 'Start hugo hook\n'

# 打包部署
hugo -D

# $? 的含义是获取上一个命令执行的状态返回值.
# echo '===============' + $?

# ((...)) 双小括号内才能用> < == 进行条件判断,否则用[...] 中括号,只能用-eq,-ne,-gt,-ge,-lt,-le进行判断
# 判断上一个命令执行结果是否是成功
if (($? > 0))
then
    exit 1
fi

# 拷贝到发布区
cp -R public/* docs/

# 添加所有追踪
git add .

# 提交
git commit -am "Upload new posts or updated to github."

# echo '===============' + $?
if (($? > 0))
then
    exit 1
fi

echo '\n\n'

# 推送
git push origin main

# echo '===============' + $?

if (($? > 0))
then
    exit 1
fi

echo '\n'

echo 'Finished'