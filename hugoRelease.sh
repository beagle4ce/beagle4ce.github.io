#!/bin/sh

echo 'Start hugo hook\n'

hugo -D

# $? 的含义是获取上一个命令执行的返回值.
if $? > 0
then
    exit 1
fi

cp -R public/* docs/

git add .

git commit -am "Upload new posts or updated to github."

if $? > 0
then
    exit 1
fi

echo '\n\n'

git push origin main

if $? > 0
then
    exit 1
fi

echo '\n'

echo 'Finished'