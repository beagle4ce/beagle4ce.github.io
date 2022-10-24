#!/bin/sh

echo 'Start hugo hook'

hugo -D

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

echo 'Finished'