#!/bin/sh

echo 'Start hugo hook\n'

hugo -D

# $? 的含义是获取上一个命令执行的返回值.
echo '===============' + $?
if $? > 0
then
    exit 1
fi

cp -R public/* docs/

git add .

git commit -am "Upload new posts or updated to github."

echo '===============' + $?
if $? > 0
then
    exit 1
fi

echo '\n\n'

git push origin main

echo '===============' + $?
if $? > 0
then
    exit 1
fi

echo '\n'

echo 'Finished'